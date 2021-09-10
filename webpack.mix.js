const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel applications. By default, we are compiling the CSS
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .postCss('resources/css/app.css', 'public/css', [
        require('postcss-import'),
        require('tailwindcss'),
    ]);

if (mix.inProduction()) {
    mix.version();
}

mix.styles([
    'resources/admin/vendors/bootstrap/dist/css/bootstrap.min.css',
    'resources/admin/vendors/font-awesome/css/font-awesome.min.css',
    'resources/admin/vendors/nprogress/nprogress.css" rel="stylesheet',
    'resources/admin/vendors/iCheck/skins/flat/green.css',
    'resources/admin/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css',
    'resources/admin/vendors/jqvmap/dist/jqvmap.min.css',
    'resources/admin/vendors/bootstrap-daterangepicker/daterangepicker.css',
    'resources/admin/build/css/custom.min.css',
    'resources/admin/vendors/DataTables/datatables.min.css',
    'resources/admin/vendors/DataTables/css/dataTables.bootstrap4.css'
],'public/css/main.css')
    .scripts([
    'resources/admin/vendors/jquery/dist/jquery.min.js',
    'resources/admin/vendors/bootstrap/dist/js/bootstrap.bundle.min.js',
    'resources/admin/vendors/fastclick/lib/fastclick.js',
    'resources/admin/vendors/nprogress/nprogress.js',
    'resources/admin/vendors/Chart.js/dist/Chart.min.js',
    'resources/admin/vendors/gauge.js/dist/gauge.min.js',
    'resources/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js',
    'resources/admin/vendors/iCheck/icheck.min.js',
    'resources/admin/vendors/skycons/skycons.js',
    'resources/admin/vendors/Flot/jquery.flot.js',
    'resources/admin/vendors/Flot/jquery.flot.pie.js',
    'resources/admin/vendors/Flot/jquery.flot.time.js',
    'resources/admin/vendors/Flot/jquery.flot.stack.js',
    'resources/admin/vendors/Flot/jquery.flot.resize.js',
    'resources/admin/vendors/flot.orderbars/js/jquery.flot.orderBars.js"',
    'resources/admin/vendors/flot-spline/js/jquery.flot.spline.min.js',
    'resources/admin/vendors/flot.curvedlines/curvedLines.js',
    'resources/admin/vendors/DateJS/build/date.js',
    'resources/admin/vendors/jqvmap/dist/jquery.vmap.js',
    'resources/admin/vendors/jqvmap/dist/maps/jquery.vmap.world.js',
    'resources/admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js',
    'resources/admin/vendors/moment/min/moment.min.js',
    'resources/admin/vendors/bootstrap-daterangepicker/daterangepicker.js',
    'resources/admin/vendors/DataTables/datatables.min.js',
    'resources/admin/admin/vendors/DataTables/js/dataTables.bootstrap4.min.js',
    'resources/admin/build/js/custom.min.js',
], 'public/js/main.js');
