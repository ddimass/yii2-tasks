<?php

namespace backend\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
/**
 * This is the model class for table "org".
 *
 * @property integer $id
 * @property string $name
 * @property string $desc
 * @property integer $created_by
 * @property string $created_at
 * @property string $updated_at
 * @property integer $updated_by
 * @property integer $disabled
 *
 * @property OrgUser[] $orgUsers
 * @property User[] $users
 * @property Projects[] $projects
 */
class Org extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
            BlameableBehavior::className(), 
            ];
    }
    public static function tableName()
    {
        return 'org';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'disabled'], 'required'],
            [['name'], 'string', 'max' => 50],
            [['desc'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function upload()
    {
        if ($this->validate()) {
             $this->image->saveAs('../'.$this->image->baseName . '.' . $this->image->extension);
            return true;
        } else {
            return false;
        }
    }
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('org', 'ID'),
            'name' => Yii::t('org', 'Name'),
            'desc' => Yii::t('org', 'Desc'),
            'image' => Yii::t('org', 'Image'),
            'created_by' => Yii::t('org', 'Created By'),
            'created_at' => Yii::t('org', 'Created At'),
            'updated_at' => Yii::t('org', 'Updated At'),
            'updated_by' => Yii::t('org', 'Updated By'),
            'disabled' => Yii::t('org', 'Disabled'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrgUsers()
    {
        return $this->hasMany(OrgUser::className(), ['org_id' => 'id']);
    }
    public function getUserc()
    {
        return $this->hasOne(User::className(), ['id' => 'created_by']);
    }
    public function getUseru()
    {
        return $this->hasOne(User::className(), ['id' => 'updated_by']);
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['id' => 'user_id'])->viaTable('org_user', ['org_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjects()
    {
        return $this->hasMany(Projects::className(), ['org_id' => 'id']);
    }
}
