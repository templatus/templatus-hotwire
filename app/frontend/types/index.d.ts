declare global {
  interface Document {
    startViewTransition?: (callback: () => PromiseLike<void> | void) => {
      finished: Promise<void>;
      ready: Promise<void>;
      updateCallbackDone: Promise<void>;
      skipTransition: () => void;
    };
  }
}

export {};
