<div class="answer">

<?php $img_down="<img src='../../../../images/site/vote-down.png'>";?>	
<?php $img_up="<img src='../../../../images/site/vote-up.png'>";?>	
<?php foreach($answer as $ans): ?>
<div class="ans-row">
	<div class="ans-user">
	<?php $user=YumUser::model()->findByPk($ans->owner);
		echo	$user->getAvatar();
		echo "<br>";
		echo    $user->username;
	?>
	</div>
	<div class="ans-content" >
	
	<?php echo html_entity_decode($ans->content)?>
	<br/>	
	<span id="ans-upvote-<?php echo "$ans->id";?>" style="color:green;"><?php echo $ans->up_vote;?></span><span>
 	<?php echo CHtml::ajaxLink ($img_up,Yii::app()->createUrl('answer/upvote/id/'.$ans->id),
        array('type' =>'POST',
                'data'=> CJSON::encode($ans->id),
                'update'=>'#ans-upvote-'.$ans->id));?>
        </span>

	<span id="ans-downvote-<?php echo"$ans->id"; ?>" style="color:red;"><?php echo $ans->down_vote;?></span><span>
	<?php echo CHtml::ajaxLink ($img_down,Yii::app()->createUrl('answer/downvote/id/'.$ans->id), 
	array('type' =>'POST',
		'data'=> CJSON::encode($ans->id),
		'update'=>'#ans-downvote-'.$ans->id));?>
	</span>
	</div>
</div>	
<?php endforeach;?>
</div>


