import { Application } from '@hotwired/stimulus';
import { registerControllers } from 'stimulus-vite-helpers';

// Start Stimulus application
const application = Application.start();

// Load and register global controllers
registerControllers(
  application,
  import.meta.glob('../controllers/*_controller.{ts,js}', { eager: true }),
);

// Load and register view_component controllers
registerControllers(
  application,
  import.meta.glob('../../components/**/*_controller.{ts,js}', { eager: true }),
);
