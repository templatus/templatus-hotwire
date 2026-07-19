interface Document {
  startViewTransition?: (callback: () => PromiseLike<void> | void) => {
    finished: Promise<void>;
    ready: Promise<void>;
    updateCallbackDone: Promise<void>;
    skipTransition: () => void;
  };
}

// el-transition ships plain JavaScript without type declarations. Declaring it
// here beats a `@ts-expect-error` at every import site, which would silently
// turn enter/leave into `any` and hide real mistakes from the type checker.
declare module 'el-transition' {
  export function enter(
    element: Element,
    transitionName?: string,
  ): Promise<void>;
  export function leave(
    element: Element,
    transitionName?: string,
  ): Promise<void>;
  export function toggle(
    element: Element,
    transitionName?: string,
  ): Promise<void>;
}

// Dummy declaration for Turbo 8
declare module '@hotwired/turbo' {
  export class StreamElement extends HTMLElement {
    target: string;
    action: string;
  }

  export function renderStreamMessage(message: string): void;
}
