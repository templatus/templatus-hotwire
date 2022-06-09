/** @type {import('tailwindcss').Config} */
module.exports = {
  theme: {
    extend: {
      colors: {
        primary: 'rgb(var(--color-primary) / <alpha-value>)',
        secondary: 'rgb(var(--color-secondary) / <alpha-value>)',
        tertiary: 'rgb(var(--color-tertiary) / <alpha-value>)',
        accent: 'rgb(var(--color-accent) / <alpha-value>)',
      },
    },
  },
  content: ['./app/**/*.html.*', './app/**/*.{rb,js}'],
  plugins: [require('@tailwindcss/forms')],
};
