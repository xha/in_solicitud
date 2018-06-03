<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Servicio;

/**
 * ServicioSearch represents the model behind the search form about `app\models\Servicio`.
 */
class ServicioSearch extends Servicio
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_servicio', 'id_solicitud'], 'integer'],
            [['descripcion', 'fecha'], 'safe'],
            [['hora_entrada', 'hora_salida', 'total_horas'], 'number'],
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
        $id_usuario = Yii::$app->user->identity->id_usuario;
        $rol = Yii::$app->user->identity->id_rol;
        
        if ($rol < 3) {
            $query = Servicio::find()->where(['id_usuario' => $id_usuario])->OrderBy('id_servicio desc');    
        } else {
            $query = Servicio::find()->OrderBy('id_servicio desc');
        }        

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
            'id_servicio' => $this->id_servicio,
            'fecha' => $this->fecha,
            'hora_entrada' => $this->hora_entrada,
            'hora_salida' => $this->hora_salida,
            'total_horas' => $this->total_horas,
            'id_solicitud' => $this->id_solicitud,
            'activo' => $this->activo,
        ]);

        $query->andFilterWhere(['like', 'descripcion', $this->descripcion]);

        return $dataProvider;
    }
}
