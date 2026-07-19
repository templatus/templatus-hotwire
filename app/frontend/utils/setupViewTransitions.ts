// View Transitions API is currently available in Chrome only
// https://developer.mozilla.org/en-US/docs/Web/API/View_Transitions_API#browser_compatibility

type TurboRender = (
  currentElement: HTMLElement,
  newElement: HTMLElement,
) => void;

interface BeforeRenderDetail {
  render: TurboRender;
}

if (document.startViewTransition)
  addEventListener('turbo:before-render', (event) => {
    const { detail } = event as CustomEvent<BeforeRenderDetail>;
    const originalRender = detail.render;

    detail.render = (currentElement, newElement) => {
      document.startViewTransition?.(() => {
        originalRender(currentElement, newElement);
      });
    };
  });
