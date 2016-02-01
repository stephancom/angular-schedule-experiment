runTests = (singleRun, done) ->
  karma.server.start {
    configFile: path.join(__dirname, '/../karma.conf.js')
    singleRun: singleRun
    autoWatch: !singleRun
  }, ->
    done()

'use strict'
path = require('path')
gulp = require('gulp')
conf = require('./conf')
karma = require('karma')
gulp.task 'test', [ 'scripts' ], (done) ->
  runTests true, done
gulp.task 'test:auto', [ 'watch' ], (done) ->
  runTests false, done
