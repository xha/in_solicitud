<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;

/* @var $this yii\web\View */
/* @var $model app\models\Facturacion */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="facturacion-form">

    <?php $form = ActiveForm::begin(); ?>
    <input type="hidden" id='i_servicios' name='i_servicios' />
    <label class="control-label">Seleccione Cliente</label>
    <?php 
        echo "<select class='form-control' id='id_cliente' onchange='carga_servicios(this.value)' />
                <option value=''>Seleccione...</option>";
        for ($i=0;$i<count($pendientes);$i++) {
            echo "<option value='".$pendientes[$i]['id_cliente']."'>".$pendientes[$i]['razon_social']."</option>";
        }
        echo "</select />";
        //Html::dropDownList('cliente', [2],array('M' => 'Male', 'F' => 'Female')); 
        //$opciones = \yii\helpers\ArrayHelper::map(Servicio::find()->Where('activo=1')->all(), 'id_servicio', 'fecha');
        //echo $form->field($model, 'id_servicio')->checkboxList($opciones, ['unselect'=>NULL]);
    ?>
    <br />
    <label class="control-label">Servicios</label>
    <div id='div_servicios'></div>
    <br /><br />
    <?= $form->field($model, 'observacion')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'porcentaje')->textInput(['maxlength' => true, 'onchange'=>'js:chequear_montos();']) ?>

    <?= $form->field($model, 'costo_hora')->textInput(['maxlength' => true, 'onchange'=>'js:chequear_montos();']) ?>

    <?= $form->field($model, 'total')->textInput(['maxlength' => true, 'value'=> 0]) ?>

    <?= $form->field($model, 'total_horas')->textInput(['maxlength' => true, 'value'=> 0, 'readonly' => true]) ?>

    <?= $form->field($model, 'pagado')->dropDownList(['0' => 'NO', '1' => 'SI']); ?>

    <table id="listado" class="tablas tablas1"></table>

    <?php ActiveForm::end(); ?>

    <div class="form-group">
        <?= Html::submitButton("Enviar",array('class'=>'btn btn-success','onclick'=>'js:enviar_data();')); ?>
    </div>

</div>
<script type='text/javascript'>
    function enviar_data() {
        var i_servicios = document.getElementById('i_servicios');
        i_servicios.value = "";

        $(":checkbox:checked").each(function (index) {
            i_servicios.value+= $(this).val()+"¬";
        });    

        if (i_servicios.value!="") document.forms['w0'].submit();
    }

    function carga_servicios(valor) {
        var div_servicios = $("#div_servicios")[0];
        div_servicios.innerHTML = "";
        if (valor!="") {
            $.get('../servicio/buscar-servicios',{cliente : valor},function(data){
                var data = $.parseJSON(data);
                for (var i = 0; i < data.length; i++) {
                    var div = document.createElement('div');
                    var input1 = document.createElement('input');
                    var b = document.createElement('b');
                    
                    div.id="d_acceso_"+i;
                    div.align="left";
                    div.style= "width: 49%; float: left; padding: 5px";
                    input1.type = "checkbox";
                    input1.id = "acceso_"+i;
                    input1.value = data[i].id_servicio+"#"+data[i].total_horas;
                    input1.style.marginRight = "4px";
                    eval("input1.onclick = function(){chequear_montos();}");
                    b.innerHTML = data[i].fecha+" - "+data[i].descripcion+"...";
                    
                    div.appendChild(input1);
                    div.appendChild(b);
                    div_servicios.appendChild(div);
                }
            });

            $.get('../servicio/buscar-costo-porcentaje',{cliente : valor},function(data){
                var data = $.parseJSON(data);
                var costo_hora = document.getElementById('facturacion-costo_hora');
                var porcentaje = document.getElementById('facturacion-porcentaje');

                costo_hora.value = data[0].costo;
                porcentaje.value = data[0].porcentaje;
            });
        }
    }

    function chequear_montos() {
        var costo_hora = document.getElementById('facturacion-costo_hora');
        var porcentaje = document.getElementById('facturacion-porcentaje');
        var total_horas = document.getElementById('facturacion-total_horas');
        var total = document.getElementById('facturacion-total');
        var total_minutos = 0;
        var total_c = 0;
        var h_entrada = 0;
        var h_salida = 0;

        if ((porcentaje.value > 0) && (costo_hora.value > 0)) {
            $(":checkbox:checked").each(function (index) {
                arreglo = $(this).val().split("#");

                total_c+= parseInt(arreglo[1]);
            });    

            total_horas.value = total_c;

            total.value = total_c * (parseFloat(costo_hora.value) * (parseFloat(porcentaje.value) / 100));
        }
    }
</script>