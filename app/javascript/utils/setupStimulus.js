import { Application } from '@hotwired/stimulus';

// Start Stimulus application
const application = Application.start();

// Configure Stimulus development experience
application.warnings = true;
application.debug = false;
window.Stimulus = application;

// Load and register global controllers
import registerGlobalControllers from './../controllers';
registerGlobalControllers(application);

// Load and register view_component controllers
import registerComponentControllers from '../../components';
registerComponentControllers(application);
