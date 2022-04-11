@extends('layout.main')
@section('content')

<section>

        <div class="container-fluid"><span id="general_result"></span></div>


        <div class="container-fluid">
            @can('store-task')
                <button type="button" class="btn btn-info" name="create_record" id="create_record"><i
                            class="fa fa-plus"></i> {{__('Add Subtask')}}</button>
            @endcan
        </div>


        <div class="table-responsive mt-4">
            <table id="subtask-table" class="table ">
                <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>Category</th>
                    <th>Subtask</th>
                    <th class="not-exported text-center">{{trans('file.action')}}</th>
                </tr>
                </thead>
            </table>
        </div>
    </section>

    <div id="formModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{__('Add Subtask')}}</h5>
                    <button type="button" data-dismiss="modal" id="close" aria-label="Close" class="close"><i class="dripicons-cross"></i></button>
                </div>

                <div class="modal-body">
                    <span id="form_result"></span>
                    <span id="store_profile_photo"></span>

                    <form method="post" id="sample_form" class="form-horizontal">

                        @csrf
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label>Category <span class="text-danger">*</span></label>
                                <input type="text" name="category" id="category"  placeholder="category"
                                        required class="form-control">
                            </div>
                        </div>

                        <div id="subtask-item">
                        <div class="row">
                            <div class="col-md-11 form-group">
                                <label>Subtask 1 <span class="text-danger">*</span></label>
                                <input type="text" name="subtask[]" class="form-control" required>
                            </div>
                            <div class="col-md-1 form-group">
                                <br>
                                <button type="button" class="subtask-delete btn btn-danger btn-sm mt-2" disabled><i class="dripicons-trash"></i></button>
                            </div>
                        </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <button type="button" class="btn btn-info add-subtask">Add Subtask</button>
                            </div>
                        </div>

                            <div class="container">
                                <div class="form-group" align="center">
                                    <input type="hidden" name="action" id="action"/>
                                    <input type="hidden" name="hidden_id" id="hidden_id"/>
                                    <input type="submit" name="action_button" id="action_button" class="btn btn-warning"
                                           value="Save">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <div id="confirmModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">{{trans('file.Confirmation')}}</h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <h4 align="center">{{__('Are you sure you want to remove this data?')}}</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" name="ok_button" id="ok_button" class="btn btn-danger">{{trans('file.OK')}}'
                    </button>
                    <button type="button" class="close btn-default"
                            data-dismiss="modal">{{trans('file.Cancel')}}</button>
                </div>
            </div>
        </div>
    </div>
<style>
#subtask-table
{
    width:100%;
}
.tag {
      margin-right: 2px;
      color: red !important;
      background-color: #0d6efd;
      padding: 0.2rem;
    }
</style>
@endsection
@push('scripts')

