gulp        = require 'gulp'
htmlreplace = require 'gulp-html-replace'
replace 	= require 'gulp-replace'
rename      = require 'gulp-rename'
include     = require 'gulp-file-include'
haml        = require 'gulp-haml-coffee'
config      = require('../../config').production.htmls

gulp.task 'htmls', ->
  gulp.src config.src
    .pipe(include(
      prefix: '@@'
      basepath: '@file'
    ))
    .pipe haml()
    .pipe htmlreplace config.replace, keepUnassigned: true
    .pipe replace config.replacePath.images.str, config.replacePath.images.newStr
    .pipe rename config.outputName
    .pipe gulp.dest config.dest