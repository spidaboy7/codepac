<div class="comment">

<?php $img_down="<img src='../../../../images/site/vote-down.png'>";?>
<?php $img_up="<img src='../../../../images/site/vote-up.png'>";?>      
<?php foreach($comments as $cmt): ?>
<div class="ans-row">
        <div class="ans-user">
        <?php $user=YumUser::model()->findByPk($cmt->owner);
                echo    $user->getAvatar();
                echo "<br>";
                echo    $user->username;
        ?>
        </div> 
        <div class="cmt-content" >
        
        <?php echo html_entity_decode($cmt->content)?>
        <br/>   
        <span id="cmt-upvote-<?php echo "$cmt->id";?>" style="color:green;"><?php echo "";?></span><span> 
        <?php echo CHtml::ajaxLink ($img_up,Yii::app()->createUrl('answer/upvote/id/'.$cmt->id),
        array('type' =>'POST',
                'data'=> CJSON::encode($cmt->id),
  'update'=>'#ans-upvote-'.$cmt->id));?>
        </span>

        <span id="ans-downvote-<?php echo"$cmt->id"; ?>" style="color:red;"><?php echo "";?></span><span>
        <?php echo CHtml::ajaxLink ($img_down,Yii::app()->createUrl('answer/downvote/id/'.$cmt->id),
        array('type' =>'POST',
                'data'=> CJSON::encode($cmt->id),
                'update'=>'#ans-downvote-'.$cmt->id));?>
        </span>
        </div>
</div>
<?php endforeach;?>
</div>


