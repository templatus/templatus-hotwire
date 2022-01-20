function withOpacityValue(variable) {
  return ({ opacityValue }) => {
    if (opacityValue === undefined) {
      return `rgb(var(${variable}))`;
    }
    return `rgb(var(${variable}) / ${opacityValue})`;
  };
}

module.exports = {
  theme: {
    extend: {
      colors: {
        primary: withOpacityValue('--color-primary'),
        secondary: withOpacityValue('--color-secondary'),
        tertiary: withOpacityValue('--color-tertiary'),
        accent: withOpacityValue('--color-accent'),
      },
    },
  },
  content: ['./app/**/*.html.*', './app/**/*.rb', './app/**/*.js'],
  plugins: [require('@tailwindcss/forms')],
};
