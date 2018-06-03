<?php

use yii\helpers\Html;
use yii\grid\GridView;
/* @var $this yii\web\View */
/* @var $searchModel app\models\SolicitudSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = 'Solicitudes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="solicitud-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Crear Solicitud', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        /*'rowOptions' => function ($model, $index, $widget, $grid){
            if($model->activo == 0) return ['style' => 'background-color: #FADCAC'];
        },*/
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],
            'id_solicitud',
            //'descripcion:ntext',
            //'fecha',
            [
               'attribute' => 'fecha',
                'format' =>  ['date', 'php:d-m-Y'],
            ],
            'titulo',
            [
              'attribute'=>'id_cliente',
              'value'=>'idCliente.razon_social',
            ],
            [
              'attribute'=>'id_tipo_servicio',
              'value'=>'idTipoServicio.descripcion',
            ],
            //'id_tipo_servicio',
            //'id_sucursal',
            //'id_cliente',
            //'activo',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
