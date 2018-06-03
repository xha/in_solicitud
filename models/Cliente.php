<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "is_cliente".
 *
 * @property integer $id_cliente
 * @property string $letra_rif
 * @property string $rif
 * @property string $razon_social
 * @property string $representante
 * @property string $direccion
 * @property string $telefono
 * @property string $telefono2
 * @property string $correo
 * @property string $porcentaje
 * @property integer $activo
 *
 * @property IsSolicitud[] $isSolicituds
 */
class Cliente extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'is_cliente';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['rif', 'razon_social'], 'required'],
            [['activo','id_costo', 'id_porcentaje'], 'integer'],
            [['letra_rif'], 'string', 'max' => 1],
            [['rif'], 'string', 'max' => 12],
            [['razon_social', 'representante', 'direccion'], 'string', 'max' => 255],
            [['telefono', 'correo'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_cliente' => 'Id Cliente',
            'letra_rif' => 'Letra Rif',
            'rif' => 'Rif',
            'razon_social' => 'Razon Social',
            'representante' => 'Representante',
            'direccion' => 'Direccion',
            'telefono' => 'Telefono',
            'correo' => 'Correo',
            'id_porcentaje' => 'Porcentaje',
            'id_costo' => 'Costo',
            'activo' => 'Activo',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSolicituds()
    {
        return $this->hasMany(Solicitud::className(), ['id_cliente' => 'id_cliente']);
    }
}
