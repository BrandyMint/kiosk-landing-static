gulp        = require 'gulp'
requireDir  = require 'require-dir'
runSequence = require 'run-sequence'

requireDir './gulp/tasks', { recurse: true }

gulp.task 'dist', ['clean'], ->
  gulp.start 'minifyScripts', 'minifyStyles', 'assets'

gulp.task 'build', ['clean'], (cb) ->
  runSequence ['vendorScripts', 'clientScripts', 'uncss', 'fonts', 'images'], cb

gulp.task 'server', ['build'], ->
  gulp.start 'watch'