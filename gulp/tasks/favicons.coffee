gulp         = require 'gulp'
handleErrors = require '../util/handleErrors'
config       = require('../config').local.favicons

gulp.task 'favicons', ->
  gulp.src config.src
    .on 'error', handleErrors
    .pipe gulp.dest config.dest