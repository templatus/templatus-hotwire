const { webpackConfig, merge } = require('@rails/webpacker');
const vueConfig = require('./rules/vue');
const path = require('path');
const ForkTSCheckerWebpackPlugin = require('fork-ts-checker-webpack-plugin');

const customConfig = {
  plugins: [new ForkTSCheckerWebpackPlugin()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, '..', '..', 'app/javascript/src'),
    },
  },
};

module.exports = merge(vueConfig, customConfig, webpackConfig);
