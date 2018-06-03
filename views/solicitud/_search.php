<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\SolicitudSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="solicitud-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_solicitud') ?>

    <?= $form->field($model, 'solicitud') ?>

    <?= $form->field($model, 'fecha') ?>


    <?php // echo $form->field($model, 'hora_salida') ?>

    <?php echo $form->field($model, 'id_tipo_servicio') ?>

    <?php //echo $form->field($model, 'id_sucursal') ?>

    <?php echo $form->field($model, 'id_cliente') ?>

    <?php // echo $form->field($model, 'activo') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
