<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="-1">

    <link rel="icon" href="../../favicon.ico">

    <title>{{ App\Brand::where('active', 1)->first()->name }}{{ trans('backoffice.title_suffix') }}</title>

    <!-- CSS -->
    <link href="{{ asset('assets/css/font-awesome.min.css') }}" rel="stylesheet">
    @section('style')
    @show
    <link href="{{ asset('assets/sing/css/application.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/custom.css') }}" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

<!--
Main sidebar seen on the left. may be static or collapsing depending on selected state.

* Collapsing - navigation automatically collapse when mouse leaves it and expand when enters.
* Static - stays always open.
-->
<nav id="sidebar" class="sidebar" role="navigation">
    <!-- need this .js class to initiate slimscroll -->
    <div class="js-sidebar-content">
        <header class="logo hidden-xs">
            <a class="navbar-brand" href="{{ url('/admin/maps/list') }}">{{ App\Brand::where('active', 1)->first()->name }}</a>
        </header>

        <!-- main notification links are placed inside of .sidebar-nav -->
        <ul class="sidebar-nav">
            <li>
                <a href="{{ url('/admin/maps/list') }}" class="item" onClick="window.location.reload()"><i class="fa fa-map-o"></i> {{ trans('backoffice.maps') }}</a>
            </li>
            <li>
                <a href="{{ url('/admin/layers/list') }}" class="item" onClick="window.location.reload()"><i class="fa fa-database"></i> {{ trans('backoffice.layers') }}</a>
            </li>
            <li class="dropdown">
                <a class="collapsed" href="#sidebar-dashboard" data-toggle="collapse" data-parent="#sidebar"><i class="fa fa-cogs"></i> {{ trans('backoffice.system') }} <i class="toggle fa fa-angle-down"></i></a>
                <ul id="sidebar-dashboard" class="collapse">
                    <li><a href="{{ url('/admin/users/list') }}" class="item" onClick="window.location.reload()"><i class="fa fa-user"></i> {{ trans('backoffice.users') }}</a></li>
                    <li><a href="{{ url('/admin/roles/list') }}" class="item" onClick="window.location.reload()"><i class="fa fa-users"></i> {{ trans('backoffice.roles') }}</a></li>
                    <li><a href="{{ url('/admin/permissions/list') }}" class="item" onClick="window.location.reload()"><i class="fa fa-ban"></i> {{ trans('backoffice.permissions') }}</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<!-- This is the white navigation bar seen on the top. A bit enhanced BS navbar. See .page-controls in _base.scss. -->
<nav class="page-controls navbar navbar-default">
    <div class="container-fluid">

        <!-- this part is hidden for xs screens -->
        <div class="collapse navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li><a target="_blank" href="{{ url('/') }}"><i class="fa fa-globe"></i> {{ trans('backoffice.view_site') }}</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#"><i class="fa fa-user"></i> {{ \Auth::user()->name }} <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="{{ url('admin/profile') }}"><i class="fa fa-cog"></i> {{ trans('backoffice.my_account') }}</a></li>
                        <li><a href="{{ url('auth/logout') }}"><i class="fa fa-sign-out"></i> {{ trans('backoffice.logout') }}</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="content-wrap">
<main id="content" class="content" role="main">
        @if(Session::has('status'))
        <div class="alert alert-success">
            {{ Session::pull('status') }}
        </div>
        @endif

        <section class="widget">
            <div class="widget-body">
                @section('content')
                @show
            </div>
        </section>
        <!-- The Loader. Is shown when pjax happens -->
        <div class="loader-wrap hiding hide">
            <i class="fa fa-circle-o-notch fa-spin-fast"></i>
        </div>
        <div class="col-md-12">
            <hr>
            <p class="pull-right">{{ trans('backoffice.copyright', ['year' => date('Y')]) }}</p>
        </div>
    </main>
</div>

<!-- Bootstrap core JavaScript
    ================================================== -->

    <!-- common libraries. required for every page-->
    <script src="{{ asset('assets/js/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/jquery-pjax/jquery.pjax.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/bootstrap-sass/vendor/assets/javascripts/bootstrap/transition.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/bootstrap-sass/vendor/assets/javascripts/bootstrap/collapse.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/bootstrap-sass/vendor/assets/javascripts/bootstrap/dropdown.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/bootstrap-sass/vendor/assets/javascripts/bootstrap/button.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/bootstrap-sass/vendor/assets/javascripts/bootstrap/tooltip.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/bootstrap-sass/vendor/assets/javascripts/bootstrap/alert.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/jQuery-slimScroll/jquery.slimscroll.min.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/widgster/widgster.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/pace.js/pace.min.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/jquery-touchswipe/jquery.touchSwipe.js') }}"></script>

    <!-- common app js -->
    <script src="{{ asset('assets/sing/js/settings.js') }}"></script>
    <script src="{{ asset('assets/sing/js/app.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/bootstrap-sass/vendor/assets/javascripts/bootstrap/tab.js') }}"></script>

    <!-- page specific libs -->
    <script src="{{ asset('assets/sing/vendor/underscore/underscore-min.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/backbone/backbone.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/backbone.paginator/lib/backbone.paginator.min.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/backgrid/lib/backgrid.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/backgrid-paginator/backgrid-paginator.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/datatables/media/js/jquery.dataTables.js') }}"></script>
    <script src="{{ asset('assets/sing/vendor/bootstrap-select/bootstrap-select.min.js') }}"></script>

    <!-- page specific js -->
    <script src="{{ asset('assets/sing/js/tables-dynamic.js') }}"></script>

    <script src="{{ asset('assets/js/knockout-3.3.0.debug.js') }}"></script>
    <script src="{{ asset('assets/js/app.js') }}"></script>
    <script type="text/javascript">
        var BASE_URL = "{{ url('admin') }}";
    </script>
    <script type="text/javascript">
        $(function() {
            $('.navbar-nav .dropdown a.dropdown-toggle').on('click', function(event) {
                if($('.navbar-nav .dropdown').hasClass('open')) {
                    $('.navbar-nav .dropdown.open').removeClass('open');
                } else {
                    $(this).parent().addClass('open');
                }
                
                
            });
        });
    </script>

    @section('script')
    @show

</body>
</html>
