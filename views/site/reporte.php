<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\jui\DatePicker;
use app\models\Cliente;
use app\models\Usuario;

/* @var $this yii\web\View */
/* @var $model app\models\Rol */

$this->title = 'Hojas de Servicio';
$this->params['breadcrumbs'][] = $this->title;
$this->registerJsFile('@web/jquery-ui.js');
$this->registerCssFile('@web/css/jquery-ui.css');
?>
<div class="rol-view">

	<?php $form = ActiveForm::begin(); ?>

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $form->field($model, 'id_cliente')->dropDownList(ArrayHelper::map(Cliente::find()->where(['activo' => '1'])->OrderBy('razon_social')->all(), 'id_cliente', 'razon_social'), ['prompt' => 'Todos']); ?>

    <?= $form->field($model, 'id_usuario')->dropDownList(ArrayHelper::map(Usuario::find()->where('activo=1 and id_rol>1')->OrderBy('usuario')->all(), 'id_usuario', 'usuario'), ['prompt' => 'Todos']); ?>

    <?= $form->field($model,'fecha_inicial')->
        widget(DatePicker::className("form-control"),[
            'dateFormat' => 'yyyy-MM-dd',
            'clientOptions' => [
                'changeYear' => true
            ],
            'options' => ['class' => 'form-control texto-ec', 'readonly'=>true]
        ]) 
    ?>

	<?= $form->field($model,'fecha_final')->
        widget(DatePicker::className("form-control"),[
            'dateFormat' => 'yyyy-MM-dd',
            'clientOptions' => [
                'changeYear' => true
            ],
            'options' => ['class' => 'form-control texto-ec', 'readonly'=>true]
        ]) 
    ?>

    <?php ActiveForm::end(); ?>

    <div class="form-group">
        <button class='btn btn-success' onclick="carga_servicios()">Buscar</button>
    </div>

    <table id="listado" class="tablas tablas1"></table>
    
</div>

<script type='text/javascript'>
    function carga_servicios() {
        var cliente = trae('reporteform-id_cliente').value;
        var usuario = trae('reporteform-id_usuario').value;
        var fecha_inicial = trae('reporteform-fecha_inicial').value;
        var fecha_final = trae('reporteform-fecha_final').value;
        
        var parametros = "&cliente="+cliente;
            parametros+= "&usuario="+usuario;
            parametros+= "&fecha_inicial="+fecha_inicial;
            parametros+= "&fecha_final="+fecha_final;
        if ((fecha_inicial!="") && (fecha_final!="")) {
            $.get('../site/buscar-servicios',parametros,function(data){
                var data = $.parseJSON(data);
                title_tabla('listado');
                llenar_tabla('listado',data);
            });
        }
    }

    /********************************************************************************************************************************/
    function title_tabla(id_tabla) {
        var arreglo = new Array();
            arreglo[0] = 'ID';
            arreglo[1] = 'Fecha';
            arreglo[2] = 'Descripción';
            arreglo[3] = 'Usuario';
            arreglo[4] = 'Razón Social';
            arreglo[5] = 'Opt';

        var tabla = document.getElementById(id_tabla);
            tabla.innerHTML = "";
        tabla.appendChild(add_filas(arreglo, 'th','','',9));
    }

    function llenar_tabla(tabla, data) {  
        var tabla = document.getElementById(tabla);
        var i;
        var campos = new Array();
        for (var i = 0; i < data.length; i++) {
            campos.push(data[i].id_servicio);
            campos.push(data[i].fecha);
            campos.push(data[i].descripcion);
            campos.push(data[i].usuario);
            campos.push(data[i].razon_social);
            tabla.appendChild(add_filas(campos, 'td','#crear_pdf','3',8));
            campos.length=0;
        }
        return;
    }

    function crear_pdf(response) {
        var arreglo = response.split("#");
        window.open("imprimir-hoja?id_servicio="+arreglo[0],'_blank','');
    }
</script>
