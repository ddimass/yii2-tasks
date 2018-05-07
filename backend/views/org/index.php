<?php

use yii\helpers\Html;
use yii\widgets\ListView;
use yii\widgets\Pjax;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\OrgSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = Yii::t('org', 'Orgs');
//echo Yii::$app->user->identity->name;
//print_r($dataProvider);
?>

<div class="org-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); 
    ?>

    <p>
        <?= Html::a(Yii::t('org', 'Create Org'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

</div>
<div class="content">
    <?php 
    foreach ($orgs as $org1) { ?>
    <a href="<?= Url::to(['projects/view', 'id' => $org1->id]);?>">
        <!-- Apply any bg-* class to to the info-box to color it -->
<div class="info-box bg-blue">
  <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>
  <div class="info-box-content">
    <span class="info-box-text"><?php echo $org1->name ?></span>
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
<div class="col-md-4">
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-black" style="background: url('../dist/img/photo1.png') center center;">
              <h3 class="widget-user-username">Elizabeth Pierce</h3>
              <h5 class="widget-user-desc">Web Designer</h5>
            </div>
            <div class="widget-user-image">
              <img class="img-circle" src="../dist/img/user3-128x128.jpg" alt="User Avatar">
            </div>
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-4 border-right">
                  <div class="description-block">
                    <h5 class="description-header">3,200</h5>
                    <span class="description-text">SALES</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-4 border-right">
                  <div class="description-block">
                    <h5 class="description-header">13,000</h5>
                    <span class="description-text">FOLLOWERS</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-4">
                  <div class="description-block">
                    <h5 class="description-header">35</h5>
                    <span class="description-text">PRODUCTS</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.widget-user -->
        </div>