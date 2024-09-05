import { defineConfig } from 'vite';
import ViteRails from 'vite-plugin-rails';
import { resolve } from 'path';

export default defineConfig({
  build: {
    assetsInlineLimit: 0,
    rollupOptions: {
      output: {
        manualChunks(id) {
          if (id.includes('node_modules')) {
            return 'vendor';
          }
        },
      },
    },
  },
  plugins: [
    ViteRails({
      fullReload: {
        additionalPaths: [
          'config/routes.rb',
          'app/views/**/*',
          'app/components/**/*',
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
