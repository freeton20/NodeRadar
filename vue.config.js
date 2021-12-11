const CopyPlugin = require('copy-webpack-plugin');

module.exports = {
    chainWebpack: config => {
        config
        .plugin('html')
        .tap(args => {
          args[0].title = 'NODE RADAR'
          return args
        })
      },
    configureWebpack: {
        plugins: [
            new CopyPlugin(
                [
                    {
                        from: 'node_modules/@tonclient/lib-web/tonclient.wasm',
                        to: './'
                    }
                ],
            )
        ]
    },
    publicPath: process.env.NODE_ENV === 'production' ? './' : '/'
}