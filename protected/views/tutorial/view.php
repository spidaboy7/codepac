<?php
$this->breadcrumbs=array(
	'Tutorials'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List Tutorial', 'url'=>array('index')),
	array('label'=>'Create Tutorial', 'url'=>array('create')),
	array('label'=>'Update Tutorial', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Tutorial', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Tutorial', 'url'=>array('admin')),
);
?>

<h1><?php echo $model->title; ?></h1>



<div class="tutorial">
	<div class="tutorial-user">
	
	</div>
	<div class="tutorial-content">
	<?php echo CHtml::decode($model->content);?>
	</div>
</div>


<?php if($model->commentCount>=1 ):?>
<h3>
<?php echo $model->commentCount>1 ? $model->commentCount.' comments': ' comments';?>
</h3>

<?php $this->renderPartial('_comments',array('comments'=>$model->comments));?>

<?php endif;?>
<h3>Leave a comment</h3>
<?php if(Yii::app()->user->hasFlash('commentSubmitted')):?>
<div class="flash-success">
<?php echo Yii::app()->user->getFlash('commentSubmitted');?>
</div>
<?php endif;?>
<?php $this->renderpartial('/comment/_form',array('model'=>$comment,));?>


