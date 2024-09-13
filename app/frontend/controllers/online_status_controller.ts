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
  }

  disconnect() {
    window.removeEventListener('online', this.boundSetOnline);
    window.removeEventListener('offline', this.boundSetOffline);
  }

  setOnline() {
    if (this.hasIndicatorTarget) {
      this.indicatorTarget.textContent = '';
      this.indicatorTarget.classList.add('hidden');
    }
  }

  setOffline() {
    if (this.hasIndicatorTarget) {
      this.indicatorTarget.textContent = 'You are offline';
      this.indicatorTarget.classList.remove('hidden');
    }
  }
}
