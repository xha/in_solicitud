<?php

namespace app\models;

use Yii;

/**
 * LoginForm is the model behind the login form.
 *
 * @property User|null $user This property is read-only.
 *
 */
class ReporteForm extends \yii\db\ActiveRecord
{
    public $id_cliente;
    public $id_usuario;
    public $fecha_inicial;
    public $fecha_final;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [[''], 'string', 'max' => 250],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_cliente' => 'Por Cliente',
            'id_usuario' => 'Por Usuario',
            'fecha_inicial' => 'Fecha Inicial',
            'fecha_final' => 'Fecha Final',
        ];
    }
}
