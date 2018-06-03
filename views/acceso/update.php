<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Acceso */

$this->title = 'Update Acceso: ' . $model->id_acceso;
$this->params['breadcrumbs'][] = ['label' => 'Accesos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_acceso, 'url' => ['view', 'id' => $model->id_acceso]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="acceso-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
