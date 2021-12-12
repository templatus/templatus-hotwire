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

    this.counterTarget.textContent =
      parseInt(this.counterTarget.textContent) + 1;

    await enter(this.counterTarget);
  }

  async updateList() {
    await leave(this.listTarget);
    await enter(this.listTarget);
  }
}
