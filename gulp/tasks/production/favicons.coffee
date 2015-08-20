gulp         = require 'gulp'
handleErrors = require '../../util/handleErrors'
config       = require('../../config').favicons.production

gulp.task '[Production] Favicons', ->
  gulp.src config.src
    .on 'error', handleErrors
    .pipe gulp.dest config.dest