
@extends('admin/layout')

@section('style')
<link href="{{ asset('assets/css/jquery.dataTables.min.css') }}" rel="stylesheet" type="text/css">
@stop

@section('content')

<div class="row">
    <div class="col-md-12">
        
        <h1>{{ trans('backoffice.contents') }}</h1>
        
        <p class="clearfix">
            <a class="btn btn-success pull-right" href="{{ url('admin/contents/form') }}"><i class="fa fa-file"></i> {{ trans('backoffice.create_content') }}</a>
        </p>

        <table id="example" class="display table table-striped table-hover table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>{{ trans('backoffice.title') }}</th>
                    <th class="col-md-2">{{ trans('backoffice.options') }}</th>
                </tr>
            </thead>

            <tfoot>
                <tr>
                    <th>{{ trans('backoffice.title') }}</th>
                    <th>{{ trans('backoffice.options') }}</th>
                </tr>
            </tfoot>
        </table>

    </div>
</div>

@stop

@section('script')
<script src=" {{ asset('assets/js/jquery.dataTables.min.js') }}" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable({
            "ajax": "{{ url('admin/contents') }}",
            "columns": [
                { "data": "title" },
                {
                    "orderable": false,
                    "searchable": false,
                    "render": function ( data, type, full, meta ) {
                        return '<a class="btn btn-success btn-xs" title="{{ trans('backoffice.edit') }}" href="' + "{{ url('admin/contents/form') }}/" + full.id + '"><i class="fa fa-pencil"></i></a>'
                            + '&nbsp;<a class="btn btn-info btn-xs" title="{{ trans('backoffice.copy') }}" href="' + "{{ url('admin/contents/copy') }}/" + full.id + '"><i class="fa fa-copy"></i></a>'
                            + '&nbsp;<a class="btn btn-warning btn-xs" title="{{ trans('backoffice.ownership') }}" href="' + "{{ url('admin/contents/ownership') }}/" + full.id + '"><i class="fa fa-user"></i></a>'
                            + '&nbsp;<a class="btn btn-danger btn-xs" title="{{ trans('backoffice.delete') }}" href="' + "{{ url('admin/contents/delete') }}/" + full.id + '"><i class="fa fa-trash"></i></a>';
                    }
                }
            ]
        });
    });
</script>
@stop
