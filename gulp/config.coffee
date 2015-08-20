src   = './app'
build = './build'
dist  = './dist'

module.exports = {
  clean: {
    dest: [build, dist]
  }
  browserSync: {
    port: 9000
    open: false
    server: {
      baseDir: [build, src]
    }
    files: [build + '/**']
  }
  ghPages: {
    src: build + '/**/*'
    options: {
      message: 'gh-pages'
    }
  }
  scripts: {
    dependencies: {
      'jquery': './jquery/dist/jquery'
      'bootstrapSass': './bootstrap-sass-official/assets/javascripts/bootstrap'
      'react': './react/react-with-addons'
      'react-mixin-manager': './react-mixin-manager/react-mixin-manager'
      'reactUjs': '../scripts/resources/react_ujs'
      'eventEmitter': './eventEmitter/EventEmitter'
      'accounting': './accounting.js/accounting'
      'lodash': './lodash/dist/lodash'
      'owlCarousel2': './owl.carousel/dist/owl.carousel'
      'jquery.scrollTo': './jquery.scrollTo/jquery.scrollTo'
    }
    local: {
      vendor: {
        baseDir: src + '/bower_components'
        extensions: ['.coffee']
        outputName: 'vendor.js'
        dest: build + '/scripts'
      }
      client: {
        entries: src + '/scripts/main.coffee'
        extensions: ['.coffee', '.js.jsx.coffee']
        outputName: 'client.js'
        dest: build + '/scripts'
      }
    }
    production: {
      bundle: {
        baseDir: src + '/bower_components'
        entries: '../scripts/bundle.coffee'
        extensions: ['.coffee', '.js.jsx.coffee']
        outputName: 'bundle.js'
        dest: dist
      }
      minify: {
        src: dist + '/bundle.js'
        outputName: 'bundle.min.js'
        dest: dist
      }
    }
  }
  styles: {
    local: {
      sass: {
        src: src + '/stylesheets/local.scss'
        options: {
          errLogToConsole: true
          sourceComments: 'normal'
          includePaths: [
            './app/stylesheets/'
            './app/bower_components/'
            './app/bower_components/bootstrap-sass-official/assets/stylesheets/bootstrap'
          ]
        }
        outputName: 'local.sass.css'
        dest: build + '/stylesheets'
      }
      postcss: {
        src: src + '/stylesheets/local.pcss.css'
        outputName: 'local.pcss.css'
        dest: build + '/stylesheets'
      }
      bundle: {
        src: [
          build + '/stylesheets/local.sass.css'
          build + '/stylesheets/local.pcss.css'
        ]
        outputName: 'local.css'
        dest: build + '/stylesheets'
      }
    }
    production: {
      sass: {
        src: src + '/stylesheets/production.scss'
        options: {
          errLogToConsole: true
          includePaths: [
            './app/stylesheets/'
            './app/bower_components/'
            './app/bower_components/bootstrap-sass-official/assets/stylesheets/bootstrap'
          ]
        }
        outputName: 'bundle.sass.css'
        dest: dist
      }
      postcss: {
        src: src + '/stylesheets/production.pcss.css'
        outputName: 'bundle.pcss.css'
        dest: dist
      }
      bundle: {
        src: [
          dist + '/bundle.sass.css'
          dist + '/bundle.pcss.css'
        ]
        outputName: 'bundle.css'
        dest: dist
      }
      minify: {
        src: dist + '/bundle.css'
        outputName: 'bundle.min.css'
        dest: dist
      }
    }
  }
  html: {
    local: {
      src: src + '/haml/*.haml'
      replace:
        counters: ''
      dest: build
    }
    production: {
      src: src + '/haml/*.haml'
      replace:
        js: 'bundle.min.js'
        css: 'bundle.min.css'
      dest: dist
    }
  }
  fonts: {
    local: {
      src: src + '/**/*.{ttf,woff,woff2,eof,eot,svg}'
      dest: build + '/fonts'
    }
    production: {
      src: src + '/**/*.{ttf,woff,woff2,eof,eot,svg}'
      dest: dist + '/fonts'
    }
  }
  images: {
    local: {
      src: src + '/images/**/*'
      dest: build + '/images'
    }
    production: {
      src: src + '/images/**/*'
      dest: dist + '/images'
    }
  }
  favicons: {
    local: {
      src: src + '/favicons/**/*'
      dest: build + '/favicons'
    }
    production: {
      src: src + '/favicons/**/*'
      dest: dist + '/favicons'
    }
  }
}