<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "is_departamento".
 *
 * @property integer $id_departamento
 * @property string $descripcion
 * @property integer $activo
 */
class Departamento extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'is_departamento';
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
            'id_departamento' => 'Id Departamento',
            'descripcion' => 'Descripcion',
            'activo' => 'Activo',
        ];
    }

    public function getColor() {
        $statuscolor='white';

        switch ($this->activo) {
            case 0:
                $statuscolor='red';
                break;       
        }
        echo  $statuscolor;die;
        return $statuscolor;
        
    }
}
