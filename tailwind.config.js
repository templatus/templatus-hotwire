module.exports = {
  theme: {
    extend: {},
  },
  content: [
    './app/**/*.html.*',
    './app/**/*.rb',
    './app/**/*.js',
  ],
  plugins: [require('@tailwindcss/forms')],
};
