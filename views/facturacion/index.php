<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\FacturacionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Facturación';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="facturacion-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Crear Facturacion', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_facturacion',
            'observacion:ntext',
            'porcentaje',
            'costo_hora',
            // 'total',
            // 'fecha_registro',
            // 'activo:boolean',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
