<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model backend\models\Tasks */

$this->title = $taskgroup->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('task', 'Tasks'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
    <p>
        <?= Html::a(Yii::t('task', 'Create Tasks'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<div class="tasks-view">
<?php 
    foreach ($tasks as $task) { ?>
    <a href="<?= Url::to(['tasks/view', 'id'=> $task->id,'ido' => $org->id, 'idp'=>$project->id, 'idtg'=>$taskgroup->id]);?>">
        <!-- Apply any bg-* class to to the info-box to color it -->
<div class="info-box bg-blue">
  <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>
  <div class="info-box-content">
    <span class="info-box-text"><?php echo $task->name ?></span>
    <span class="info-box-number">Проектов: 41</span>
    <!-- The progress section is optional -->
    <div class="progress">
      <div class="progress-bar" style="width: 20%"></div>
    </div>
    <span class="progress-description">
      20% задач завершено
    </span>
  </div>
  <!-- /.info-box-content -->
</div>
<!-- /.info-box -->
</a>        
<?php    }
    ?>
</div>
