<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Acceso */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="acceso-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'padre')->textInput() ?>

    <?= $form->field($model, 'pagina')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alias')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'etiqueta')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nivel')->textInput() ?>

    <?= $form->field($model, 'activo')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
