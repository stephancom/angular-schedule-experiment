'use strict'
path = require('path')
gulp = require('gulp')
conf = require('./conf')
$ = require('gulp-load-plugins')(pattern: [
  'gulp-*'
  'main-bower-files'
  'uglify-save-license'
  'del'
])
gulp.task 'partials', [ 'markups' ], ->
  gulp.src([
    path.join(conf.paths.src, '/app/**/*.html')
    path.join(conf.paths.tmp, '/serve/app/**/*.html')
  ]).pipe($.minifyHtml(
    empty: true
    spare: true
    quotes: true)).pipe($.angularTemplatecache('templateCacheHtml.js',
    module: 'argo'
    root: 'app')).pipe gulp.dest(conf.paths.tmp + '/partials/')
gulp.task 'html', [
  'inject'
  'partials'
], ->
  partialsInjectFile = gulp.src(path.join(conf.paths.tmp, '/partials/templateCacheHtml.js'), read: false)
  partialsInjectOptions =
    starttag: '<!-- inject:partials -->'
    ignorePath: path.join(conf.paths.tmp, '/partials')
    addRootSlash: false
  htmlFilter = $.filter('*.html')
  jsFilter = $.filter('**/*.js')
  cssFilter = $.filter('**/*.css')
  assets = undefined
  gulp.src(path.join(conf.paths.tmp, '/serve/*.html')).pipe($.inject(partialsInjectFile, partialsInjectOptions)).pipe(assets = $.useref.assets()).pipe($.rev()).pipe(jsFilter).pipe($.ngAnnotate()).pipe($.uglify(preserveComments: $.uglifySaveLicense)).on('error', conf.errorHandler('Uglify')).pipe(jsFilter.restore()).pipe(cssFilter).pipe($.replace('../../bower_components/bootstrap-sass-official/assets/fonts/bootstrap/', '../fonts/')).pipe($.csso()).pipe(cssFilter.restore()).pipe(assets.restore()).pipe($.useref()).pipe($.revReplace()).pipe(htmlFilter).pipe($.minifyHtml(
    empty: true
    spare: true
    quotes: true
    conditionals: true)).pipe(htmlFilter.restore()).pipe(gulp.dest(path.join(conf.paths.dist, '/'))).pipe $.size(
    title: path.join(conf.paths.dist, '/')
    showFiles: true)
# Only applies for fonts from bower dependencies
# Custom fonts are handled by the "other" task
gulp.task 'fonts', ->
  gulp.src($.mainBowerFiles()).pipe($.filter('**/*.{eot,svg,ttf,woff,woff2}')).pipe($.flatten()).pipe gulp.dest(path.join(conf.paths.dist, '/fonts/'))
gulp.task 'other', ->
  fileFilter = $.filter((file) ->
    file.stat.isFile()
  )
  gulp.src([
    path.join(conf.paths.src, '/**/*')
    path.join('!' + conf.paths.src, '/**/*.{html,css,js,scss,coffee,jade}')
  ]).pipe(fileFilter).pipe gulp.dest(path.join(conf.paths.dist, '/'))
gulp.task 'clean', (done) ->
  $.del [
    path.join(conf.paths.dist, '/')
    path.join(conf.paths.tmp, '/')
  ], done
gulp.task 'build', [
  'html'
  'fonts'
  'other'
]
