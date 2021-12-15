import { Controller } from '@hotwired/stimulus';
import { enter, leave } from 'el-transition';

export default class extends Controller {
  static targets = ['counter', 'list'];

  receive() {
    this.updateList();
    this.increaseCounter();
  }

  async increaseCounter() {
    await leave(this.counterTarget);

    this.counterTarget.textContent = this.counterValue + 1;

    await enter(this.counterTarget);
  }

  async updateList() {
    if (this.counterValue > 5) this.listTarget.lastElementChild.remove();

    await leave(this.listTarget);
    await enter(this.listTarget);
  }

  get counterValue() {
    return parseInt(this.counterTarget.textContent);
  }
}
