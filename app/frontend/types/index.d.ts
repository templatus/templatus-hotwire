interface Document {
  startViewTransition?: (callback: () => PromiseLike<void> | void) => {
    finished: Promise<void>;
    ready: Promise<void>;
    updateCallbackDone: Promise<void>;
    skipTransition: () => void;
  };
}

// Dummy declaration for Turbo 8
declare module '@hotwired/turbo' {
  export class StreamElement extends HTMLElement {
    target: string;
  }
}
