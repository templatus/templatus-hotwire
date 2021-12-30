import { Controller } from '@hotwired/stimulus';
import * as timeago from 'timeago.js';

export default class extends Controller {
  connect() {
    timeago.render(this.element);
  }

  disconnect() {
    timeago.cancel();
  }
}
