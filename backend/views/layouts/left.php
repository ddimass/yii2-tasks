
<?php
use yii\helpers\Html;
?>
<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p><?= Yii::$app->user->identity->name ?> <br> <?= Yii::$app->user->identity->name_l ?> </p>
                 <?= Yii::$app->user->identity->role ?>
            </div>
        </div>

        <!-- search form 
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
         /.search form -->

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu'],
                'items' => [
                    ['label' => 'Меню', 'options' => ['class' => 'header']],
                    ['label' => 'Организации', 'icon' => 'file-code-o', 'url' => ['/org']],
                    ['label' => 'Проекты', 'icon' => 'file-code-o', 'url' => ['/projects']],
                    ['label' => 'Задачи', 'icon' => 'dashboard', 'url' => ['/tasks']],
                    ['label' => 'Пользователи', 'icon' => 'share', 'url' =>'#',
                        'items' => [
                            ['label' => 'Добавить пользователя', 'icon' => 'file-code-o', 'url' => ['/site/signup'],],
                            ['label' => 'Доступ', 'icon' => 'dashboard', 'url' => ['/admin'],],

                        ],
                    ],
                    [
                        'label' => 'Отчёты',
                        'icon' => 'share',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Отчёт по работникам', 'icon' => 'file-code-o', 'url' => ['/gii'],],
                            ['label' => 'Отчёт по проектам', 'icon' => 'dashboard', 'url' => ['/debug'],],

                        ],
                    ],
                ],
            ]
        ) ?>
<?= Html::a(Yii::t('user','Sign out'), ['/site/logout'], ['data-method' => 'post', 'class' => 'btn']);
                                    ?>
    </section>
    
</aside>
