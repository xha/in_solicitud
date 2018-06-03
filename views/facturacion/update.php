<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Facturacion */

$this->title = 'Actualizar Facturacion: ' . $model->id_facturacion;
$this->params['breadcrumbs'][] = ['label' => 'Facturacions', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_facturacion, 'url' => ['view', 'id' => $model->id_facturacion]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="facturacion-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'pendientes' => $pendientes,
    ]) ?>

</div>
