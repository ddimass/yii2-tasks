<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\TaskGroups */

$this->title = Yii::t('taskgroups', 'Update {modelClass}: ', [
    'modelClass' => 'Task Groups',
]) . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('taskgroups', 'Task Groups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('taskgroups', 'Update');
?>
<div class="task-groups-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
