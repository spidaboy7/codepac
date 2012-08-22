<?php

echo "4";
require_once('AutomatedTimeActiveRecord.php');
require_once('Answer.php');
$model=Answer::loadModel(4);
$model->up_vote=$model->up_vote++;
$model->save();
echo $model->up_vote;
function voteUp($id){

echo $id;

}
?>
