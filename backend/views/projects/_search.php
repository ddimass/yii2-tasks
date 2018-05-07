<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ProjectsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="projects-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'org_id') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'status') ?>

    <?= $form->field($model, 'desc') ?>

    <?php // echo $form->field($model, 'endtime') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <?php // echo $form->field($model, 'disabled') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('projects', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('projects', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
