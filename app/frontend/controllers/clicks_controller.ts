import { Controller } from '@hotwired/stimulus';

// @ts-expect-error No declaration file for 'el-transition'
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
    const stream = event.target as StreamElement;

    // Only react to clicks broadcasted by other visitors, which are prepended
    // to the top of the list. Appends come from the endless scrolling and must
    // neither animate nor count.
    if (stream.target !== 'list' || stream.action !== 'prepend') return;

    this.updateList();
    this.increaseCounter();
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
  }

  renderCount() {
    if (this.hasCounterTarget)
      this.counterTarget.textContent = this.currentCount.toLocaleString();
  }
}
