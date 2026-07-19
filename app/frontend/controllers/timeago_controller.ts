import { Controller } from '@hotwired/stimulus';
import * as timeago from 'timeago.js';

export default class extends Controller<HTMLElement> {
  connect() {
    this.render();

    // A page refresh morphs this element in place: idiomorph writes the
    // server's absolute timestamp back into it, but Stimulus sees the same
    // element and never reconnects. Without this, the relative time is lost
    // after the first morph and never returns.
    this.element.addEventListener('turbo:morph-element', this.render);
  }

  disconnect() {
    this.element.removeEventListener('turbo:morph-element', this.render);

    // Scoped to this element: a bare cancel() would stop the timers of every
    // other timeago element on the page as well.
    timeago.cancel(this.element);
  }

  render = () => {
    timeago.render(this.element);
  };
}
