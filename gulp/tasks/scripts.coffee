browserify     = require 'browserify'
watchify       = require 'watchify'
gulp           = require 'gulp'
source         = require 'vinyl-source-stream'
bundleLogger   = require '../util/bundleLogger'
handleErrors   = require '../util/handleErrors'
config         = require('../config').scripts

# ==========================================
# Local
# ==========================================

gulp.task '[Local] Scripts', ->
  # Vendor Scripts
  vendorBundler = browserify({
    cache: {}, packageCache: {}
    basedir: config.local.vendor.baseDir
    extensions: config.local.vendor.extensions
  })

  for dep of config.dependencies
    if config.dependencies.hasOwnProperty(dep)
      vendorBundler.require config.dependencies[dep], { expose: dep }

  bundleLogger.start config.local.vendor.outputName

  vendorBundler
    .bundle()
    .on 'error', handleErrors
    .pipe source(config.local.vendor.outputName)
    .pipe gulp.dest(config.local.vendor.dest)
    .on 'end', ->
      bundleLogger.end config.local.vendor.outputName

  # Client Scripts
  clientBundler = browserify({
    cache: {}, packageCache: {}
    entries: config.local.client.entries
    extensions: config.local.client.extensions
  })

  for dep of config.dependencies
    if config.dependencies.hasOwnProperty(dep)
      clientBundler.external dep

  rebundle = ->
    bundleLogger.start config.local.client.outputName

    return clientBundler
             .bundle()
             .on 'error', handleErrors
             .pipe source(config.local.client.outputName)
             .pipe gulp.dest(config.local.client.dest)
             .on 'end', ->
               bundleLogger.end config.local.client.outputName

  if global.isWatching
    clientBundler = watchify clientBundler
    clientBundler.on 'update', rebundle

  rebundle()

# ==========================================
# Production
# ==========================================

gulp.task '[Production] Scripts', ->
  bundler = browserify({
    cache: {}, packageCache: {}
    basedir: config.production.bundle.baseDir
    entries: config.production.bundle.entries
    extensions: config.production.bundle.extensions
  })

  for dep of config.dependencies
    if config.dependencies.hasOwnProperty(dep)
      bundler.require config.dependencies[dep], { expose: dep }

  bundle = ->
    bundleLogger.start config.production.bundle.outputName

    return bundler
      .bundle()
      .on 'error', handleErrors
      .pipe source(config.production.bundle.outputName)
      .pipe gulp.dest(config.production.bundle.dest)
      .on 'end', ->
        bundleLogger.end config.production.bundle.outputName

  bundle()