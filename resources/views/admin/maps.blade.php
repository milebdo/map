
@extends('admin/layout')

@section('content')
        
        <h1>{{ trans('backoffice.maps') }}</h1>
        
        <p class="clearfix">
            <a class="btn btn-success pull-right" href="{{ url('admin/maps/form') }}"><i class="fa fa-map-o"></i> {{ trans('backoffice.create_map') }}</a>
        </p>
        <div class="mt">
        <table id="maps" class="table table-striped table-hover">
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

@stop

@section('script')
<script src=" {{ asset('assets/js/jquery.dataTables.min.js') }}" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#maps').dataTable({
            "ajax": "{{ url('admin/maps') }}",
            "columns": [
                { "data": "content.title" },
                {
                    "orderable": false,
                    "searchable": false,
                    "render": function ( data, type, full, meta ) {
                        return '<a class="btn btn-success btn-xs" title="{{ trans('backoffice.edit') }}" href="' + "{{ url('admin/maps/form') }}/" + full.id + '"><i class="fa fa-pencil"></i></a>'
                            + '&nbsp;<a class="btn btn-danger btn-xs" title="{{ trans('backoffice.delete') }}" href="' + "{{ url('admin/maps/delete') }}/" + full.id + '"><i class="fa fa-trash"></i></a>';
                    }
                }
            ]
        });
    });
</script>
@stop
