<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\jui\DatePicker;
use app\models\TipoServicio;
use app\models\Cliente;
use app\models\Sucursal;

/* @var $this yii\web\View */
/* @var $model app\models\Solicitud */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="solicitud-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'titulo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'descripcion')->textarea(['rows' => 6]) ?>

    <label class="control-label">Sucursal</label>
    <?= Html::activeDropDownList($model, 'id_sucursal',
      ArrayHelper::map(Sucursal::find()->where(['activo' => '1'])->OrderBy('descripcion')->all(), 'id_sucursal', 'descripcion'), ['class'=>'form-control']) ?>

    <label class="control-label">Cliente</label>
    <?= Html::activeDropDownList($model, 'id_cliente',
      ArrayHelper::map(Cliente::find()->where(['activo' => '1'])->OrderBy('razon_social')->all(), 'id_cliente', 'razon_social'), ['class'=>'form-control']) ?>

    <label class="control-label">Tipo de Servicio</label>
    <?= Html::activeDropDownList($model, 'id_tipo_servicio',
      ArrayHelper::map(TipoServicio::find()->where(['activo' => '1'])->OrderBy('descripcion')->all(), 'id_tipo_servicio', 'descripcion'), ['class'=>'form-control']) ?>
    <br />
    <div class="form-group" align="center">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
