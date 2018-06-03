<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "is_costo".
 *
 * @property integer $id_costo
 * @property string $costo
 * @property boolean $activo
 *
 * @property IsUsuario[] $isUsuarios
 */
class costo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'is_costo';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_costo'], 'required'],
            [['activo'], 'boolean'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_costo' => 'Id costo',
            'costo' => 'Costo',
            'activo' => 'Activo',
        ];
    }
}
