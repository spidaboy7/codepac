<div class="form">

<script type="text/javascript" src="/codepacu/css/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/codepacu/css/custom_js.js"></script>
<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'question-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'title'); ?>
		<?php echo $form->textField($model,'title',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'title'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Question'); ?>
                <div id="wmd-button-bar" class="wmd-panel"></div>
		<div><?php echo $form->textArea($model,'content',array('rows'=>6, 'cols'=>50,'class'=>'wmd-panel','id'=>'wmd-input')); ?></div>
		<?php echo $form->error($model,'content'); ?>
                
                <div id="wmd-preview" class="wmd-panel"></div>
	</div>

	

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
