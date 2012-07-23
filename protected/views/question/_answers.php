<div class="answer">
	
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
	<?php echo Chtml::encode($ans->content)?>
	</div>
</div>	
<?php endforeach;?>
</div>


