var path = require('path')

module.exports = {
  entry: './src/index.js',
  output: {
    path: __dirname,
    filename: '../WebSocketcontrol/data/bundle.js'
  },
  module: {
    loaders: [
    {
      test: /\.js$/,
      loader: 'babel-loader',
      exclude: /node-modules/,
      query: {
        presets: ['es2015']
      }
    },
    {
      test: /\.tag$/,
      loader: 'tag',
      exclude: /node-modules/,
    },
    ]
  }
}
