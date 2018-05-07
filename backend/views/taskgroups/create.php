<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\TaskGroups */

$this->title = Yii::t('taskgroups', 'Create Task Groups');
$this->params['breadcrumbs'][] = ['label' => Yii::t('taskgroups', 'Task Groups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="task-groups-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
