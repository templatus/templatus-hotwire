import { Controller } from '@hotwired/stimulus';
import { renderStreamMessage } from '@hotwired/turbo';

// Loads the next page of an endlessly scrolling list once the element it is
// attached to comes close to the viewport. The server answers with a Turbo
// Stream that appends the records and replaces this element with the next
// sentinel (or an empty one, which ends the scrolling).
export default class extends Controller {
  static values = { url: String };

  declare readonly urlValue: string;

  private observer?: IntersectionObserver;
  private loading = false;

  connect() {
    if (!this.urlValue) return;

    this.observer = new IntersectionObserver(
      (entries) => {
        if (entries.some((entry) => entry.isIntersecting)) this.load();
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
  }

  private async load() {
    if (this.loading) return;

    this.loading = true;
    this.observer?.disconnect();

    try {
      const response = await fetch(this.urlValue, {
        headers: { Accept: 'text/vnd.turbo-stream.html' },
      });

      if (response.ok) renderStreamMessage(await response.text());
    } finally {
      this.loading = false;
    }
  }
}
