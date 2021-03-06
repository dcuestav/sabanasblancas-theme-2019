const path = require('path');
const MiniCssExtractPlugin = require(path.resolve(__dirname, 'node_modules', 'mini-css-extract-plugin'));
const webpack = require(path.resolve(__dirname, 'node_modules', 'webpack'));

module.exports = {
  entry: [
    './js/theme.js',
    './css/theme.scss',
    './css/theme.less'
  ],
  output: {
    path: path.resolve(__dirname, "../assets/js"),
    filename: 'theme.js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        include: [
          path.resolve(__dirname, "js"),
          path.resolve(__dirname, 'node_modules', 'bootstrap')
        ],
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
            loader: 'css-loader',
            options: {
              sourceMap: true
            }
          },
          {
            loader: 'postcss-loader', // Run post css actions
            options: {
              plugins: () => [
                require(path.resolve(__dirname, 'node_modules', 'autoprefixer'))({grid: "autoplace"})
              ],
              sourceMap: true
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
        test: /\.less$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: 'css-loader',
            options: {
              sourceMap: true
            }
          },
          {
            loader: 'less-loader',
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
    }),
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery'
    })
]
}