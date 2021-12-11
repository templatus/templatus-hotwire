module.exports = {
  theme: {
    extend: {},
  },
  content: [
    './app/**/*.html',
    './app/**/*.html.erb',
    './app/**/*.rb',
    './app/javascript/**/*.vue',
    './app/javascript/**/*.js',
  ],
  plugins: [require('@tailwindcss/forms')],
};
