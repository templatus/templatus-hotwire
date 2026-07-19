import { defineConfig } from 'vite';
import RailsVite from 'rails-vite-plugin';
import tailwindcss from '@tailwindcss/vite';
import { compression } from 'vite-plugin-compression2';

export default defineConfig({
  plugins: [
    tailwindcss(),
    compression({ algorithm: 'gzip' }),
    compression({ algorithm: 'brotliCompress' }),
    RailsVite({
      sourceDir: 'app/frontend',
      refresh: [
        'config/routes.rb',
        'app/views/**/*',
        'app/components/**/*',
        'app/helpers/**/*',
        'config/locales/**/*.yml',
      ],
    }),
  ],
  build: {
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
  server: {
    port: 3036,
    hmr: {
      host: 'vite.templatus-hotwire.test',
      clientPort: 443,
    },
  },
});
