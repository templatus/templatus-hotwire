import { Controller } from '@hotwired/stimulus';
import { enter, leave } from 'el-transition';

export default class extends Controller {
  static targets = ['counter', 'list'];
  static values = {
    count: Number,
  };

  connect() {
    this.currentCount = this.countValue;
    this.renderCount();
  }

  receive() {
    this.updateList();
    this.increaseCounter();
  }

  async increaseCounter() {
    await leave(this.counterTarget);

    this.currentCount++;
    this.renderCount();

    await enter(this.counterTarget);
  }

  async updateList() {
    if (this.currentCount > 5) this.listTarget.lastElementChild.remove();

    await leave(this.listTarget);
    await enter(this.listTarget);
  }

  renderCount() {
    this.counterTarget.textContent = this.currentCount.toLocaleString();
  }
}
