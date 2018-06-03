<?php

namespace app\models;
use Yii;
use yii\base\Model;
use app\models\Usuario;

class ActivarForm extends model{
    
    public $id_usuario;
    public $id_rol;
    public $id_cliente;
    public $id_porcentaje;
    public $reseteo;
    public $observacion;
    public $activado = true;
    public $isNewRecord = true;

    public function rules()
    {
        return [
            [['id_usuario', 'id_rol', 'id_cliente','id_porcentaje','activado'], 'required', 'message' => 'Campo requerido'],
            [['id_rol'], 'exist', 'skipOnError' => true, 'targetClass' => Rol::className(), 'targetAttribute' => ['id_rol' => 'id_rol']],
            [['id_cliente'], 'exist', 'skipOnError' => true, 'targetClass' => Cliente::className(), 'targetAttribute' => ['id_cliente' => 'id_cliente']],
            [['reseteo'], 'boolean'],
        ];
    }
    
    public function attributeLabels()
    {
        return [
            'usuario' => 'Usuario',
            'id_rol' => 'Rol',
            'id_cliente' => 'Cliente',
            'reseteo' => 'Resetear Clave (por defecto 123456)',
        ];
    }
}