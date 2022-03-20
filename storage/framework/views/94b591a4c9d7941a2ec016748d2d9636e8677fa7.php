<?php $__env->startSection('content'); ?>

	<section>
		<div class="container-fluid">
			<div class="card">
				<div class="card-body">

						<?php $__currentLoopData = $all_notification; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $notification): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
							<div class="appointment-list-item">
							<a href=<?php echo e($notification->data['link']); ?>><?php echo e($notification->data['data']); ?></a>
							</div>
						<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

					<?php if(count($all_notification) > 0): ?>
						<div class="text-center">
							<a href="<?php echo e(route('clearAll')); ?>" class="btn btn-link"><?php echo e(__('Clear All')); ?></a>
						</div>
					<?php else: ?>
						<p class="large-text dark-text text-center"><?php echo e(__('No notifications for you at the moment!')); ?></p>
					<?php endif; ?>
				</div>
			</div>
		</div>
	</section>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home5/neworatec/posh-core.neworatec.com/resources/views/shared/all_notifications.blade.php ENDPATH**/ ?>