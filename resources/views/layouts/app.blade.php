<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">

        <!-- Styles -->
        <link rel="stylesheet" href="{{ mix('css/app.css') }}">
        <link rel="stylesheet" href="{{ mix('css/main.css') }}">
        @livewireStyles

        <!-- Scripts -->
        <script src="{{ mix('js/app.js') }}" defer></script>
    </head>
    <body class="nav-md">
        <div class="container body">
        <div class="main_container">
            <!--sidebar-->
            @include('layouts.shared.sidebar')
            <!--/sidebar-->

            <!-- top navigation -->
            @include('layouts.shared.navbar')
            <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">
            <main>
                {{ $slot }}
            </main>
            </div>
            <!-- /page content -->

            <!-- footer content -->
            @include('layouts.shared.footer')
            <!-- /footer content -->
        </div>
        </div>

    <!-- script --> 
    <script type="text/javascript" src="{{ mix('js/app.js') }}"></script>
    <script type="text/javascript" src="{{ mix('js/main.js') }}"></script>
    @livewireScripts
    @yield('custom_script')   
  </body>
</html>
