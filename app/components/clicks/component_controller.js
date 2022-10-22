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

  receive(event) {
    if (event.target.target === 'list') {
      this.updateList();
      this.increaseCounter();
    }
  }

  increaseCounter() {
    leave(this.counterTarget).then(() => {
      this.currentCount++;
      this.renderCount();

      enter(this.counterTarget);
    });
  }

  updateList() {
    // Scroll down list
    enter(this.listTarget).then(() => {
      // Fade in new element
      enter(this.listTarget.firstElementChild);
    });

    if (this.currentCount > 5)
      // Fade out and remove last element
      leave(this.listTarget.lastElementChild).then(() =>
        this.listTarget.lastElementChild.remove(),
      );
  }

  renderCount() {
    this.counterTarget.textContent = this.currentCount.toLocaleString();
  }
}
