<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Solicitud;

/**
 * SolicitudSearch represents the model behind the search form about `app\models\Solicitud`.
 */
class SolicitudSearch extends Solicitud
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_solicitud', 'activo'], 'integer'],
            [['descripcion', 'titulo', 'id_tipo_servicio', 'id_sucursal', 'id_cliente','fecha'], 'safe'],
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
        $query = Solicitud::find()->OrderBy('fecha, activo');

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

        $query->joinWith('idCliente');
        $query->joinWith('idSucursal');
        $query->joinWith('idTipoServicio');

        // grid filtering conditions
        $query->andFilterWhere([
            'id_solicitud' => $this->id_solicitud,
            'fecha' => $this->fecha,
            'is_solicitud.activo' => $this->activo,
        ]);

        $query->andFilterWhere(['like', 'titulo', $this->titulo])
            ->andFilterWhere(['like', 'is_cliente.razon_social', $this->id_cliente])
            ->andFilterWhere(['like', 'sucursal.id_sucursal', $this->id_sucursal])
            ->andFilterWhere(['like', 'is_tipo_servicio.id_tipo_servicio', $this->id_tipo_servicio])
            ->OrderBy('id_solicitud desc');
        return $dataProvider;
    }
}
