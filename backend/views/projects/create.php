<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Projects */

$this->title = Yii::t('projects', 'Create Projects');
$this->params['breadcrumbs'][] = ['label' => Yii::t('projects', 'Projects'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="projects-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
