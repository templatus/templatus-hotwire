import { Controller } from '@hotwired/stimulus';
import { renderStreamMessage } from '@hotwired/turbo';

// Loads the next page of an endlessly scrolling list once the element it is
// attached to comes close to the viewport. The server answers with a Turbo
// Stream that appends the records and replaces this element with the next
// sentinel (or an empty one, which ends the scrolling).
const RETRY_AFTER = 3000;

export default class extends Controller {
  static values = { url: String };

  declare readonly urlValue: string;

  private observer?: IntersectionObserver;
  private abortController?: AbortController;
  private retryTimer?: ReturnType<typeof setTimeout>;
  private loading = false;

  connect() {
    if (!this.urlValue) return;

    this.observer = new IntersectionObserver(
      (entries) => {
        if (entries.some((entry) => entry.isIntersecting)) void this.load();
      },
      // Start loading before the sentinel is actually visible, so the next
      // batch is usually there by the time the user scrolls down to it
      { rootMargin: '400px' },
    );

    this.observer.observe(this.element);
  }

  disconnect() {
    this.observer?.disconnect();
    this.observer = undefined;

    // Drop an in-flight request, so its stream can't render into a page the
    // user has already navigated away from.
    this.abortController?.abort();
    this.abortController = undefined;

    clearTimeout(this.retryTimer);
    this.retryTimer = undefined;
  }

  private async load() {
    if (this.loading) return;

    this.loading = true;
    this.observer?.disconnect();
    this.abortController = new AbortController();

    try {
      const response = await fetch(this.urlValue, {
        headers: { Accept: 'text/vnd.turbo-stream.html' },
        signal: this.abortController.signal,
      });

      if (!response.ok) throw new Error(`Request failed: ${response.status}`);

      renderStreamMessage(await response.text());
    } catch (error) {
      if (this.abortController?.signal.aborted) return;

      // On success the server replaces this sentinel with the next one, so the
      // observer is gone for good. On failure it stays, and without resuming
      // observation here the endless scrolling would be dead for the session.
      // The delay matters: observe() re-fires immediately while the sentinel is
      // still in view, which would busy-loop against a failing server.
      console.error(error);
      this.retryTimer = setTimeout(() => {
        this.observer?.observe(this.element);
      }, RETRY_AFTER);
    } finally {
      this.loading = false;
    }
  }
}
