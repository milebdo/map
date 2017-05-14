<!DOCTYPE html>
<html lang="en" ng-app="ngMap">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    @section('seo')
        <title>{{ $brand->name }}</title>
    @show

    <link href="{{ asset('assets/css/map_print.css') }}" rel="stylesheet" media="print">
    <link href="{{ asset('assets/css/ol.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/sing/css/application.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/custom.css') }}" rel="stylesheet">
    <!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
    <!--[if IE 9]>
        <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
    <link rel="shortcut icon" href="img/favicon.html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script>
        /* yeah we need this empty stylesheet here. It's cool chrome & chromium fix
         chrome fix https://code.google.com/p/chromium/issues/detail?id=167083
         https://code.google.com/p/chromium/issues/detail?id=332189
         */
    </script>
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
            <a href="{{ url('/') }}">{{ $brand->name }}</a>
        </header>

        <!-- main notification links are placed inside of .sidebar-nav -->
        <ul class="sidebar-nav">
            <li>
                <!-- an example of nested submenu. basic bootstrap collapse component -->
                <a class="collapsed" href="#sidebar-dashboard" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-desktop"></i>
                    </span>
                    Dashboard
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-dashboard" class="collapse">
                    <li>
                        <div ng-controller="ngLayerSwitcher" ng-cloak>
                           <div id="baseLayerSwitcher">
                               <select class="form-control" 
                                   ng-options="item.content.title for item in baseLayers"
                                   ng-model="baseLayer"
                                   ng-change="selectedBaseLayer()">
                               </select>
                           </div>
                           <div id="layerSwitcher">
                               <div ng-repeat="g in groupLayers">
                                   <h4 ng-click="toggleGroup(g)"><span class="fa fa-list"> <span ng-bind="g.title"></span></span></h4>
                                   <ul class="list-group" ng-show="g.visible">
                                       <li ng-repeat="l in g.layers" class="list-group-item checkbox">
                                           <label>
                                               <input ng-model="l.visible" ng-click="toggleLayer(l)"
                                                   type="checkbox" ng-checked="l.visible" />
                                               <span ng-bind="l.content.title"></span>
                                           </label>
                                           <span ng-show="l.content.seo_description.length"
                                               class="pull-right layer-details-toggle"
                                               data-toggle="collapse"
                                               data-target=".layer-details-@{{ l.id }}"><span class="caret"></span></span>
                                           <a ng-click="zoomLayer(l)" ng-show="l.ol.getVisible()"
                                               title="Zoom to layer extent"
                                               class="btn btn-xs pull-right"><i class="fa fa-expand"></i></a>
                                           <div class="collapse layer-details-@{{ l.id }}">
                                               <div ng-bind="l.content.seo_description"></div>
                                               <img ng-show="l.ol.get('legendURL')" ng-src="@{{ l.ol.get('legendURL') }}" />
                                           </div>
                                       </li>
                                   </ul>
                               </div>
                               <ul class="list-group" ng-show="layers.length">
                                   <li ng-repeat="l in layers" class="list-group-item checkbox">
                                       <label>
                                           <input ng-model="l.visible" ng-click="toggleLayer(l)"
                                               type="checkbox" ng-checked="l.visible" />
                                           <span ng-bind="l.content.title"></span>
                                       </label>
                                       <span ng-show="l.content.seo_description.length"
                                           class="pull-right layer-details-toggle"
                                           data-toggle="collapse"
                                           data-target=".layer-details-@{{ l.id }}"><span class="caret"></span></span>
                                       <a ng-click="zoomLayer(l)" ng-show="l.ol.getVisible()"
                                           title="Zoom to layer extent"
                                           class="btn btn-xs pull-right"><i class="fa fa-expand"></i></a>
                                       <div class="collapse layer-details layer-details-@{{ l.id }}">
                                           <div ng-bind="l.content.seo_description"></div>
                                           <img ng-show="l.ol.get('legendURL')" ng-src="@{{ l.ol.get('legendURL') }}" />
                                       </div>
                                   </li>
                               </ul>
                           </div>
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<!-- This is the white navigation bar seen on the top. A bit enhanced BS navbar. See .page-controls in _base.scss. -->
<nav class="page-controls navbar navbar-default">
    <div class="container-fluid">
        <!-- .navbar-header contains links seen on xs & sm screens -->
        <div class="navbar-header">
            <ul class="nav navbar-nav">
                <li>
                    <!-- whether to automatically collapse sidebar on mouseleave. If activated acts more like usual admin templates -->
                    <a class="hidden-sm hidden-xs" id="nav-state-toggle" href="#" title="Turn on/off sidebar collapsing" data-placement="bottom">
                        <i class="fa fa-bars fa-lg"></i>
                    </a>
                    <!-- shown on xs & sm screen. collapses and expands navigation -->
                    <a class="visible-sm visible-xs" id="nav-collapse-toggle" href="#" title="Show/hide sidebar" data-placement="bottom">
                        <span class="rounded rounded-lg bg-gray text-white visible-xs"><i class="fa fa-bars fa-lg"></i></span>
                        <i class="fa fa-bars fa-lg hidden-xs"></i>
                    </a>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="collapse" data-target="#map-items" aria-expanded="false" aria-controls="content">
                        {{ trans('layout.link_maps') }}
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" id="map-items">
                    @foreach(App\Map::getPublishedItems() as $item)
                        <li><a href="{{ url('maps/' . $item->id) }}">{{ $item->content->title }}</a></li>
                    @endforeach
                    </ul>
                </li>
            </ul>
            <form ng-controller="ngIdiom" ng-cloak
                class="navbar-form navbar-right">
                <select ng-model="selected"
                        ng-options="item for item in idioms"
                        ng-change="changeIdiom()"
                    class="form-control input-sm" title="{{ trans('layout.select_idiom') }}"></select>
            </form>
            <ul class="nav navbar-nav navbar-right visible-xs">
                <li>
                    <!-- toggles chat -->
                    <a href="#" data-toggle="chat-sidebar">
                        <span class="rounded rounded-lg bg-gray text-white"><i class="fa fa-globe fa-lg"></i></span>
                    </a>
                </li>
            </ul>
            <!-- xs & sm screen logo -->
            <a class="navbar-brand visible-xs" href="index.html">
                <i class="fa fa-circle text-gray mr-n-sm"></i>
                <i class="fa fa-circle text-warning"></i>
                &nbsp;
                sing
                &nbsp;
                <i class="fa fa-circle text-warning mr-n-sm"></i>
                <i class="fa fa-circle text-gray"></i>
            </a>
        </div>

        <!-- this part is hidden for xs screens -->
        <div class="collapse navbar-collapse">
           
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="collapse" data-target="#print" aria-expanded="false" aria-controls="content">
                        {{ trans('layout.link_print') }}
                        <span class="caret"></span>
                    </a>
                    <div class="dropdown-menu" id="print" ng-controller="ngPrint">
                        <form ng-submit="print()" class="form-inline">
                            <div class="form-group">
                                <select ng-model="selected"
                                    ng-change="updatePrintLayout()"
                                    class="form-control input-sm" title="{{ trans('layout.select_map_layout') }}">
                                    <option value="screen" selected="selected">{{ trans('layout.map_layout_screen') }}</option>
                                    <option value="a4v">{{ trans('layout.map_layout_a4v') }}</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-sm btn-primary">Print</button>
                        </form>
                    </div>
                </li>
                @if (!Auth::check())
                <li><a href="{{ url('auth/login') }}">{{ trans('layout.link_login') }}</a></li>
                @else
                <li><a href="{{ url('admin/dashboard') }}">{{ trans('layout.link_admin') }}</a></li>
                <li><a href="{{ url('auth/logout') }}">{{ trans('layout.link_logout') }}</a></li>
                @endif
            </ul>
            
            <ul ng-controller="ngNavigationToolbar" ng-cloak
                class="nav navbar-nav navbar-right">
                <li>
                    <a ng-click="fullView()"
                        class="btn" title="{{ trans('layout.map_navigation_full') }}">
                        <i class="fa fa-globe"></i>
                    </a>
                </li>
                <li>
                    <a ng-click="reset()"
                        class="btn" title="{{ trans('layout.map_navigation_reset') }}">
                        <i class="fa fa-hand-paper-o"></i>
                    </a>
                </li>
                <li>
                    <a ng-click="zoomBox()" ng-class="{'active': zoomBoxEnable}"
                        class="btn" title="{{ trans('layout.map_navigation_zoomin') }}">
                        <i class="fa fa-search-plus"></i>
                    </a>
                <li>
                    <a ng-click="zoomOut()"
                        class="btn" title="{{ trans('layout.map_navigation_zoomout') }}">
                        <i class="fa fa-search-minus"></i>
                    </a>
                </li>
                <li>
                    <a ng-click="previousView()"
                        class="btn" title="{{ trans('layout.map_navigation_previous') }}">
                        <i class="fa fa-mail-reply"></i>
                    </a>
                </li>
                <li>
                    <a ng-click="nextView()"
                        class="btn" title="{{ trans('layout.map_navigation_next') }}">
                        <i class="fa fa-mail-forward"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="content-wrap">
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
   <main id="content" class="map-content" role="main">
        <h1 class="page-title">Dashboard</h1>
        <div id="map"></div>
        <div id="print-version"></div>
    </main>
