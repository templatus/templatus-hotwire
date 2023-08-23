addEventListener('turbo:before-render', (event) => {
  // View Transitions API is currently available in Chrome only
  // https://developer.mozilla.org/en-US/docs/Web/API/View_Transitions_API#browser_compatibility
  if (!document.startViewTransition) return;

  const turboEvent = event as CustomEvent;
  const originalRender = turboEvent.detail.render;

  turboEvent.detail.render = (
    currentElement: HTMLElement,
    newElement: HTMLElement,
  ) => {
    document.startViewTransition?.(() =>
      originalRender(currentElement, newElement),
    );
  };
});
