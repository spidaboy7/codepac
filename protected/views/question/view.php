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
 <?php $qowner=YumUser::model()->findByPk($model->owner);?>
<div class="question-view" style="width:700px;">
	<div class="question-header-wrapper" style="height:20px;">
		<div id="question-vote" style="float:left;">
			<span id="up-vote-image"><img src="/codepacu/images/site/vote-arrow-up.png"><span></br>
			<span id="question-vote-number"><?php echo $model->vote;?></span>Votes</br>
			<span id="down-vote-image"><img src="/codepacu/images/site/vote-arrow-down.png"><span></br>
			
		</div>
		<div class="question-user-time" style="float:center;"><span class="question-owner"><?php echo "posted by ".$qowner->username." on ".$model->create_date;?> </span></div>
	</div>
	<div><?php echo html_entity_decode($model->content);?></div>
</div>
                  


<?php if($model->answerCount>=1 ):?>
<h3>
<?php echo $model->answerCount>1 ? $model->answerCount.' Answers': 'Answers';?>
</h3>

<?php $this->renderPartial('_answers',array('answer'=>$model->answers));?>

<?php endif;?>
<h3>Reply this question</h3>
<?php if(Yii::app()->user->hasFlash('answerSubmitted')):?>
<div class="flash-success">
<?php echo Yii::app()->user->getFlash('answerSubmitted');?>
</div>
<?php endif;?>
<?php $this->renderpartial('/answer/_form',array('model'=>$answer,));?>



