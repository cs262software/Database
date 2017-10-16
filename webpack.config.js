const path = require('path');
const webpack = require("webpack");

module.exports = {
    context: path.join(__dirname, 'src'),
    entry: [ './index.js', ],

    output: {
        path: path.join(__dirname, 'www'),
        filename: 'bundle.js',
    },

    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: [ 'babel-loader' ],
            },
            {
                test: /.css$/,
                use: [ 'style-loader', 'css-loader' ]
            },
        ]
    },

    resolve: {
        modules: [
            path.join(__dirname, 'node_modules'),
        ],
    },
};
