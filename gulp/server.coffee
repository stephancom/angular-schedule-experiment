browserSyncInit = (baseDir, browser) ->
  browser = if browser == undefined then 'default' else browser
  routes = null
  if baseDir == conf.paths.src or util.isArray(baseDir) and baseDir.indexOf(conf.paths.src) != -1
    routes = '/bower_components': 'bower_components'
  server =
    baseDir: baseDir
    routes: routes

  ###
  # You can add a proxy to your backend by uncommenting the line bellow.
  # You just have to configure a context which will we redirected and the target url.
  # Example: $http.get('/users') requests will be automatically proxified.
  #
  # For more details and option, https://github.com/chimurai/http-proxy-middleware/blob/v0.0.5/README.md
  ###

  # server.middleware = proxyMiddleware('/users', {target: 'http://jsonplaceholder.typicode.com', proxyHost: 'jsonplaceholder.typicode.com'});
  browserSync.instance = browserSync.init(
    startPath: '/'
    server: server
    browser: browser)

'use strict'
path = require('path')
gulp = require('gulp')
conf = require('./conf')
browserSync = require('browser-sync')
browserSyncSpa = require('browser-sync-spa')
util = require('util')
proxyMiddleware = require('http-proxy-middleware')
browserSync.use browserSyncSpa(selector: '[ng-app]')
gulp.task 'serve', [ 'watch' ], ->
  browserSyncInit [
    path.join(conf.paths.tmp, '/serve')
    conf.paths.src
  ]
gulp.task 'serve:dist', [ 'build' ], ->
  browserSyncInit conf.paths.dist
gulp.task 'serve:e2e', [ 'inject' ], ->
  browserSyncInit [
    conf.paths.tmp + '/serve'
    conf.paths.src
  ], []
gulp.task 'serve:e2e-dist', [ 'build' ], ->
  browserSyncInit conf.paths.dist, []
