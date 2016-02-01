path = require('path')
gulp = require('gulp')
conf = require('./conf')
browserSync = require('browser-sync')
$ = require('gulp-load-plugins')()
wiredep = require('wiredep').stream
_ = require('lodash')
gulp.task 'styles', ->
  sassOptions = style: 'expanded'
  injectFiles = gulp.src([
    path.join(conf.paths.src, '/app/**/*.scss')
    path.join('!' + conf.paths.src, '/app/index.scss')
  ], read: false)
  injectOptions =
    transform: (filePath) ->
      filePath = filePath.replace(conf.paths.src + '/app/', '')
      '@import "' + filePath + '";'
    starttag: '// injector'
    endtag: '// endinjector'
    addRootSlash: false
  gulp.src([ path.join(conf.paths.src, '/app/index.scss') ]).pipe($.inject(injectFiles, injectOptions)).pipe(wiredep(_.extend({}, conf.wiredep))).pipe($.sourcemaps.init()).pipe($.sass(sassOptions)).on('error', conf.errorHandler('Sass')).pipe($.autoprefixer()).on('error', conf.errorHandler('Autoprefixer')).pipe($.sourcemaps.write()).pipe(gulp.dest(path.join(conf.paths.tmp, '/serve/app/'))).pipe browserSync.reload(stream: true)
