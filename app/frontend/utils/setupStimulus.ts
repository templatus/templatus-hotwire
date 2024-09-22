import { Application } from '@hotwired/stimulus';
import { registerControllers } from 'stimulus-vite-helpers';

// Start Stimulus application
const application = Application.start();

// Load and register controllers
registerControllers(
  application,
  import.meta.glob('../controllers/*_controller.{ts,js}', { eager: true }),
);
