<?php $__env->startSection('content'); ?>

    <section>

        <?php echo $__env->make('shared.errors', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php echo $__env->make('shared.flash_message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

        <div class="table-responsive">
            <table id="user-login-table" class="table ">
                <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th><?php echo e(__('Image')); ?></th>
                    <th><?php echo e(trans('file.Username')); ?></th>
                    <th><?php echo e(__('Last Login Date')); ?></th>
                    <th><?php echo e(__('Last Login IP')); ?></th>
                    <th><?php echo e(trans('file.status')); ?></th>
                </tr>
                </thead>
                <tbody>
                <?php $__currentLoopData = $login_info; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr data-id="<?php echo e($user->id); ?>">
                        <td><?php echo e($key); ?></td>
                        <?php if($user->profile_photo): ?>
                            <td><img src="<?php echo e(url('uploads/profile_photos',$user->profile_photo)); ?>" height="80"
                                     width="80">
                            </td>
                        <?php else: ?>
                            <td><img src="<?php echo e(url('logo/avatar.jpg')); ?>" height="80" width="80">
                            </td>
                        <?php endif; ?>
                        <td><?php echo e($user->username); ?></td>
                        <?php if($user->last_login_date == null): ?>
                            <td></td>
                        <?php else: ?>
                        <td><?php echo e($user->last_login_date); ?></td>
                        <?php endif; ?>
                        <td><?php echo e($user->last_login_ip); ?></td>
                        <?php if($user->is_active): ?>
                            <td>
                                <div class="badge badge-success"><?php echo e(trans('file.Active')); ?></div>
                            </td>
                        <?php else: ?>
                            <td>
                                <div class="badge badge-danger"><?php echo e(trans('file.Inactive')); ?></div>
                            </td>
                        <?php endif; ?>

                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </tbody>
            </table>
        </div>
    </section>




<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script type="text/javascript">
    (function($) {
        "use strict";

        $(document).ready(function(){
            $(".alert").slideDown(300).delay(5000).slideUp(300);
        });

        $("ul#hrm").siblings('a').attr('aria-expanded', 'true');
        $("ul#hrm").addClass("show");
        $("ul#hrm #employee-menu").addClass("active");



        $('#user-login-table').DataTable({
            initComplete: function () {
                this.api().columns([2, 4]).every(function () {
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
            "order": [],
            'language': {
                'lengthMenu': '_MENU_ <?php echo e(__('records per page')); ?>',
                "info": '<?php echo e(trans("file.Showing")); ?> _START_ - _END_ (_TOTAL_)',
                "search": '<?php echo e(trans("file.Search")); ?>',
                'paginate': {
                    'previous': '<?php echo e(trans("file.Previous")); ?>',
                    'next': '<?php echo e(trans("file.Next")); ?>'
                }
            },
            'columnDefs': [
                {
                    "orderable": false,
                    'targets': [0]
                },
                {
                    'render': function(data, type, row, meta){
                        if(type == 'display'){
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
            'lengthMenu': [[20, 50,100, -1], [20, 50,100, "All"]],
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
    })(jQuery);
</script>
<?php $__env->stopPush(); ?>



<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home5/neworatec/posh-core.neworatec.com/resources/views/all_user/login_info.blade.php ENDPATH**/ ?>