<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\Pjax;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model backend\models\Projects */

$this->title = $org->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('projects', 'Projects'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
    <p>
        <?= Html::a(Yii::t('projects', 'Create Projects'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<div class="projects-view">
 <?php 
    foreach ($projects as $project) { ?>
    <a href="<?= Url::to(['taskgroups/view', 'id'=> $project->id,'ido' => $org->id]);?>">
        <!-- Apply any bg-* class to to the info-box to color it -->
<div class="info-box bg-blue">
  <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>
  <div class="info-box-content">
    <span class="info-box-text"><?php echo $project->name ?></span>
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
