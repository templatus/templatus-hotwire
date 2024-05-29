import eslint from '@eslint/js';
import tseslint from 'typescript-eslint';

import { FlatCompat } from '@eslint/eslintrc';
const compat = new FlatCompat();

export default [
  ...compat.env({
    browser: true,
    node: true,
  }),

  ...compat.config({
    extends: [
      'prettier',
      'plugin:prettier/recommended',
      'plugin:tailwindcss/recommended',
      'plugin:cypress/recommended',
    ],
    rules: {
      'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
      'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
      'tailwindcss/no-custom-classname': 'off',
    },
  }),

  ...[eslint.configs.recommended, ...tseslint.configs.recommended].map(
    (conf) => ({
      ...conf,
      files: ['**/*.ts'],
      rules: {
        '@typescript-eslint/no-unused-vars': [
          'error',
          {
            argsIgnorePattern: '^_',
          },
        ],
        '@typescript-eslint/no-var-requires': 'off',
      },
    }),
  ),

  {
    ignores: [
      '.ruby-lsp/',
      '.yarn/',
      'config/',
      'coverage/',
      'db/',
      'log/',
      'node_modules/',
      'public/',
      'tmp/',
      'vendor/',
    ],
  },
];
