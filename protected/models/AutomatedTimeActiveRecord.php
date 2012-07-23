<?php

abstract class AutomatedTimeActiveRecord extends CActiveRecord{


	/*
	*Prepares the owner and create time for common fields of questions and answers
	*owner,create_date;
	*
	*/
	public function beforeValidate(){

	if($this->isNewRecord){
		//sets the owner and create date for of the item(question/reply)
	   $this->create_date=new CDbExpression('NOW()');
	   $this->owner=Yii::app()->user->getId();			
	}

	return parent::beforeValidate();
	}


}
