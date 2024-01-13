import { Controller } from '@hotwired/stimulus';

// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore
import { enter, leave } from 'el-transition';

import { StreamElement } from '@hotwired/turbo';

export default class extends Controller {
  static targets = ['counter', 'list'];

  declare readonly hasCounterTarget: boolean;
  declare readonly counterTarget: HTMLElement;

  declare readonly hasListTarget: boolean;
  declare readonly listTarget: HTMLElement;

  static values = {
    count: Number,
  };

  declare countValue: number;
  declare readonly hasCountValue: boolean;

  currentCount = 0;

  connect() {
    this.currentCount = this.countValue;
    this.renderCount();
  }

  receive(event: Event) {
    if ((event.target as StreamElement).target === 'list') {
      this.updateList();
      this.increaseCounter();
    }
  }

  increaseCounter() {
    if (this.hasCounterTarget)
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
        this.listTarget.lastElementChild?.remove(),
      );
  }

  renderCount() {
    if (this.hasCounterTarget)
      this.counterTarget.textContent = this.currentCount.toLocaleString();
  }
}
