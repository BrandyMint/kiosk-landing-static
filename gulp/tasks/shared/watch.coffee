gulp = require 'gulp'

gulp.task '[Shared] Watch', ['[Shared] BrowserSync'], ->
  gulp.watch './app/haml/**/*.haml',   ['[Local] Html']
  gulp.watch './app/stylesheets/**/*', ['[Local] Styles']
  gulp.watch './app/images/**/*',      ['[Local] Images']