<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Acceso;

/**
 * AccesoSearch represents the model behind the search form about `app\models\Acceso`.
 */
class AccesoSearch extends Acceso
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_acceso', 'padre', 'nivel', 'activo'], 'integer'],
            [['pagina', 'alias', 'etiqueta'], 'safe'],
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
        $query = Acceso::find();

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
            'id_acceso' => $this->id_acceso,
            'padre' => $this->padre,
            'nivel' => $this->nivel,
            'activo' => $this->activo,
        ]);

        $query->andFilterWhere(['like', 'pagina', $this->pagina])
            ->andFilterWhere(['like', 'alias', $this->alias])
            ->andFilterWhere(['like', 'etiqueta', $this->etiqueta]);

        return $dataProvider;
    }
}
