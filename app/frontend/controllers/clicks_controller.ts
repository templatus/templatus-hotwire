import { Controller } from '@hotwired/stimulus';

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

  // Not connect(): the layout refreshes via morphing, which patches this
  // element in place without reconnecting the controller. The value callback
  // fires on connect *and* whenever the server sends a fresh count, so the
  // displayed total can't drift away from the database.
  countValueChanged() {
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
      void leave(this.counterTarget).then(() => {
        this.currentCount++;
        this.renderCount();

        void enter(this.counterTarget);
      });
  }

  updateList() {
    if (!this.hasListTarget) return;

    // Scroll down list
    void enter(this.listTarget).then(() => {
      // Fade in new element - absent when the list was empty before
      const first = this.listTarget.firstElementChild;
      if (first) void enter(first);
    });
  }

  renderCount() {
    if (this.hasCounterTarget)
      this.counterTarget.textContent = this.currentCount.toLocaleString();
  }
}
