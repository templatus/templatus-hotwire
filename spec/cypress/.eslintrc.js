module.exports = {
  root: true,
  env: {
    node: true,
  },
  plugins: ['cypress'],
  extends: ['eslint:recommended', 'plugin:cypress/recommended'],
  globals: {
    cy: 'readonly',
  },
  rules: {},
};
