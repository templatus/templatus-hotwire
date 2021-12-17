module.exports = {
  root: true,
  env: {
    node: true,
  },
  plugins: ['cypress'],
  extends: [
    'eslint:recommended',
    'prettier',
    'plugin:prettier/recommended',
    'plugin:cypress/recommended',
  ],
  globals: {
    cy: 'readonly',
  },
  rules: {},
};
