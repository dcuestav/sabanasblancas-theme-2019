const path = require('path');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const webpack = require('webpack');

module.exports = {
  entry: [
    './js/theme.js',
    './css/theme.scss'
  ],
  output: {
    path: path.resolve(__dirname, "../assets/js"),
    filename: 'theme.js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
        }
      },
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: 'css-loader'
          },
          {
            loader: 'postcss-loader', // Run post css actions
            options: {
              plugins: function () { // post css plugins, can be exported to postcss.config.js
                return [
                  require('autoprefixer')
                ];
              }
            }
          },
          {
            loader: 'sass-loader',
            options: {
              sourceMap: true
            }
          },
        ]
      },
      {
        test: /.(png|woff(2)?|eot|ttf|svg|jpg)(\?[a-z0-9=\.]+)?$/,
        loader: 'file-loader?name=../css/[hash].[ext]'
      }
    ]
  },
  externals: {
    prestashop: 'prestashop',
    jquery: 'jQuery'
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: '../css/theme.css'
    })
]
}