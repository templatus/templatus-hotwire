import { Controller } from '@hotwired/stimulus';

// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore
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
