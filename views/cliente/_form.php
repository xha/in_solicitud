<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Porcentaje;
use app\models\Costo;

/* @var $this yii\web\View */
/* @var $model app\models\Cliente */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cliente-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'letra_rif')->dropDownList(['J' => 'J', 'G' => 'G', 'V' => 'V']) ?>

    <?= $form->field($model, 'rif')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'razon_social')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'representante')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'direccion')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'telefono')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'correo')->textInput(['maxlength' => true]) ?>

    <label class="control-label">Porcentaje</label>
    <?= Html::activeDropDownList($model, 'id_porcentaje',
      ArrayHelper::map(Porcentaje::find()->where(['activo' => '1'])->OrderBy('porcentaje')->all(), 'id_porcentaje', 'porcentaje'), ['class'=>'form-control']) ?>

    <label class="control-label">Costo por Horas</label>
    <?= Html::activeDropDownList($model, 'id_costo',
      ArrayHelper::map(Costo::find()->where(['activo' => '1'])->OrderBy('costo')->all(), 'id_costo', 'costo'), ['class'=>'form-control']) ?>

    <?= $form->field($model, 'activo')->dropDownList(['1' => 'SI', '0' => 'NO']); ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
