<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Tasks */

$this->title = Yii::t('task', 'Create Tasks');
$this->params['breadcrumbs'][] = ['label' => Yii::t('task', 'Tasks'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tasks-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
