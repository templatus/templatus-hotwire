import { Controller } from '@hotwired/stimulus';

// @ts-expect-error No declaration file for 'el-transition'
import { enter, leave } from 'el-transition';

export default class extends Controller {
  connect() {
    enter(this.element).then(() => {
      setTimeout(() => {
        this.remove();
      }, 2000);
    });
  }

  remove() {
    leave(this.element).then(() => {
      this.element.remove();
    });
  }
}
