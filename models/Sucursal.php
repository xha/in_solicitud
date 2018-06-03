<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "is_sucursal".
 *
 * @property integer $id_sucursal
 * @property string $descripcion
 * @property integer $activo
 *
 * @property IsSolicitud[] $isSolicituds
 */
class Sucursal extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'is_sucursal';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['descripcion'], 'required'],
            [['activo'], 'integer'],
            [['descripcion'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_sucursal' => 'Id Sucursal',
            'descripcion' => 'Descripcion',
            'activo' => 'Activo',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIsSolicituds()
    {
        return $this->hasMany(Solicitud::className(), ['id_sucursal' => 'id_sucursal']);
    }
}
