
@extends('admin/layout')

@section('style')
<link href="{{ asset('assets/css/jquery.dataTables.min.css') }}" rel="stylesheet" type="text/css">
@stop

@section('content')

<div class="row">
    <div class="col-md-12">
        
        <h1>{{ trans('backoffice.users') }}</h1>
        
        <p class="clearfix">
            <a class="btn btn-success pull-right" href="{{ url('admin/users/form') }}"><i class="fa fa-user"></i> {{ trans('backoffice.create_user') }}</a>
        </p>

        <table id="example" class="display table table-striped table-hover" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>{{ trans('backoffice.name') }}</th>
                    <th>{{ trans('backoffice.email') }}</th>
                    <th class="col-md-2">{{ trans('backoffice.options') }}</th>
                </tr>
            </thead>
        </table>

    </div>
</div>

@stop

@section('script')
<script type="text/javascript">
;(function($) {
    $(document).ready(function() {
        $('#example').dataTable({
            "ajax": "{{ url('admin/users') }}",
            "columns": [
                { "data": "name" },
                { "data": "email" },
                {
                    "orderable": false,
                    "searchable": false,
                    "render": function ( data, type, full, meta ) {
                        return '<a class="btn btn-info btn-xs" href="' + "{{ url('admin/users/form') }}/" + full.id + '"><i class="fa fa-pencil"></i></a>'
                            + '&nbsp;<a class="btn btn-danger btn-xs" href="' + "{{ url('admin/users/delete') }}/" + full.id + '"><i class="fa fa-trash"></i></a>'
                    }
                }
            ]
        });
    });
})(jQuery);
</script>
@stop
