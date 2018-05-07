<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Org */

$this->title = Yii::t('org', 'Update {modelClass}: ', [
    'modelClass' => 'Org',
]) . $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('org', 'Orgs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('org', 'Update');
?>
<div class="org-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