</div>


<!-- common libraries. required for every page-->
<script src="{{ asset('assets/js/jquery.min.js') }}" type="text/javascript"></script>
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

<!-- page specific libs -->
<script id="test" src="{{ asset('assets/sing/vendor/underscore/underscore.js') }}"></script>
<script src="{{ asset('assets/sing/vendor/jquery.sparkline/dist/jquery.sparkline.js') }}"></script>
<script src="{{ asset('assets/sing/vendor/d3/d3.min.js') }}"></script>
<script src="{{ asset('assets/sing/vendor/rickshaw/rickshaw.min.js') }}"></script>
<script src="{{ asset('assets/sing/vendor/bootstrap-sass/vendor/assets/javascripts/bootstrap/popover.js') }}"></script>
<script src="{{ asset('assets/sing/vendor/bootstrap-calendar/bootstrap_calendar/js/bootstrap_calendar.min.js') }}"></script>
<script src="{{ asset('assets/sing/vendor/jquery-animateNumber/jquery.animateNumber.min.js') }}"></script>

<!-- page specific js -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
@if(env('APP_ENV') === 'local')
<script src="{{ asset('assets/js/ekko-lightbox.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/buffer.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/wkx.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/proj4.js') }}"  type="text/javascript"></script>
<script src="{{ asset('assets/js/ol.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/lunr.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/angular.min.js') }}"  type="text/javascript"></script>
<script src="{{ asset('assets/js/ngMap.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/ngIdiom.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/ngContent.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/ngFeatureInfo.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/ngLayerSwitcher.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/ngSearchResults.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/ngNavigationToolbar.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/js/ngPrint.js') }}" type="text/javascript"></script>
@else
<script src="{{ asset('assets/js/production_map.js') }}" type="text/javascript"></script>
@endif

@section('script')
<script type="text/javascript">

    $(document).delegate('*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])', 'click', function(e) {
        e.preventDefault();
        return $(this).ekkoLightbox();
    });
    
    angular.module('ngMap').value('config', { 
        baseURL: '{!! url('/') !!}',
        idioms: {!! json_encode(\App\Idiom::getAvailableIdioms()) !!},
        idiomId: '{{ \App::getLocale() }}',
        mapId: {{ $map ? $map->id : null }}
    });
    
</script>
@show
</body>
</html>