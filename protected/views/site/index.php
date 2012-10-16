<?php $this->pageTitle=Yii::app()->name; ?>



<ul class="thumbnails">
  
  <li class="span2"><a href="#" class="thumbnail"><img src="http://localhost/codepacu/images/site/codepac_4.jpg" alt=""><h3>Community</h3></a></li>
  <li class="span2"><a href="#" class="thumbnail"><img src="http://localhost/codepacu/images/site/codepac_3.jpg" alt=""><h3>Kodeve</h3></a></li>
  <li class="span2"><a href="#" class="thumbnail"><img src="http://localhost/codepacu/images/site/codepac_2.jpg" alt=""><h3>Parteners</h3></a></li>
</ul>


<?php $this->beginWidget('bootstrap.widgets.TbHeroUnit', array(
    'heading'=>'',
)); ?>
 
    <p>We believe learning through sharing is fun,do you?</p>
    <p><?php $this->widget('bootstrap.widgets.TbButton', array(
        'type'=>'primary',
        'size'=>'large',
        'label'=>'Join us',
    )); ?></p>
 
<?php $this->endWidget(); ?>

<?php 
$tabArray=Null;
$tutorialArray= array('label'=>'Tutorial', 'content'=>'<p>Tutorials section</p>');
$eventArray=array('label'=>'event', 'content'=>'<p>Events sections</p>');

$content=Null;
foreach($questions as $quest){
	$answerClass=($quest->answerCount>0)?'answered-accepted':'unanswered';
	$content=$content.'<div class="short-summary">
				<div class="votes">
			 		<div class="item-count"><div>'.$quest->vote.'</div>
								<div>Votes</div>
					</div>
				</div>
				<div class="answers '.$answerClass.'">
					<div class="item-count"><div>'.$quest->answerCount.'</div>
								<div>Answers</div>
					</div>
				</div>
				<div class="views">
					<div class="item-count"><div>'.$quest->views.'</div>
								<div>Views</div>
					</div>
				</div>	
			  
 
				<h2><a title='.$quest->title.' href="'.$this->createUrl("question/view",array("id"=>$quest->id)).'">'.$quest->title.'</a></h2>
				<div class="userinfo">
				<span class="relativetime">'.$quest->owner.'</span></div></div>';
	}
$questionArray=array('label'=>'Question','content'=>$content,'active'=>true);
$tabArray=array($questionArray,$tutorialArray,$eventArray);
?>

<?php $this->widget('bootstrap.widgets.TbTabs', array(
    'type'=>'tabs',
    'placement'=>'above', // 'above', 'right', 'below' or 'left'
    'tabs'=>$tabArray,
)); ?>



