<?php $__env->startSection('content'); ?>

    <section>
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <div class="tab-content" id="myTabContent">

<div class="card-header"><h3 class="card-title"><?php echo e(__('Add Tax Type')); ?></h3></div>
<form method="post" id="tax_type_form" class="form-horizontal" >
    <?php echo csrf_field(); ?>
    <div class="col-md-4 form-group">
        <label><?php echo e(__('Tax Name')); ?> *</label>
        <input type="text" name="name" id="name"  required class="form-control required"
               placeholder="<?php echo e(__('Tax Name')); ?>">
    </div>
    <div class="col-md-4 form-group">
        <?php if(config('variable.currency_format')=='suffix'): ?>
            <label><?php echo e(__('Tax Rate')); ?> (<?php echo e(config('variable.currency')); ?>) *</strong>
            </label>
        <?php else: ?>
            <label>(<?php echo e(config('variable.currency')); ?>) <?php echo e(__('Tax Rate')); ?></strong>
            </label>
        <?php endif; ?>

        <input type="text" name="rate" id="rate"  required class="form-control required"
               placeholder="<?php echo e(__('Tax Rate')); ?>">
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label><?php echo e(trans('file.Description')); ?></label>
            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
        </div>
    </div>
    <div class="col-md-6 form-group">
        <label><?php echo e(__('Tax Type')); ?></label>
        <select name="type" id="type" class="form-control selectpicker "
                data-live-search="true" data-live-search-style="contains"
                title='<?php echo e(__('Tax Type')); ?>'>
            <option value="fixed"><?php echo e(trans('file.Fixed')); ?></option>
            <option value="percentage"><?php echo e(trans('file.Percentage')); ?></option>
        </select>
    </div>
    <div class="col-md-4 form-group">
        <input type="submit" name="tax_type_submit" id="tax_type_submit" class="btn btn-success" value=<?php echo e(trans("file.Save")); ?>>
    </div>
</form>
<div class="container-fluid">
    <div class="card">
        <div class="card-body">
            <span class="tax_result"></span>
            <div class="table-responsive">
                <table id="tax_type-table" class="table ">
                    <thead>
                    <tr>
                        <th><?php echo e(__('Tax Name')); ?></th>
                        <th><?php echo e(__('Tax Rate')); ?></th>
                        <th><?php echo e(__('Tax Type')); ?></th>
                        <th><?php echo e(trans('file.Description')); ?></th>
                        <th class="not-exported"><?php echo e(trans('file.action')); ?></th>
                    </tr>
                    </thead>

                </table>
            </div>
        </div>
    </div>
</div>


<div id="TaxEditModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5 id="TaxModalLabel" class="modal-title"><?php echo e(trans('file.Edit')); ?></h5>

                <button type="button" data-dismiss="modal" id="tax_close" aria-label="Close" class="close"><span
                            aria-hidden="true">×</span></button>
            </div>
            <span class="tax_result_edit"></span>

            <div class="modal-body">
                <form method="post" id="tax_type_form_edit" class="form-horizontal" >

                    <?php echo csrf_field(); ?>
                    <div class="col-md-4 form-group">
                        <label><?php echo e(__('Tax Name')); ?> *</label>
                        <input type="text" name="name_edit" id="name_edit" required class="form-control"
                               placeholder="<?php echo e(__('Tax Name')); ?>">
                    </div>
                    <div class="col-md-4 form-group">
                        <?php if(config('variable.currency_format')=='suffix'): ?>
                            <label><?php echo e(__('Tax Rate')); ?> (<?php echo e(config('variable.currency')); ?>) *</strong>
                            </label>
                        <?php else: ?>
                            <label>(<?php echo e(config('variable.currency')); ?>) <?php echo e(__('Tax Rate')); ?></strong>
                            </label>
                        <?php endif; ?>
                        <input type="text" name="rate_edit" id="rate_edit" required class="form-control"
                               placeholder="<?php echo e(__('Tax Rate')); ?>">
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label><?php echo e(trans('file.Description')); ?></label>
                            <textarea class="form-control" id="description_edit" name="description_edit" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="col-md-6 form-group">
                        <label><?php echo e(__('Tax Type')); ?></label>
                        <select name="type_edit" id="type_edit" class="form-control selectpicker "
                                data-live-search="true" data-live-search-style="contains"
                                title='<?php echo e(__('Tax Type')); ?>'>
                            <option value="fixed"><?php echo e(trans('file.Fixed')); ?></option>
                            <option value="percentage"><?php echo e(trans('file.Percentage')); ?></option>
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <input type="hidden" name="hidden_tax_id" id="hidden_tax_id" />
                        <input type="submit" name="tax_type_edit_submit" id="tax_type_edit_submit" class="btn btn-success" value=<?php echo e(trans("file.Edit")); ?> />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


                </div>
            </div>
        </div>
    </div>

    </section>



 <?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
 <script type="text/javascript">
    (function($) {
        "use strict";
        $(document).ready(function() {
            <?php echo $__env->make('projects.tax_type.tax_type_js', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        });
    })(jQuery);
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\CRM\resources\views/projects/tax_type/tax_type.blade.php ENDPATH**/ ?>