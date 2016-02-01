path = require('path')
gulp = require('gulp')
conf = require('./conf')
browserSync = require('browser-sync')
$ = require('gulp-load-plugins')()
gulp.task 'scripts', ->
  gulp.src(path.join(conf.paths.src, '/app/**/*.coffee')).pipe($.sourcemaps.init()).pipe($.coffeelint()).pipe($.coffeelint.reporter()).pipe($.coffee()).on('error', conf.errorHandler('CoffeeScript')).pipe($.sourcemaps.write()).pipe(gulp.dest(path.join(conf.paths.tmp, '/serve/app'))).pipe(browserSync.reload(stream: true)).pipe $.size()
