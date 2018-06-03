<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Usuario;
use app\models\Cliente;
use app\models\Porcentaje;
use app\models\Rol;

/* @var $this yii\web\View */
/* @var $model app\models\Rol */

$this->title = 'Activar usuario';
$this->params['breadcrumbs'][] = $this->title;
?>

<h3><?= $msg ?></h3>

<div class="activar-form">

	<?php $form = ActiveForm::begin(); ?>

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $form->field($model, 'id_usuario')->dropDownList(ArrayHelper::map(Usuario::find()->OrderBy('usuario')->all(), 'id_usuario', 'usuario'), ['prompt'=>'Seleccione','class'=>'form-control','onchange' => 'carga_observacion();']); ?>

    <?= $form->field($model, 'id_cliente')->dropDownList(ArrayHelper::map(Cliente::find()->where(['activo' => '1'])->OrderBy('razon_social')->all(), 'id_cliente', 'razon_social')); ?>
    
    <?= $form->field($model, 'id_rol')->dropDownList(ArrayHelper::map(Rol::find()->where(['activo' => '1'])->OrderBy('descripcion')->all(), 'id_rol', 'descripcion')); ?> 

    <?= $form->field($model, 'id_porcentaje')->dropDownList(ArrayHelper::map(Porcentaje::find()->where(['activo' => '1'])->OrderBy('porcentaje')->all(), 'id_porcentaje', 'porcentaje')); ?>

    <?= $form->field($model, 'observacion')->textInput() ?>
    
    <?= $form->field($model, 'reseteo')->checkbox(); ?>

    <?= $form->field($model, "activado")->checkbox(); ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Actualizar' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>    

    <?php ActiveForm::end(); ?>
</div>

<script type='text/javascript'>
    function carga_observacion() {
        var cliente = document.getElementById('activarform-observacion').value;
        var usuario = document.getElementById('activarform-id_usuario').value;
        
        if (usuario.value!="") {
            var parametros = "&usuario="+usuario;
            $.get('../site/observacion',parametros,function(data){
                var data = $.parseJSON(data);
                document.getElementById('activarform-observacion').value = data['observacion'];
            });
        }
    }
</script>