import { defineConfig } from 'vite';
import ViteRails from 'vite-plugin-rails';
import tailwindcss from '@tailwindcss/vite';
import { resolve } from 'path';

export default defineConfig({
  build: {
    assetsInlineLimit: 0,
    rolldownOptions: {
      output: {
        codeSplitting: {
          groups: [
            {
              test: /node_modules/,
              name: 'vendor',
            },
          ],
        },
      },
    },
  },
  plugins: [
    tailwindcss(),
    ViteRails({
      fullReload: {
        additionalPaths: [
          'config/routes.rb',
          'app/views/**/*',
          'app/components/**/*',
          'app/helpers/**/*',
        ],
      },
    }),
  ],
  resolve: {
    alias: {
      '@': resolve(__dirname, 'app/frontend'),
    },
  },
  server: {
    hmr: {
      host: 'vite.templatus-hotwire.test',
      clientPort: 443,
    },
  },
});
