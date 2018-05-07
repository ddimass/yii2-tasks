<?php

namespace backend\models;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;

use Yii;

/**
 * This is the model class for table "projects".
 *
 * @property integer $id
 * @property integer $org_id
 * @property string $name
 * @property integer $status
 * @property string $desc
 * @property string $endtime
 * @property string $created_at
 * @property integer $created_by
 * @property string $updated_at
 * @property integer $updated_by
 * @property integer $disabled
 *
 * @property ProjUser[] $projUsers
 * @property User[] $users
 * @property Org $org
 * @property TaskGroups[] $taskGroups
 */
class Projects extends \yii\db\ActiveRecord
{
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
    public static function tableName()
    {
        return 'projects';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['org_id', 'name', 'status', 'desc', 'disabled'], 'required'],
            [['status', 'created_by', 'updated_by', 'disabled'], 'integer'],
            [['endtime', 'created_at', 'updated_at'], 'safe'],
            [['name', 'desc'], 'string', 'max' => 255],
            [['org_id'], 'exist', 'skipOnError' => true, 'targetClass' => Org::className(), 'targetAttribute' => ['org_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('projects', 'ID'),
            'org_id' => Yii::t('projects', 'Org ID'),
            'name' => Yii::t('projects', 'Name'),
            'status' => Yii::t('projects', 'Status'),
            'desc' => Yii::t('projects', 'Desc'),
            'endtime' => Yii::t('projects', 'Endtime'),
            'created_at' => Yii::t('projects', 'Created At'),
            'created_by' => Yii::t('projects', 'Created By'),
            'updated_at' => Yii::t('projects', 'Updated At'),
            'updated_by' => Yii::t('projects', 'Updated By'),
            'disabled' => Yii::t('projects', 'Disabled'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjUsers()
    {
        return $this->hasMany(ProjUser::className(), ['project_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['id' => 'user_id'])->viaTable('proj_user', ['project_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrg()
    {
        return $this->hasOne(Org::className(), ['id' => 'org_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTaskGroups()
    {
        return $this->hasMany(TaskGroups::className(), ['project_id' => 'id']);
    }
}
