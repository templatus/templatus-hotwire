module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
  },
  plugins: ['tailwindcss'],
  extends: [
    'eslint:recommended',
    'prettier',
    'plugin:prettier/recommended',
    'plugin:tailwindcss/recommended',
  ],
  globals: {},
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-unused-vars': ['error', { argsIgnorePattern: '^_' }],
    'tailwindcss/no-custom-classname': 'off',
  },
  parserOptions: {
    sourceType: 'module', // allow the use of imports statements
    ecmaVersion: 2022, // allow the parsing of modern ecmascript
  },
};
