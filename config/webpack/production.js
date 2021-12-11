process.env.NODE_ENV = process.env.NODE_ENV || 'production';

const webpackConfig = require('./base');
webpackConfig.devtool = 'nosources-source-map';

module.exports = webpackConfig;
