<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\InCliente */

$this->title = 'Create In Cliente';
$this->params['breadcrumbs'][] = ['label' => 'In Clientes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="in-cliente-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
