gulp         = require 'gulp'
uncss        = require 'gulp-uncss'
rename       = require 'gulp-rename'
glob         = require 'glob'
handleErrors = require '../../util/handleErrors'
config       = require('../../config').production.styles.uncss

gulp.task 'clearStyles', ['htmls', 'styles'], ->
  gulp.src config.src
  .pipe uncss(
    html: glob.sync config.htmls
    ignore: config.ignore
  )
  .on 'error', handleErrors
  .pipe rename config.outputName
  .pipe gulp.dest config.dest