gulp         = require 'gulp'
rename       = require 'gulp-rename'
minifyCSS    = require 'gulp-minify-css'
handleErrors = require '../../util/handleErrors'
config       = require('../../config').styles.production.minify

gulp.task '[Production] MinifyStyles', ['[Production] Styles'], ->
  gulp.src config.src
    .pipe minifyCSS()
    .on 'error', handleErrors
    .pipe rename config.outputName
    .pipe gulp.dest config.dest