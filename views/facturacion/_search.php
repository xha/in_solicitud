<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\FacturacionSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="facturacion-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_facturacion') ?>

    <?= $form->field($model, 'observacion') ?>

    <?= $form->field($model, 'id_porcentaje') ?>

    <?= $form->field($model, 'id_costo') ?>

    <?php // echo $form->field($model, 'total') ?>

    <?php // echo $form->field($model, 'fecha_registro') ?>

    <?php // echo $form->field($model, 'activo')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
