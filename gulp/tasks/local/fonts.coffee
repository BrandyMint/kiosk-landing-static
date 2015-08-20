gulp         = require 'gulp'
flatten      = require 'gulp-flatten'
handleErrors = require '../../util/handleErrors'
config       = require('../../config').fonts.local

gulp.task '[Local] Fonts', ->
  gulp.src config.src
    .on 'error', handleErrors
    .pipe flatten()
    .pipe gulp.dest config.dest