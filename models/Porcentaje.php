<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "is_porcentaje".
 *
 * @property integer $id_porcentaje
 * @property string $porcentaje
 * @property boolean $activo
 *
 * @property IsUsuario[] $isUsuarios
 */
class Porcentaje extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'is_porcentaje';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_porcentaje'], 'required'],
            [['activo'], 'boolean'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_porcentaje' => 'Id porcentaje',
            'porcentaje' => 'Porcentaje',
            'activo' => 'Activo',
        ];
    }
}
