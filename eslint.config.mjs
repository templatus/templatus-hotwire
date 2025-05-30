import eslint from '@eslint/js';
import tseslint from 'typescript-eslint';

import pluginPrettierRecommended from 'eslint-plugin-prettier/recommended';
import pluginCypress from 'eslint-plugin-cypress/flat';

export default [
  eslint.configs.recommended,
  ...tseslint.configs.recommended,
  pluginPrettierRecommended,

  {
    files: ['**/*.{js,ts}'],
    rules: {
      '@typescript-eslint/no-unused-vars': [
        'error',
        {
          argsIgnorePattern: '^_',
        },
      ],
      '@typescript-eslint/no-var-requires': 'off',
    },
  },

  {
    files: ['spec/cypress/**'],
    ...pluginCypress.configs.recommended,
  },

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
