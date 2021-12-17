module.exports = {
  theme: {
    extend: {},
  },
  content: [
    './app/**/*.html',
    './app/**/*.erb',
    './app/**/*.slim',
    './app/**/*.rb',
    './app/**/*.js',
  ],
  plugins: [require('@tailwindcss/forms')],
};
