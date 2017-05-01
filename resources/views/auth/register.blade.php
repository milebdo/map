<!-- resources/views/auth/register.blade.php -->

@extends('layout')

@section('seo')
<title>{{ trans('layout.title_register') }}</title>
@stop

@section('content')
<div class="container">
    <main id="content" class="widget-login-container" role="main">
        <div class="row">
            <div class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">
                <h4 class="widget-login-logo animated fadeInUp">
                    <i class="fa fa-circle text-gray"></i>
                    {{ trans('layout.title_register') }}
                    <i class="fa fa-circle text-warning"></i>
                </h4>
                <section class="widget widget-login animated fadeInUp">
                    <div class="widget-body">
                        <form class="login-form mt-lg" method="POST" action="{{ url('/auth/register') }}">
                        {!! csrf_field() !!}
                        <div class="form-group">
                            <label for="registerName">{{ trans('layout.label_username') }}</label>
                            <input class="form-control" type="text" name="name" id="registerName" value="{{ old('name') }}">
                            <span class="help-block alert-danger">{{ $errors->first('name') }}</span>
                        </div>

                        <div class="form-group">
                            <label for="registerEmail">{{ trans('layout.label_email') }}</label>
                            <input class="form-control" type="email" name="email" id="registerEmail" value="{{ old('email') }}">
                            <span class="help-block alert-danger">{{ $errors->first('email') }}</span>
                        </div>

                        <div class="form-group">
                            <label for="registerPassword">{{ trans('layout.label_password') }}</label>
                            <input class="form-control" type="password" name="password" id="registerPassword">
                            <span class="help-block alert-danger">{{ $errors->first('password') }}</span>
                        </div>

                        <div class="form-group">
                            <label for="registerPassword2">{{ trans('layout.label_confirmpassword') }}</label>
                            <input class="form-control" type="password" name="password_confirmation"  id="registerPassword2">
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">{{ trans('layout.btn_register') }}</button>
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