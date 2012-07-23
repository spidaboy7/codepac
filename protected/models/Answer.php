<?php

/**
 * This is the model class for table "tbl_answers".
 *
 * The followings are the available columns in table 'tbl_answers':
 * @property integer $id
 * @property integer $question
 * @property string $content
 * @property integer $owner
 * @property integer $replied_id
 * @property string $create_date
 * @property string $update_time
 * @property integer $up_rate
 *
 * The followings are the available model relations:
 * @property Answer $replied
 * @property Answer[] $answers
 * @property Users $owner0
 * @property Questions $question0
 */
class Answer extends AutomatedTimeActiveRecord
{          public $up_rate;
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Answer the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'answer';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			
			array('question, content, owner', 'required'),
			array('question, owner, replied_id, up_rate', 'numerical', 'integerOnly'=>true),
			array('create_date, update_time,up_rate', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, question, content, owner, replied_id, create_date, update_time, up_rate', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'replied' => array(self::BELONGS_TO, 'Answer', 'replied_id'),
			'answers' => array(self::HAS_MANY, 'Answer', 'replied_id'),
			'owner' => array(self::BELONGS_TO, 'User', 'owner'),
			'question' => array(self::BELONGS_TO, 'Questions', 'question'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'question' => 'Question',
			'content' => 'Content',
			'owner' => 'Owner',
			'replied_id' => 'Replied',
			'create_date' => 'Create Date',
			'update_time' => 'Update Time',
			'up_rate' => 'Up Rate',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('question',$this->question);
		$criteria->compare('content',$this->content,true);
		$criteria->compare('owner',$this->owner);
		$criteria->compare('replied_id',$this->replied_id);
		$criteria->compare('create_date',$this->create_date,true);
		$criteria->compare('update_time',$this->update_time,true);
		$criteria->compare('up_rate',$this->up_rate);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