<script>
    $(document).ready(function(){
    
        
        let table_table = $('#subtask-table').DataTable({
                initComplete: function () {
                    this.api().columns([1]).every(function () {
                        var column = this;
                        var select = $('<select><option value=""></option></select>')
                            .appendTo($(column.footer()).empty())
                            .on('change', function () {
                                var val = $.fn.dataTable.util.escapeRegex(
                                    $(this).val()
                                );

                                column
                                    .search(val ? '^' + val + '$' : '', true, false)
                                    .draw();
                            });

                        column.data().unique().sort().each(function (d, j) {
                            select.append('<option value="' + d + '">' + d + '</option>');
                            $('select').selectpicker('refresh');
                        });
                    });
                },
                responsive: true,
                fixedHeader: {
                    header: true,
                    footer: true
                },
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('subtasks.index') }}",
                },

                columns: [

                    {
                        data: 'id',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'subtask',
                        name: 'subtask',
                    },
                    {
                        data: 'meta',
                        name: 'meta',
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false
                    }
                ],


                "order": [],
                'language': {
                    'lengthMenu': '_MENU_ {{__("records per page")}}',
                    "info": '{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)',
                    "search": '{{trans("file.Search")}}',
                    'paginate': {
                        'previous': '{{trans("file.Previous")}}',
                        'next': '{{trans("file.Next")}}'
                    }
                },
                'columnDefs': [
                    {
                        "orderable": false,
                        'targets': [0, 3],
                    },
                    {
                        'render' : function (data, type, row, meta)
                        {
                            var sr =0;
                            var a = "";
                            $.each(data, function(index, value){
                                sr++;
                                a +=sr+") "+ value+"<br>";
                            })
                            return a;
                        },
                        'targets': [2]
                    },
                    {
                        'render': function (data, type, row, meta) {
                            if (type == 'display') {
                                data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                            }

                            return data;
                        },
                        'checkboxes': {
                            'selectRow': true,
                            'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                        },
                        'targets': [0]
                    }
                ],


                'select': {style: 'multi', selector: 'td:first-child'},
                'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
                dom: '<"row"lfB>rtip',
                buttons: [
                    {
                        extend: 'pdf',
                        text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                        exportOptions: {
                            columns: ':visible:Not(.not-exported)',
                            rows: ':visible'
                        },
                    },
                    {
                        extend: 'csv',
                        text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                        exportOptions: {
                            columns: ':visible:Not(.not-exported)',
                            rows: ':visible'
                        },
                    },
                    {
                        extend: 'print',
                        text: '<i title="print" class="fa fa-print"></i>',
                        exportOptions: {
                            columns: ':visible:Not(.not-exported)',
                            rows: ':visible'
                        },
                    },
                    {
                        extend: 'colvis',
                        text: '<i title="column visibility" class="fa fa-eye"></i>',
                        columns: ':gt(0)'
                    },
                ],
            });
            new $.fn.dataTable.FixedHeader(table_table);

        $("#create_record").click(function(){

            $('.modal-title').text('{{__('Add Subtask')}}');
            $('#store_profile_photo').html('');
            $('#action_button').val('{{trans("file.Add")}}');
            $('#action').val('{{trans("file.Add")}}');
            $('.hide-add').hide();
            $('.hide-edit').show();
            $('#formModal').modal('show');
        })

        $('#sample_form').on('submit', function (event) {
            event.preventDefault();

            if ($('#action').val() == '{{trans('file.Add')}}') {
            $.ajax({
                    url: "{{ route('subtasks.store') }}",
                    method: "POST",
                    data: new FormData(this),
                    contentType: false,
                    cache: false,
                    processData: false,
                    dataType: "json",
                    success: function (data) {
                        console.log(data);

                        var html = '';
                        if (data.errors) {
                            html = '<div class="alert alert-danger">';
                            for (var count = 0; count < data.errors.length; count++) {
                                html += '<p>' + data.errors[count] + '</p>';
                            }
                            html += '</div>';
                        }
                        if (data.success) {
                            html = '<div class="alert alert-success">' + data.success + '</div>';
                            $('#sample_form')[0].reset();
                            $('select').selectpicker('refresh');
                            $('#subtask-table').DataTable().ajax.reload();
                            $('#formModal').modal('hide');
                        }
                        $('#form_result').html(html).slideDown(300).delay(5000).slideUp(300);
                    }
                });
            }
            if ($('#action').val() == '{{trans('file.Edit')}}') {
                $.ajax({
                    url: "{{ route('subtasks.update') }}",
                    method: "POST",
                    data: new FormData(this),
                    contentType: false,
                    cache: false,
                    processData: false,
                    dataType: "json",
                    success: function (data) {
                        var html = '';
                        if (data.errors) {
                            html = '<div class="alert alert-danger">';
                            for (var count = 0; count < data.errors.length; count++) {
                                html += '<p>' + data.errors[count] + '</p>';
                            }
                            html += '</div>';
                        }
                        if (data.error) {
                            html = '<div class="alert alert-success">' + data.error + '</div>';
                        }
                        if (data.success) {
                            html = '<div class="alert alert-success">' + data.success + '</div>';
                            setTimeout(function () {
                                $('#formModal').modal('hide');
                                $('select').selectpicker('refresh');
                                $('#subtask-table').DataTable().ajax.reload();
                                $('#sample_form')[0].reset();
                            }, 2000);

                        }
                        $('#form_result').html(html).slideDown(300).delay(5000).slideUp(300);
                    }
                });
            }
        });

        $(document).on('click', '.edit', function () {

            var id = $(this).attr('id');
            $('#form_result').html('');
            $('.hide-edit').hide();
            $('.hide-add').show();
            $('#store_profile_photo').html('');

            var target = "{{ route('subtasks.index') }}/" + id + '/edit';

            $.ajax({
                url: target,
                dataType: "json",
                success: function (html) {

                    $('#category').val(html.data.subtask);

                    $("#subtask-item").empty();
                    $.each(JSON.parse(html.data.meta), function(index, value) {
                        var id = Math.random();
                        $("#subtask-item").append('<div class="row" id="'+id+'"><div class="col-md-11 form-group"><label>Subtask 1 <span class="text-danger">*</span></label><input type="text" name="subtask[]" value="'+value+'" class="form-control" required></div><div class="col-md-1 form-group"><br><button type="button" class="subtask-delete btn btn-danger btn-sm mt-2" id="'+id+'"><i class="dripicons-trash"></i></button></div></div>');
                    });
                   
                    reorder();
                    $('#hidden_id').val(html.data.id);
                    $('.modal-title').text('{{trans('file.Edit')}}');
                    $('#action_button').val('{{trans('file.Edit')}}');
                    $('#action').val('{{trans('file.Edit')}}');
                    $('#formModal').modal('show');
                }
            })
        });

        let delete_id;

        $(document).on('click', '.delete', function () {
            delete_id = $(this).attr('id');
            $('#confirmModal').modal('show');
            $('.modal-title').text('{{__('DELETE Record')}}');
            $('#ok_button').text('{{trans('file.OK')}}');

        });

        $('#ok_button').on('click', function () {
            let target = "{{ route('subtasks.index') }}/" + delete_id + '/delete';
            $.ajax({
                url: target,
                beforeSend: function () {
                    $('#ok_button').text('{{trans('file.Deleting...')}}');
                },
                success: function (data) {
                    let html = '';
                    if (data.success) {
                        html = '<div class="alert alert-success">' + data.success + '</div>';
                    }
                    if (data.error) {
                        html = '<div class="alert alert-danger">' + data.error + '</div>';
                    }
                    setTimeout(function () {
                        $('#general_result').html(html).slideDown(300).delay(5000).slideUp(300);
                        $('#confirmModal').modal('hide');
                        $('#subtask-table').DataTable().ajax.reload();
                    }, 2000);
                }
            })
        });


        $(".add-subtask").on('click', function(){

            var id = Math.random();

            $("#subtask-item").append('<div class="row" id="'+id+'"><div class="col-md-11 form-group"><label>Subtask 1 <span class="text-danger">*</span></label><input type="text" name="subtask[]" class="form-control" required></div><div class="col-md-1 form-group"><br><button type="button" class="subtask-delete btn btn-danger btn-sm mt-2" id="'+id+'"><i class="dripicons-trash"></i></button></div></div>');
            reorder();
        })

        $(document).on('click', '.subtask-delete', function () {
            var id = $(this).attr('id');
            $(this).parent().parent().remove();
            reorder();
        })
    })

    function reorder()
    {
        var sr = 0;
        $('#subtask-item').find('label').each(function(index,value){
            sr++;
            var a = $(this).html('Subtask '+sr+' <span class="text-danger">*</span>');
        });
    }
</script>
@endpush