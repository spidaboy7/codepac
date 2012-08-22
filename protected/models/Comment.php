<?php

/**
 * This is the model class for table "comment".
 *
 * The followings are the available columns in table 'comment':
 * @property integer $id
 * @property string $content
 * @property string $owner
 * @property integer $replied_id
 * @property string $create_date
 * @property string $update_time
 * @property string $tutorial
 *
 * The followings are the available model relations:
 * @property Tutorial $tutorial0
 * @property User $owner0
 */
class Comment extends AutomatedTimeActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Comment the static model class
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
		return 'comment';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('content, owner, tutorial', 'required'),
			array('replied_id', 'numerical', 'integerOnly'=>true),
			array('owner, tutorial', 'length', 'max'=>10),
			array('create_date, update_time', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, content, owner, replied_id, create_date, update_time, tutorial', 'safe', 'on'=>'search'),
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
			'tutorial' => array(self::BELONGS_TO, 'Tutorial', 'tutorial'),
			'owner' => array(self::BELONGS_TO, 'User', 'owner'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'content' => 'Content',
			'owner' => 'Owner',
			'replied_id' => 'Replied',
			'create_date' => 'Create Date',
			'update_time' => 'Update Time',
			'tutorial' => 'Tutorial',
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
		$criteria->compare('content',$this->content,true);
		$criteria->compare('owner',$this->owner,true);
		$criteria->compare('replied_id',$this->replied_id);
		$criteria->compare('create_date',$this->create_date,true);
		$criteria->compare('update_time',$this->update_time,true);
		$criteria->compare('tutorial',$this->tutorial,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
