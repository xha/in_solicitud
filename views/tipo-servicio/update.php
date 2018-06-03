<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\TipoServicio */

$this->title = 'Update Tipo Servicio: ' . $model->id_tipo_servicio;
$this->params['breadcrumbs'][] = ['label' => 'Tipo Servicios', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_tipo_servicio, 'url' => ['view', 'id' => $model->id_tipo_servicio]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="tipo-servicio-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
