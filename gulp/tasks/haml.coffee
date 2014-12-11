gulp        = require 'gulp'
include     = require 'gulp-file-include'
htmlreplace = require 'gulp-html-replace'
haml        = require 'gulp-haml-coffee'
browserSync = require 'browser-sync'
config      = require('../config').local.haml
reload      = browserSync.reload

gulp.task 'haml', ->
  gulp.src config.src
    .pipe(include(
      prefix: "@@"
      basepath: "@file"
    ))
    .pipe haml()
    .pipe htmlreplace config.replace, keepUnassigned: true
    .pipe gulp.dest config.dest
    .pipe reload({ stream: true })