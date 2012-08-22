
<div class="view">
	<div class="question-action">
	<span class="question-vote">1 Votes</span><span class="question-answer-count"><?php echo CHtml::encode($data->answerCount)." Answers"?></span><span class="question-views">2 views</span>
	</div>
	<div class="question-title">
	<?php echo CHtml::link(CHtml::encode($data->title), array('view', 'id'=>$data->id)); ?>
	</div>
	



	<div class="question-owner">
	
	<span><?php 
	echo CHtml::encode($data->create_date)?></span>
	<span><?php echo CHtml::encode($data->owner); ?></span>
	</div>

</div>
