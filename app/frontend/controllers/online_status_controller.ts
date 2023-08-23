import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['indicator'];

  declare readonly hasIndicatorTarget: boolean;
  declare readonly indicatorTarget: HTMLElement;
  declare readonly indicatorTargets: HTMLElement[];

  connect() {
    window.addEventListener('online', this.setOnline.bind(this));
    window.addEventListener('offline', this.setOffline.bind(this));
  }

  disconnect() {
    window.removeEventListener('online', this.setOnline.bind(this));
    window.removeEventListener('offline', this.setOffline.bind(this));
  }

  setOnline() {
    this.indicatorTarget.textContent = '';
    this.indicatorTarget.classList.add('hidden');
  }

  setOffline() {
    this.indicatorTarget.textContent = 'You are offline';
    this.indicatorTarget.classList.remove('hidden');
  }
}
