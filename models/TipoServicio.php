<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "is_tipo_servicio".
 *
 * @property integer $id_tipo_servicio
 * @property string $descripcion
 * @property integer $activo
 *
 * @property IsSolicitud[] $isSolicituds
 */
class TipoServicio extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'is_tipo_servicio';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['descripcion'], 'required'],
            [['activo'], 'integer'],
            [['descripcion'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_tipo_servicio' => 'Id Tipo Servicio',
            'descripcion' => 'Descripcion',
            'activo' => 'Activo',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIsSolicituds()
    {
        return $this->hasMany(Solicitud::className(), ['id_tipo_servicio' => 'id_tipo_servicio']);
    }
}
