gulp         = require 'gulp'
flatten      = require 'gulp-flatten'
handleErrors = require '../../util/handleErrors'
config       = require('../../config').production.fonts

gulp.task 'fonts:production', ->
  gulp.src config.src
    .on 'error', handleErrors
    .pipe flatten()
    .pipe gulp.dest config.dest