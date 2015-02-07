require('dotenv').load()
gulp = require('gulp')
gutil = require('gulp-util')
bower = require('bower')
concat = require('gulp-concat')
sass = require('gulp-sass')
coffee = require('gulp-coffee')
slim = require('gulp-slim')
minifyCss = require('gulp-minify-css')
rename = require('gulp-rename')
include = require('gulp-include')
sh = require('shelljs')
bowerSrc = require('gulp-bower-src')
mainBowerFiles = require('main-bower-files')
uglify = require 'gulp-uglify'
gulpFilter = require 'gulp-filter'
paths =
  css: ['./css/**/*.sass']
  coffee: ['./app/*.coffee']
  templates: ['./templates/**/*.slim']

gulp.task 'default', [ 'lib', 'templates', 'sass', 'coffee' ]

gulp.task 'templates', (done) ->
  gulp
    .src(paths.templates)
    .pipe(slim())
    .pipe(gulp.dest('./www/'))
    .on('end', done)
  return

gulp.task 'lib', ()->
  filter = gulpFilter('**/*.js', '!**/*.min.js')
  gulp.src(mainBowerFiles())
    .pipe(filter)
    #.pipe(uglify())
    .pipe(concat('lib.js'))
    .pipe(filter.restore())
    .pipe(gulp.dest('./www/js/'))

gulp.task 'coffee', () ->
  gulp
    .src('app/app.coffee')
    .pipe(include())
    .pipe(coffee(bare: true))
    .pipe(gulp.dest('./www/js/'))

gulp.task 'sass', (done) ->
  gulp
    .src(paths.css)
    .pipe(sass(
      {
        sourceComments: 'normal',
        includePaths: require('node-bourbon').includePaths
      }
    )).pipe(gulp.dest('./www/css/'))
    .pipe(minifyCss(keepSpecialComments: 0))
    .pipe(rename(extname: '.min.css'))
    .pipe(gulp.dest('./www/css/'))
    .on 'end', done
  return

gulp.task 'watch', ->
  gulp.watch paths.css, ['sass']
  gulp.watch paths.coffee, ['coffee']
  gulp.watch paths.templates, ['templates']
  return

gulp.task 'install', ['git-check'], ->
  bower.commands.install().on 'log', (data) ->
    gutil.log 'bower', gutil.colors.cyan(data.id), data.message

`
gulp.task('git-check', function(done) {
  if (!sh.which('git')) {
    console.log(
      '  ' + gutil.colors.red('Git is not installed.'),
      '\n  Git, the version control system, is required to download Ionic.',
      '\n  Download git here:', gutil.colors.cyan('http://git-scm.com/downloads') + '.',
      '\n  Once git is installed, run \'' + gutil.colors.cyan('gulp install') + '\' again.'
    );
    process.exit(1);
  }
  done();
});
`
