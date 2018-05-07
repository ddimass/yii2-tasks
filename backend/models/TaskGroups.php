<?php

namespace backend\models;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;

use Yii;

/**
 * This is the model class for table "task_groups".
 *
 * @property integer $id
 * @property string $name
 * @property integer $status
 * @property string $desc
 * @property string $endtime
 * @property integer $project_id
 * @property integer $created_by
 * @property string $created_at
 * @property string $updated_at
 * @property integer $updated_by
 * @property integer $disabled
 *
 * @property Projects $project
 * @property TaskgrUser[] $taskgrUsers
 * @property User[] $users
 * @property Tasks[] $tasks
 */
class TaskGroups extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'task_groups';
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
            [['name', 'status', 'project_id', 'created_by', 'disabled'], 'required'],
            [['status', 'project_id', 'created_by', 'updated_by', 'disabled'], 'integer'],
            [['endtime', 'created_at', 'updated_at'], 'safe'],
            [['name', 'desc'], 'string', 'max' => 255],
            [['project_id'], 'exist', 'skipOnError' => true, 'targetClass' => Projects::className(), 'targetAttribute' => ['project_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('taskgroups', 'ID'),
            'name' => Yii::t('taskgroups', 'Name'),
            'status' => Yii::t('taskgroups', 'Status'),
            'desc' => Yii::t('taskgroups', 'Desc'),
            'endtime' => Yii::t('taskgroups', 'Endtime'),
            'project_id' => Yii::t('taskgroups', 'Project ID'),
            'created_by' => Yii::t('taskgroups', 'Created By'),
            'created_at' => Yii::t('taskgroups', 'Created At'),
            'updated_at' => Yii::t('taskgroups', 'Updated At'),
            'updated_by' => Yii::t('taskgroups', 'Updated By'),
            'disabled' => Yii::t('taskgroups', 'Disabled'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProject()
    {
        return $this->hasOne(Projects::className(), ['id' => 'project_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTaskgrUsers()
    {
        return $this->hasMany(TaskgrUser::className(), ['task_group_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['id' => 'user_id'])->viaTable('taskgr_user', ['task_group_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTasks()
    {
        return $this->hasMany(Tasks::className(), ['task_group_id' => 'id']);
    }
}
