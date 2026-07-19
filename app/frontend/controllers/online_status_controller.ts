import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static readonly targets = ['indicator'];

  declare readonly hasIndicatorTarget: boolean;
  declare readonly indicatorTarget: HTMLElement;

  declare boundSetOnline: () => void;
  declare boundSetOffline: () => void;

  connect() {
    this.boundSetOnline = this.setOnline.bind(this);
    window.addEventListener('online', this.boundSetOnline);

    this.boundSetOffline = this.setOffline.bind(this);
    window.addEventListener('offline', this.boundSetOffline);

    // Pick up the state the page was loaded in - without this the indicator
    // stays hidden until the connection actually changes.
    this.render();
  }

  disconnect() {
    window.removeEventListener('online', this.boundSetOnline);
    window.removeEventListener('offline', this.boundSetOffline);
  }

  setOnline() {
    this.render();
  }

  setOffline() {
    this.render();
  }

  // The indicator's markup (status dot plus label) is server-rendered, so only
  // toggle its visibility here - writing textContent would destroy the dot.
  private render() {
    if (this.hasIndicatorTarget) {
      this.indicatorTarget.classList.toggle('hidden', navigator.onLine);
    }
  }
}
