const gulp = require('gulp');
const ts = require('gulp-typescript');
const less = require('gulp-less');
const clean = require('gulp-clean');
const tsProject = ts.createProject('./tsconfig.json');
const sourcemaps = require('gulp-sourcemaps');
const browserSync = require('browser-sync').create();
const watch = require('gulp-watch');

gulp.task('clean', async function() {
  await gulp.src('./public', {allowEmpty: true})
  .pipe(clean());
});

gulp.task('less', async function () {
  await gulp.src('./src/less/style.less', {allowEmpty: true})
    .pipe(sourcemaps.init())
    .pipe(less())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('./public/css/'))
});

gulp.task('ts', async function () {
  await gulp.src(tsProject.config.include, {allowEmpty: true})
    .pipe(tsProject())
    .pipe(gulp.dest(tsProject.config.compilerOptions.outDir))
});

gulp.task('browserSync', function() {
  browserSync.init({
    files: ['./view/*.html', './public/**/*.*'],
    server: {
      baseDir: './',
      index: './view/index.html'
    },
    port: 3001,
    notify: false
  });

  gulp.watch('./src/ts/*.ts', gulp.series('ts'));
  gulp.watch('./src/less/*.less', gulp.series('less'));
});

gulp.task('default', gulp.series('browserSync'));