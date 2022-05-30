import { Application } from '@hotwired/stimulus';
import { registerControllers } from 'stimulus-vite-helpers';

// Start Stimulus application
const application = Application.start();

// Configure Stimulus development experience
application.warnings = true;
application.debug = false;
window.Stimulus = application;

// Load and register global controllers
registerControllers(
  application,
  import.meta.globEager('../controllers/*_controller.js'),
);

// Load and register view_component controllers
registerControllers(
  application,
  import.meta.globEager('../../components/**/*_controller.js'),
);
