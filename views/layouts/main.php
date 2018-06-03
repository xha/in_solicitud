<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
//print_r(Yii::$app->user->identity->id_usuario);die;
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap" >
    <?php
    NavBar::begin([
        'brandLabel' => 'Inicio',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => 'Registrarse', 'url' => ['/site/register']];
        $menuItems[] = ['label' => 'Login', 'url' => ['/site/login']];
    } else {
        $menuItems[] = ['label' => 'Tablas Básicas',  
                'url' => ['#'],
                'template' => '<a href="{url}" >{label}<i class="fa fa-angle-left pull-right"></i></a>',
                'items' => [
                    ['label' => 'Usuarios', 'url' => ['/usuario']],
                    ['label' => 'Clientes', 'url' => ['/cliente']],
                    ['label' => 'Tipo de Servicio', 'url' => ['/tipo-servicio']],
                    ['label' => 'Sucursales', 'url' => ['/sucursal']],
                    ['label' => 'Departamentos', 'url' => ['/departamento']],
                    ['label' => 'Roles', 'url' => ['/rol']],
                    ['label' => 'Acciones', 'url' => ['/accion']],
                    ['label' => 'Rol - Acciones', 'url' => ['/rol-accion']],
                    ['label' => 'Activar Usuarios', 'url' => ['/site/activar']],
                    ['label' => 'Cambiar Clave', 'url' => ['/site/cambiar']],
                ]];
        $menuItems[] = ['label' => 'Solicitudes', 'url' => ['/solicitud']];
        $menuItems[] = ['label' => 'Servicios', 'url' => ['/servicio']];
        $menuItems[] = ['label' => 'Facturar', 'url' => ['/facturacion']];
        $menuItems[] = ['label' => 'Reportes',  
                'url' => ['#'],
                'template' => '<a href="{url}" >{label}<i class="fa fa-angle-left pull-right"></i></a>',
                'items' => [
                    ['label' => 'Hojas de Servicio', 'url' => ['/site/reporte']],
                    ['label' => 'Resumen', 'url' => ['/facturacion/reporte']],
                ]];
        $menuItems[] = '<li>'
            . Html::beginForm(['/site/logout'], 'post')
            . Html::submitButton(
                'Logout (' . Yii::$app->user->identity->usuario . ')',
                ['class' => 'btn btn-link logout']
            )
            . Html::endForm()
            . '</li>';
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>
    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; Innova Soluciones y Sistemas C.A. </p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
