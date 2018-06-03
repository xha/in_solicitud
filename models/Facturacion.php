<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "is_facturacion".
 *
 * @property integer $id_facturacion
 * @property string $observacion
 * @property string $porcentaje
 * @property string $costo_hora
 * @property string $total
 */
class Facturacion extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'is_facturacion';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['observacion'], 'string'],
            [['porcentaje', 'costo_hora', 'total', 'total_horas','pagado'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_facturacion' => 'Id Facturacion',
            'observacion' => 'Observacion',
            'porcentaje' => 'Porcentaje',
            'costo_hora' => 'Costo Hora',
            'total' => 'Total',
            'total_horas' => 'Horas',
            'pagado' => 'Pagado',
        ];
    }
}
