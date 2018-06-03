<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "is_solicitud".
 *
 * @property integer $id_solicitud
 * @property string $descripcion
 * @property string $fecha_inicial
 * @property string $fecha_final
 * @property string $hora_entrada
 * @property string $hora_salida
 * @property integer $id_tipo_servicio
 * @property integer $id_sucursal
 * @property integer $id_cliente
 * @property integer $activo
 *
 * @property IsTipoServicio $idTipoServicio
 * @property IsSucursal $idSucursal
 * @property IsCliente $idCliente
 */
class Solicitud extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'is_solicitud';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['descripcion'], 'string','max'=>600],
            [['id_tipo_servicio', 'id_sucursal', 'id_cliente', 'activo'], 'integer'],
            [['titulo'], 'string','max'=>60],
            [['id_tipo_servicio'], 'exist', 'skipOnError' => true, 'targetClass' => TipoServicio::className(), 'targetAttribute' => ['id_tipo_servicio' => 'id_tipo_servicio']],
            [['id_sucursal'], 'exist', 'skipOnError' => true, 'targetClass' => Sucursal::className(), 'targetAttribute' => ['id_sucursal' => 'id_sucursal']],
            [['id_cliente'], 'exist', 'skipOnError' => true, 'targetClass' => Cliente::className(), 'targetAttribute' => ['id_cliente' => 'id_cliente']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_solicitud' => 'Solicitud',
            'titulo' => 'Título',
            'descripcion' => 'Descripcion',
            'id_tipo_servicio' => 'Tipo Servicio',
            'id_sucursal' => 'Sucursal',
            'id_cliente' => 'Cliente',
            'activo' => 'Estatus',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdTipoServicio()
    {
        return $this->hasOne(TipoServicio::className(), ['id_tipo_servicio' => 'id_tipo_servicio']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdSucursal()
    {
        return $this->hasOne(Sucursal::className(), ['id_sucursal' => 'id_sucursal']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdCliente()
    {
        return $this->hasOne(Cliente::className(), ['id_cliente' => 'id_cliente']);
    }

    public function getClienteRazon()
    {
        return $this->hasOne(Cliente::className(), ['id_cliente' => 'id_cliente']);
    }
}
