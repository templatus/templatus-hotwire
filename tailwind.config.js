module.exports = {
  theme: {
    extend: {
      colors: {
        rails: {
          light: '#D30001',
          dark: '#690000',
        },
        hotwire: {
          DEFAULT: '#15d1d8',
        },
        rose: {
          DEFAULT: '#F0E7E9',
        },
      },
    },
  },
  content: ['./app/**/*.html.*', './app/**/*.rb', './app/**/*.js'],
  plugins: [require('@tailwindcss/forms')],
};
