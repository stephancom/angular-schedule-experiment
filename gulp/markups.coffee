path = require('path')
gulp = require('gulp')
conf = require('./conf')
browserSync = require('browser-sync')
$ = require('gulp-load-plugins')()
gulp.task 'markups', ->

  renameToHtml = (path) ->
    path.extname = '.html'
    return

  gulp.src(path.join(conf.paths.src, '/app/**/*.jade')).pipe($.consolidate('jade',
    basedir: conf.paths.src
    doctype: 'html'
    pretty: '  ')).on('error', conf.errorHandler('Jade')).pipe($.rename(renameToHtml)).pipe(gulp.dest(path.join(conf.paths.tmp, '/serve/app/'))).pipe browserSync.reload(stream: true)

  gulp.src(path.join(conf.paths.src, '/*.jade')).pipe($.consolidate('jade',
    basedir: conf.paths.src
    doctype: 'html'
    pretty: '  ')).on('error', conf.errorHandler('Jade')).pipe($.rename(renameToHtml)).pipe(gulp.dest(path.join(conf.paths.tmp, '/'))).pipe browserSync.reload(stream: true)
