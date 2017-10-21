/*
    ./webpack.config.js
*/
const path = require('path');
module.exports = {
  entry: './client/index.js',
  output: {
    path: path.resolve('./public'),
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      { test: /\.js$/, loader: 'babel-loader', exclude: /node_modules/ },
      { test: /\.jsx$/, loader: 'babel-loader', exclude: /node_modules/ },
      { test: /\.css$/, use: [ 'style-loader', 'css-loader' ] }
    ]
  }
}
