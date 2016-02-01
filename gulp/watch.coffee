isOnlyChange = (event) ->
  event.type == 'changed'

'use strict'
path = require('path')
gulp = require('gulp')
conf = require('./conf')
browserSync = require('browser-sync')
gulp.task 'watch', [
  'markups'
  'inject'
], ->
  gulp.watch [
    path.join(conf.paths.src, '/*.html')
    'bower.json'
  ], [ 'inject' ]
  gulp.watch [
    path.join(conf.paths.src, '/app/**/*.css')
    path.join(conf.paths.src, '/app/**/*.scss')
  ], (event) ->
    if isOnlyChange(event)
      gulp.start 'styles'
    else
      gulp.start 'inject'
  gulp.watch [
    path.join(conf.paths.src, '/app/**/*.js')
    path.join(conf.paths.src, '/app/**/*.coffee')
  ], (event) ->
    if isOnlyChange(event)
      gulp.start 'scripts'
    else
      gulp.start 'inject'
  gulp.watch path.join(conf.paths.src, '/app/**/*.jade'), [ 'markups' ]
  gulp.watch path.join(conf.paths.src, '/app/**/*.html'), (event) ->
    browserSync.reload event.path
