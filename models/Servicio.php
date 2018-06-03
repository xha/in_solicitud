<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "is_servicio".
 *
 * @property integer $id_servicio
 * @property string $descripcion
 * @property string $fecha
 * @property string $hora_entrada
 * @property string $hora_salida
 * @property integer $id_solicitud
 * @property boolean $activo
 *
 * @property IsSolicitud $idSolicitud
 */
class Servicio extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'is_servicio';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['descripcion', 'id_solicitud', 'hora_entrada', 'hora_salida'], 'required'],
            [['descripcion'], 'string'],
            [['fecha'], 'safe'],
            [['hora_entrada', 'hora_salida'], 'number'],
            [['id_solicitud'], 'integer'],
            [['total_horas'], 'integer','min'=>1],
            [['id_usuario'], 'integer'],
            [['activo'], 'boolean'],
            [['id_solicitud'], 'exist', 'skipOnError' => true, 'targetClass' => Solicitud::className(), 'targetAttribute' => ['id_solicitud' => 'id_solicitud']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_servicio' => 'Id Servicio',
            'descripcion' => 'Descripcion',
            'fecha' => 'Fecha',
            'hora_entrada' => 'Hora Entrada',
            'hora_salida' => 'Hora Salida',
            'id_solicitud' => 'Id Solicitud',
            'id_usuario' => 'Id Usuario',
            'total_horas' => 'Total en Horas',
            'activo' => '¿Cerrar Solicitud?',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdSolicitud()
    {
        return $this->hasOne(Solicitud::className(), ['id_solicitud' => 'id_solicitud']);
    }
}
