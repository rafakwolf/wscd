var gulp = require('gulp');
var concatCss = require('gulp-concat-css');
var del = require('del');

const filesFolder = '../Win32/Debug/files/';
const cssLibs = './styles/*.css';
const bootstrapFiles = './node_modules/bootstrap/dist/**';
const fontAwesomeCssFiles = './node_modules/font-awesome/css/*.min.css';
const fontAwesomeFontFiles = './node_modules/font-awesome/fonts/**';
const sweetAlertFiles = './node_modules/sweetalert/dist/**';

gulp.task('copy-html', () => {
    return gulp.src('./src/menu.html')
        .pipe(gulp.dest(filesFolder));
});

gulp.task('css', () => {
    return gulp.src(cssLibs)
        .pipe(concatCss("styles.css"))
        .pipe(gulp.dest(filesFolder + 'styles/'));
});

gulp.task('bootstrap', () => {
    return gulp.src(bootstrapFiles)
        .pipe(gulp.dest(filesFolder + 'bootstrap/'));
});

gulp.task('font-awesome-css', () => {
    return gulp.src(fontAwesomeCssFiles)
        .pipe(gulp.dest(filesFolder + 'font-awesome/css/'));
});

gulp.task('font-awesome-fonts', () => {
    return gulp.src(fontAwesomeFontFiles)
        .pipe(gulp.dest(filesFolder + 'font-awesome/fonts/'));
});

gulp.task('sweet-alert', () => {
    return gulp.src(sweetAlertFiles)
        .pipe(gulp.dest(filesFolder + 'sweet-alert/'));
});

gulp.task('clean', function () {
    return del(filesFolder + '/**', {
        force: true
    });
});

gulp.task('default', ['copy-html', 'css', 'bootstrap', 'font-awesome-css', 'font-awesome-fonts', 'sweet-alert'], () => {
});