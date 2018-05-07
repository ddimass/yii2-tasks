<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'sourceLanguage' => 'en-US',
    'language' => 'ru-RU',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
    'authManager' => [
            'class' => 'yii\rbac\DbManager',
        ],
    ],
];
