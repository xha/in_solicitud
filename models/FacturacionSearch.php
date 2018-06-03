<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Facturacion;

/**
 * FacturacionSearch represents the model behind the search form about `app\models\Facturacion`.
 */
class FacturacionSearch extends Facturacion
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_facturacion', 'pagado'], 'integer'],
            [['observacion', 'fecha_registro'], 'safe'],
            [['porcentaje', 'costo_hora', 'total'], 'number'],
            [['activo'], 'boolean'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Facturacion::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id_facturacion' => $this->id_facturacion,
            'porcentaje' => $this->porcentaje,
            'costo_hora' => $this->costo_hora,
            'total' => $this->total,
            'fecha_registro' => $this->fecha_registro,
            'activo' => $this->activo,
            'pagado' => $this->pagado,
        ]);

        $query->andFilterWhere(['like', 'observacion', $this->observacion])->OrderBy('id_facturacion desc');

        return $dataProvider;
    }
}
