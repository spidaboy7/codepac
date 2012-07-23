<?php
$this->breadcrumbs=array(
	'Questions'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List Question', 'url'=>array('index')),
	array('label'=>'Create Question', 'url'=>array('create')),
	array('label'=>'Update Question', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Question', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Question', 'url'=>array('admin')),
);
?>

<h1><?php echo $model->title; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		
		
		'owner',
		'status',
		'create_date',
		'update_time',
                 array(
                  'name'=>'content',
                   'value'=>html_entity_decode($model->content),
                   'type'=>'raw'),
	),
)); ?>


<?php if($model->answerCount>=1 ):?>
<h3>
<?php echo $model->answerCount>1 ? $model->answerCount.' comments': 'One comment';?>
</h3>

<?php $this->renderPartial('_answers',array('answer'=>$model->answers));?>

<?php endif;?>
<h3>Leave a comment</h3>
<?php if(Yii::app()->user->hasFlash('answerSubmitted')):?>
<div class="flash-success">
<?php echo Yii::app()->user->getFlash('answerSubmitted');?>
</div>
<?php endif;?>
<?php $this->renderpartial('/answer/_form',array('model'=>$answer,));?>



