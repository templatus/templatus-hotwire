module.exports = {
  theme: {
    extend: {},
  },
  content: [
    './app/components/**/*.html.erb',
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  plugins: [require('@tailwindcss/forms')],
};
