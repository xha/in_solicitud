<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Facturacion */

$this->title = $model->id_facturacion;
$this->params['breadcrumbs'][] = ['label' => 'Facturación', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="facturacion-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id_facturacion], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id_facturacion], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_facturacion',
            'observacion:ntext',
            'porcentaje',
            'costo_hora',
            'total',
            'total_horas',
            'fecha_registro',
            'activo:boolean',
        ],
    ]) ?>

</div>
