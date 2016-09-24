const dev = process.env.NODE_ENV != "prod";
const path = require("path");
const webpack = require("webpack");

module.exports = {
  entry: {
    app: path.join(__dirname, "js", "app.js")
  },

  output: {
    path: path.join(__dirname, "build", "js"),
    filename: "[name].js"
  },

  module: {
    noParse: /\.elm$/,
    loaders: [
      // Babel
      {
        test: /\.js$/,
        loader: "babel-loader?presets[]=es2015",
        exclude: /(node_modules|bower_components)/
      },

      // SCSS
      {
        test: /\.scss$/,
        loaders: ["style", "css", "sass"]
      },

      // Elm
      {
        test: /\.elm$/,
        loader: "elm-webpack-loader",
        exclude: /(node_modules|elm-stuff)/
      }
    ]
  },

  plugins: dev ? [] : [
    new webpack.optimize.OccurenceOrderPlugin(),
    new webpack.optimize.UglifyJsPlugin({
      minimize: true,
      compressor: {
        warnings: false
      }
    })
  ]
};
