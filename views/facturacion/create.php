<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Facturacion */

$this->title = 'Crear Facturacion';
$this->params['breadcrumbs'][] = ['label' => 'Facturación', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="facturacion-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'pendientes' => $pendientes,
    ]) ?>

</div>
