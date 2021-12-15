import controllers from './**/*_controller.js';

export default function registerControllers(application) {
  controllers.forEach((controller) => {
    application.register(controller.name, controller.module.default);
  });
}
