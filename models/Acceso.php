<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "is_acceso".
 *
 * @property integer $id_acceso
 * @property integer $padre
 * @property string $pagina
 * @property string $alias
 * @property string $etiqueta
 * @property integer $nivel
 * @property integer $activo
 */
class Acceso extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'is_acceso';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['padre', 'nivel', 'activo'], 'integer'],
            [['nivel'], 'required'],
            [['pagina', 'alias', 'etiqueta'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_acceso' => 'Id Acceso',
            'padre' => 'Padre',
            'pagina' => 'Pagina',
            'alias' => 'Alias',
            'etiqueta' => 'Etiqueta',
            'nivel' => 'Nivel',
            'activo' => 'Activo',
        ];
    }
}
