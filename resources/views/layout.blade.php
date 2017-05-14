<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../favicon.ico">

        @section('seo')
        @show

        <!-- Layout styles -->
        <link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet">
        <link href="{{ asset('assets/sing/css/application.min.css') }}" rel="stylesheet">

        @section('style')
        @show

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
    </head>

    <body>
        
            
            @section('content')
            @show
            
    
        <!-- The Loader. Is shown when pjax happens -->
        <div class="loader-wrap hiding hide">
            <i class="fa fa-circle-o-notch fa-spin-fast"></i>
        </div>
        <script src="{{ asset('assets/js/jquery.min.js') }}" type="text/javascript"></script>
        <script src="{{ asset('assets/js/bootstrap.min.js') }}" type="text/javascript"></script>
        <script src="{{ asset('assets/js/ekko-lightbox.min.js') }}" type="text/javascript"></script>
        <script type="text/javascript">
        ;(function($) {
            $(document).delegate('*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])', 'click', function(e) {
                e.preventDefault();
                return $(this).ekkoLightbox();
            });
        })(jQuery);
        </script>
        @section('script')
        @show
        
    </body>
</html>
