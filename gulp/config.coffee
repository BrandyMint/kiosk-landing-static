src   = './app'
build = './build'
dist  = './dist/landing'

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
  local: {
    scripts: {
      vendor: {
        baseDir: src + '/bower_components'
        dest: build + '/scripts'
        outputName: 'vendor.js'
        extensions: ['.coffee']
      }
      client: {
        entries: src + '/scripts/main.coffee'
        dest: build + '/scripts'
        outputName: 'client.js'
        extensions: ['.coffee', '.js.jsx.coffee']
      }
    }
    haml: {
      src: src + '/haml/*.haml'
      replace:
        counters: ''
      dest: build
    }
    sass: {
      src: src + '/stylesheets/local.scss'
      dest: build + '/stylesheets'
      outputName: 'local.css'
    }
    uncss: {
      src: build + '/stylesheets/local.css'
      dest: build + '/stylesheets'
      htmls: build + '/*.html'
      ignore: [
        /kiosklanding/
        /input/
        /button/
        /btn/
        /hidden/
      ]
      outputName: 'local.css'
    }
    fonts: {
      src: src + '/**/*.{ttf,woff,eof,eot,svg}'
      dest: build + '/fonts'
    }
    images: {
      src: src + '/images/**/*'
      dest: build + '/images'
    }
  }
  production: {
    scripts: {
      bundle: {
        baseDir: src
        entries: './scripts/bundle.coffee'
        extensions: ['.coffee', '.js.jsx.coffee']
        dest: dist
        outputName: 'bundle.js'
      }
      minify: {
        src: dist + '/bundle.js'
        dest: dist
        outputName: 'bundle.min.js'
      }
    }
    styles: {
      bundle: {
        src: src + '/stylesheets/dist.scss'
        dest: dist
        outputName: 'bundle.css'
      }
      uncss: {
        src: dist + '/bundle.css'
        dest: dist
        htmls: dist + '/*.html'
        ignore: [
          /kiosklanding/
          /input/
          /button/
          /btn/
          /hidden/
        ]
        outputName: 'bundle.css'
      }
      minify: {
        src: dist + '/bundle.css'
        dest: dist
        outputName: 'bundle.min.css'
      }
    }
    htmls: {
      src: src + '/haml/*.haml'
      replace:
        js:  'landing/bundle.min.js'
        css: 'landing/bundle.min.css'
      dest: dist
    }
    assets: {
      src: [
        src + '/landing/**/*.*'
        src + '/landing/**/*.*'
      ]
      dest: './dist/landing/'
    }
  }
}
