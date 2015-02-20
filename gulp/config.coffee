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
        dest: dist + '/scripts/'
        outputName: 'bundle.js'
      }
      minify: {
        src: dist + '/scripts/bundle.js'
        dest: dist + '/scripts'
        outputName: 'bundle.min.js'
      }
    }
    styles: {
      bundle: {
        src: src + '/stylesheets/dist.scss'
        dest: dist + '/stylesheets'
        outputName: 'bundle.css'
      }
      uncss: {
        src: dist + '/stylesheets/bundle.css'
        dest: dist + '/stylesheets'
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
        src: dist + '/stylesheets/bundle.css'
        dest: dist + '/stylesheets'
        outputName: 'bundle.min.css'
      }
    }
    htmls: {
      src: src + '/haml/*.haml'
      replace:
        js: 'assets/landing/scripts/bundle.js'
        css: 'assets/landing/stylesheets/bundle.css'
      dest: dist
    }
    assets: {
      src: src + '/assets/**/*.*'
      dest: dist + '/assets'
    }
  }
}
