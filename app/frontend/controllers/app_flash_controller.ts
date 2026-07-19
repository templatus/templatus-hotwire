import { Controller } from '@hotwired/stimulus';

import { enter, leave } from 'el-transition';

const AUTO_DISMISS_AFTER = 2000;

export default class extends Controller {
  private timer?: ReturnType<typeof setTimeout>;
  private disconnected = false;

  connect() {
    this.disconnected = false;

    void enter(this.element).then(() => {
      if (this.disconnected) return;

      this.timer = setTimeout(() => {
        this.remove();
      }, AUTO_DISMISS_AFTER);
    });
  }

  // Turbo can navigate away long before the timer fires. Without this the
  // callback would run against an element that is no longer in the document.
  disconnect() {
    this.disconnected = true;
    clearTimeout(this.timer);
    this.timer = undefined;
  }

  remove() {
    clearTimeout(this.timer);

    void leave(this.element).then(() => {
      this.element.remove();
    });
  }
}
