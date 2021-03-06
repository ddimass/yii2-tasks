<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Org */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('org', 'Orgs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="org-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('org', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('org', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('org', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'name',
            'desc',
            'image',
//             [
  //          'attribute'=>'created_by',
    //        'value'=>$model->userc->name,
      //      ],
            'created_at:datetime',
            'updated_at:datetime',
            'updated_by',
            'disabled:boolean',
        ],
    ]) ?>

</div>
