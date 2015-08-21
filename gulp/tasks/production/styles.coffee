gulp          = require 'gulp'
sass          = require 'gulp-sass'
postcss       = require 'gulp-postcss'
concat        = require 'gulp-concat'
postcssImport = require 'postcss-import'
postcssNested = require 'postcss-nested'
cssnext       = require 'cssnext'
precss        = require 'precss'
stylelint     = require 'stylelint'
autoprefixer  = require 'autoprefixer-core'
rename        = require 'gulp-rename'
handleErrors  = require '../../util/handleErrors'
config        = require('../../config').styles.production

gulp.task '[Production] Sass', ->
  gulp.src config.sass.src
    .pipe sass config.sass.options
    .on 'error', handleErrors
    .pipe rename config.sass.outputName
    .pipe gulp.dest config.sass.dest

gulp.task '[Production] Postcss', ['[Production] Sass'], ->
  processors = [
    postcssNested
    postcssImport()
    cssnext({ compress: true })
    precss()
    stylelint()
  ]

  gulp.src config.postcss.src
    .pipe postcss(processors)
    .on 'error', handleErrors
    .pipe rename config.postcss.outputName
    .pipe gulp.dest config.postcss.dest

gulp.task '[Production] Styles', ['[Production] Postcss'], ->
  gulp.src config.bundle.src
    .pipe postcss([ autoprefixer({ browsers: ['last 2 versions'] }) ])
    .on 'error', handleErrors
    .pipe concat(config.bundle.outputName)
    .pipe gulp.dest config.bundle.dest