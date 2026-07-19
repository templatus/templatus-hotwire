import { Controller } from '@hotwired/stimulus';
import * as timeago from 'timeago.js';

export default class extends Controller<HTMLElement> {
  connect() {
    timeago.render(this.element);
  }

  disconnect() {
    // Scoped to this element: a bare cancel() would stop the timers of every
    // other timeago element on the page as well.
    timeago.cancel(this.element);
  }
}
