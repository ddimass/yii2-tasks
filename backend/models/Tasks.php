<?php

namespace backend\models;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;

use Yii;

/**
 * This is the model class for table "tasks".
 *
 * @property integer $id
 * @property string $name
 * @property integer $status
 * @property string $desc
 * @property string $endtime
 * @property integer $task_group_id
 * @property integer $created_by
 * @property string $created_at
 * @property integer $updated_by
 * @property string $updated_at
 * @property integer $disabled
 *
 * @property TaskGroups $taskGroup
 */
class Tasks extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tasks';
    }
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
            BlameableBehavior::className(), 
            ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'status', 'desc', 'task_group_id', 'created_by', 'disabled'], 'required'],
            [['status', 'task_group_id', 'created_by', 'updated_by', 'disabled'], 'integer'],
            [['endtime', 'created_at', 'updated_at'], 'safe'],
            [['name', 'desc'], 'string', 'max' => 255],
            [['task_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => TaskGroups::className(), 'targetAttribute' => ['task_group_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('tasks', 'ID'),
            'name' => Yii::t('tasks', 'Name'),
            'status' => Yii::t('tasks', 'Status'),
            'desc' => Yii::t('tasks', 'Desc'),
            'endtime' => Yii::t('tasks', 'Endtime'),
            'task_group_id' => Yii::t('tasks', 'Task Group ID'),
            'created_by' => Yii::t('tasks', 'Created By'),
            'created_at' => Yii::t('tasks', 'Created At'),
            'updated_by' => Yii::t('tasks', 'Updated By'),
            'updated_at' => Yii::t('tasks', 'Updated At'),
            'disabled' => Yii::t('tasks', 'Disabled'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTaskGroup()
    {
        return $this->hasOne(TaskGroups::className(), ['id' => 'task_group_id']);
    }
}
