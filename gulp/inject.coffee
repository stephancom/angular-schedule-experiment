path = require('path')
gulp = require('gulp')
conf = require('./conf')
print = require('gulp-print')
$ = require('gulp-load-plugins')()
wiredep = require('wiredep').stream
_ = require('lodash')
gulp.task 'inject', [
  'scripts'
  'styles'
], ->
  injectStyles = gulp.src([
    path.join(conf.paths.tmp, '/serve/app/**/*.css')
    path.join('!' + conf.paths.tmp, '/serve/app/vendor.css')
  ], read: false)
  injectScripts = gulp.src([
    path.join(conf.paths.src, '/app/**/*.module.js')
    path.join(conf.paths.src, '/app/**/*.js')
    path.join(conf.paths.tmp, '/serve/app/**/*.module.js')
    path.join(conf.paths.tmp, '/serve/app/**/*.js')
    path.join('!' + conf.paths.src, '/app/**/*.spec.js')
    path.join('!' + conf.paths.src, '/app/**/*.mock.js')
  ]).pipe($.angularFilesort()).on('error', conf.errorHandler('AngularFilesort')).pipe(print())
  injectOptions =
    ignorePath: [
      conf.paths.src
      path.join(conf.paths.tmp, '/serve')
    ]
    addRootSlash: false
  gulp.src(path.join(conf.paths.tmp, '/*.html')).pipe($.inject(injectStyles, injectOptions)).pipe($.inject(injectScripts, injectOptions)).pipe(wiredep(_.extend({}, conf.wiredep))).pipe gulp.dest(path.join(conf.paths.tmp, '/serve'))
