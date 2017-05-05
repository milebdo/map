<!-- resources/views/auth/login.blade.php -->

@extends('layout')

@section('seo')
<title>{{ trans('layout.title_login') }}</title>
@stop

@section('content')

<div class="container">
    <main id="content" class="widget-login-container" role="main">
        <div class="row">
            <div class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">
                <h4 class="widget-login-logo animated fadeInUp">
                    <i class="fa fa-circle text-gray"></i>
                    {{ trans('layout.title_login') }}
                    <i class="fa fa-circle text-warning"></i>
                </h4>
                <section class="widget widget-login animated fadeInUp">
                    <div class="widget-body">
                        <form class="login-form mt-lg" method="POST" action="{{ url('/auth/login') }}">
                        {!! csrf_field() !!}
                            <div class="form-group">
                                <label for="loginEmail">{{ trans('layout.label_email') }}</label>
                                <input class="form-control" type="email" name="email" id="loginEmail" value="{{ old('email') }}">
                                <span class="help-block alert-danger">{{ $errors->first('email') }}</span>
    
                            </div>
                            <div class="form-group">
                                <label for="loginPassword">{{ trans('layout.label_password') }}</label>
                                   <input class="form-control" type="password" name="password" id="loginPassword">
                                   <span class="help-block alert-danger">{{ $errors->first('password') }}</span>
                            </div>
                            <div class="clearfix">
                                <div class="checkbox widget-login-info pull-right ml-n-lg">
                                <label>
                                    <input type="checkbox" name="remember"> {{ trans('layout.label_rememberme') }}
                                </label>
                                <br /><a href="{{ url('password/email') }}">{{ trans('layout.link_resetpassword') }}</a>
                            </div>
                            </div>

                            <div class="form-group">
                                <button class="btn btn-primary" type="submit">{{ trans('layout.btn_login') }}</button>
                                <a class="btn btn-warning" href="{{ url('/') }}">{{ trans('layout.link_cancel') }}</a>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </main>
</div>
<!-- The Loader. Is shown when pjax happens -->
<div class="loader-wrap hiding hide">
    <i class="fa fa-circle-o-notch fa-spin-fast"></i>
</div>
@stop