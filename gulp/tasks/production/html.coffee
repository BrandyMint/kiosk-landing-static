gulp        = require 'gulp'
htmlreplace = require 'gulp-html-replace'
include     = require 'gulp-file-include'
haml        = require 'gulp-haml-coffee'
config      = require('../../config').html.production

gulp.task '[Production] Html', ->
  gulp.src config.src
    .pipe(include(
      prefix: '@@'
      basepath: '@file'
    ))
    .pipe haml()
    .pipe htmlreplace config.replace, keepUnassigned: true
    .pipe gulp.dest config.dest