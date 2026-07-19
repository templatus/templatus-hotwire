import { Controller } from '@hotwired/stimulus';

type Mode = 'light' | 'dark' | 'auto';

// The mode lives in a cookie, not in localStorage, so the server can render
// `data-theme` on <html> right away. That avoids both a flash of the wrong
// theme and an inline script needing a CSP exception.
const COOKIE_NAME = 'theme';
const COOKIE_MAX_AGE = 365 * 24 * 60 * 60;

const THEMES: Record<'light' | 'dark', string> = {
  light: 'templatus',
  dark: 'templatus-dark',
};

// Keep in sync with the `theme-color` metas in the layout
const THEME_COLORS: Record<'light' | 'dark', string> = {
  light: '#fef7f6',
  dark: '#241a19',
};

export default class extends Controller {
  static readonly targets = ['icon', 'option'];

  declare readonly iconTargets: HTMLElement[];
  declare readonly optionTargets: HTMLElement[];

  declare boundRender: () => void;

  private readonly darkQuery = window.matchMedia(
    '(prefers-color-scheme: dark)',
  );

  // The server-rendered markup cannot know the visitor's choice, so the UI
  // state is (re)built from scratch whenever that markup comes back. A morph
  // patches the existing element instead of replacing it, which means Stimulus
  // does not reconnect the controller and connect() alone is not enough.
  connect() {
    this.render();

    this.boundRender = this.render.bind(this);
    document.addEventListener('turbo:morph', this.boundRender);

    // In auto mode the button icon mirrors the OS preference, so it has to
    // follow when that preference changes
    this.darkQuery.addEventListener('change', this.boundRender);
  }

  disconnect() {
    document.removeEventListener('turbo:morph', this.boundRender);
    this.darkQuery.removeEventListener('change', this.boundRender);
  }

  select({ params }: { params: { mode: Mode } }) {
    this.mode = params.mode;
    this.render();

    // Close the daisyUI dropdown, which stays open as long as it has focus
    (document.activeElement as HTMLElement | null)?.blur();
  }

  private render() {
    const mode = this.mode;

    this.apply(mode);

    const resolved = mode === 'auto' ? this.systemMode : mode;

    for (const icon of this.iconTargets) {
      icon.classList.toggle('hidden', icon.dataset.mode !== resolved);
    }

    for (const option of this.optionTargets) {
      const active = option.dataset.mode === mode;
      option.classList.toggle('menu-active', active);
      option.setAttribute('aria-checked', String(active));
    }
  }

  private apply(mode: Mode) {
    const root = document.documentElement;

    if (mode === 'auto') {
      delete root.dataset.theme;
    } else {
      root.dataset.theme = THEMES[mode];
    }

    this.updateThemeColor(mode);
  }

  // Without this the browser chrome on mobile keeps following the OS
  // preference instead of the chosen theme.
  private updateThemeColor(mode: Mode) {
    for (const scheme of ['light', 'dark'] as const) {
      const meta = document.querySelector<HTMLMetaElement>(
        `meta[name="theme-color"][media*="${scheme}"]`,
      );

      if (meta) meta.content = THEME_COLORS[mode === 'auto' ? scheme : mode];
    }
  }

  private get systemMode(): 'light' | 'dark' {
    return this.darkQuery.matches ? 'dark' : 'light';
  }

  private get mode(): Mode {
    const stored = document.cookie
      .split('; ')
      .find((entry) => entry.startsWith(`${COOKIE_NAME}=`))
      ?.split('=')[1];

    return stored === 'light' || stored === 'dark' ? stored : 'auto';
  }

  private set mode(mode: Mode) {
    const value = mode === 'auto' ? '' : mode;
    const maxAge = mode === 'auto' ? 0 : COOKIE_MAX_AGE;

    const secure = location.protocol === 'https:' ? '; secure' : '';

    document.cookie = `${COOKIE_NAME}=${value}; path=/; max-age=${maxAge}; samesite=lax${secure}`;
  }
}
