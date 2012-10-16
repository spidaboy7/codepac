<?php

/**
 * This is the model class for table "tbl_questions".
 *
 * The followings are the available columns in table 'tbl_questions':
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property integer $owner
 * @property integer $status
 * @property string $create_date
 * @property string $update_time
 *
 * The followings are the available model relations:
 * @property Answers[] $answers
 * @property Users $owner0
 */
class Question extends AutomatedTimeActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Question the static model class
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
		return 'question';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('title, content', 'required'),
			array('owner, status', 'numerical', 'integerOnly'=>true),
			array('title', 'length', 'max'=>255),
			array('create_date, update_time,vote', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, title, content, owner, status, create_date, update_time', 'safe', 'on'=>'search'),
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
			'answers' => array(self::HAS_MANY, 'Answer', 'question'),
			'owner' => array(self::BELONGS_TO, 'User', 'owner'),
			'answerCount'=>array(self::STAT,'Answer','question'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'title' => 'Title',
			'content' => 'Content',
			'owner' => 'Owner',
			'status' => 'Status',
			'create_date' => 'Create Date',
			'update_time' => 'Update Time',
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
		$criteria->compare('title',$this->title,true);
		$criteria->compare('content',$this->content,true);
		$criteria->compare('owner',$this->owner);
		$criteria->compare('status',$this->status);
		$criteria->compare('create_date',$this->create_date,true);
		$criteria->compare('views',$this->views,true);
		$criteria->compare('vote',$this->vote,true);
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	public function addAnswer($answer){
        $answer->question=$this->id;
        return $answer->save();
        }


}
