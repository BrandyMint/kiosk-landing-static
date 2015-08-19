gulp        = require 'gulp'
requireDir  = require 'require-dir'
runSequence = require 'run-sequence'

requireDir './gulp/tasks', { recurse: true }

gulp.task 'dist', ['[Shared] Clean'], ->
  gulp.start '[Production] MinifyScripts', '[Production] MinifyStyles', '[Production] Html', '[Production] Fonts', '[Production] Images', '[Production] Favicons'

gulp.task 'build', ['[Shared] Clean'], (cb) ->
  runSequence ['[Local] Scripts', '[Local] Styles', '[Local] Html', '[Local] Fonts', '[Local] Images', '[Local] Favicons'], cb

gulp.task 'deploy', ['build'], ->
  gulp.start '[Shared] GithubPages'

gulp.task 'server', ['[Shared] SetWatch', 'build'], ->
  gulp.start '[Shared] Watch'