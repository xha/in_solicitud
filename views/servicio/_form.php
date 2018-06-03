<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\jui\DatePicker;
use yii\helpers\ArrayHelper;
use app\models\Solicitud;
use app\models\Cliente;
/* @var $this yii\web\View */
/* @var $model app\models\Servicio */
/* @var $form yii\widgets\ActiveForm 
->hiddenInput()->label(false)*/
    $up = "";
    if ($this->params['breadcrumbs'][1]!='Crear Servicio') $up = "disabled='true'";
    $id_usuario = Yii::$app->user->identity->id_usuario;
?>

<div class="servicio-form">
    <div class='alerta_msj' id='msj_error'></div>
    <?php $form = ActiveForm::begin(); ?>
    <?= $form->field($model, "hora_entrada")->hiddenInput()->label(false); ?>
    <?= $form->field($model, "hora_salida")->hiddenInput()->label(false); ?>
    <?= $form->field($model, "id_solicitud")->hiddenInput()->label(false); ?>
    <?= $form->field($model, "id_usuario")->hiddenInput(['value'=> $id_usuario])->label(false); ?>

    <?= $form->field($model, 'descripcion')->textarea(['rows' => 6]) ?>

    <?= $form->field($model,'fecha')->
        widget(DatePicker::className("form-control"),[
            'dateFormat' => 'yyyy-MM-dd',
            'clientOptions' => [
                'changeYear' => true
            ],
            'options' => ['class' => 'form-control texto-ec', 'readonly'=>true]
        ]) 
    ?>
    <div style="width: 100%; margin-bottom: 80px">
        <div style="width: 70%; float: left">
            <label class="control-label">Hora de Entrada</label>    
            <?php
                $hora = "";
                for($i=7;$i<23;$i++) {
                    if($i<10) {
                        $valor = "0".$i;
                    } else {
                        $valor = $i;
                    }
                    /*if ($valor>12) {
                        $hora1 = $valor - 12;
                    } else {
                        $hora1 = $valor;
                    }*/
                    $hora.= "<option value='$valor'>$valor</option>";
                }
                
                $minuto = "";
                for($i=0;$i<60;$i++) {
                    if($i<10) {
                        $valor = "0".$i;
                    } else {
                        $valor = $i;
                    }
                    $minuto.= "<option value='$valor'>$valor</option>";
                }
            ?>
            <select class='texto texto-xc' id='hora_e' onchange="asignar_campos()"><?= $hora; ?></select>
            <select class='texto texto-xc' id='minuto_e' onchange="asignar_campos()"><?= $minuto; ?></select> 
            <b>am/pm</b>
            <br />
            <b>Hora de Salida &nbsp;&nbsp;</b>
            <select class='texto texto-xc' id='hora_s' onchange="asignar_campos()"><?= $hora; ?></select>
            <select class='texto texto-xc' id='minuto_s' onchange="asignar_campos()"><?= $minuto; ?></select>
            <b>am/pm</b>
            <br />
        </div>
        <br /><br /><br />
        <?= $form->field($model, 'total_horas')->textInput(['readonly' => true, 'class'=>'form-control texto-ec', 'value'=>0]) ?>
        <div style="float: right; width: 30%">
            <?= $form->field($model, "activo")->checkbox(); ?>
        </div>
    </div>
    <label style="width: 100%" class="control-label">Solicitud Previa</label>
    <select class='form-control' id='solicitud' <?= $up ?> onchange="asignar_campos()" >
    <?php 
        $solicitudes = Solicitud::find()->where(['activo' => '1'])->OrderBy('id_solicitud desc')->all();
        $opt="<option value=''>Seleccione...</option>";
        for($i=0;$i<count($solicitudes);$i++) {
            $valor = $solicitudes[$i]['id_cliente'];
            $clie = Cliente::find()->where(['id_cliente' => "$valor"])->one();
            $opt.= "<option value='".$solicitudes[$i]['id_solicitud']."'>".$clie['razon_social']." - ".$solicitudes[$i]['titulo']."</option>";
        };
        echo $opt;
    ?>
    </select>
    <br />
    <div class="form-group" align="center">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<style>
    .alerta_msj {
        border-radius: 5px;
        padding-left: 5px;
        width: 95%;
        color:#a94442;
        background-color:#f2dede;
        border-color:#ebccd1
    }
</style>
<script type="text/javascript">
    function asignar_campos() {
        var hora_e = document.getElementById('hora_e').value;
        var msj_error = document.getElementById('msj_error');
        var hora_s = document.getElementById('hora_s').value;
        var minuto_e = document.getElementById('minuto_e').value;
        var minuto_s = document.getElementById('minuto_s').value;
        var solicitud = document.getElementById('solicitud');
        var hora_entrada = document.getElementById('servicio-hora_entrada');
        var hora_salida = document.getElementById('servicio-hora_salida');
        var id_solicitud = document.getElementById('servicio-id_solicitud');
        var total_horas = document.getElementById('servicio-total_horas');
        var total_h = 0;

        msj_error.innerHTML = "";
        if (hora_e!="") {
            if (hora_e>hora_s) {
                msj_error.innerHTML = "Error. Hora de Salida Mayor a la hora de Entrada";
            } else {
                hora_entrada.value = hora_e.toString()+minuto_e;
            }
        } else {
            hora_entrada.value = "";
        }

        if (hora_s!="") {
            if (hora_s<hora_e) {
                msj_error.innerHTML = "Error. Hora de Salida Mayor a la hora de Entrada";
            } else {
                hora_salida.value = hora_s.toString()+minuto_s;
            }
        } else {
            hora_salida.value = "";
        }

        if (hora_salida.value > hora_entrada.value) {
            total_h = Math.ceil((((parseInt(hora_salida.value) - parseInt(hora_entrada.value)) * 60) / 100)/60);
        }

        total_horas.value = total_h;
        
        if (solicitud.value!="") {
            id_solicitud.value = solicitud.value;
        } else {
            if (!solicitud.disabled) id_solicitud.value = '';
        }
    }    
</script>