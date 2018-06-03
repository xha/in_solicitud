<?php

namespace app\controllers;

use Yii;
use app\models\Servicio;
use app\models\ServicioSearch;
use app\models\AccessHelpers;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\db\Query;
use yii\helpers\Json;

/**
 * ServicioController implements the CRUD actions for Servicio model.
 */
class ServicioController extends Controller {
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    public function beforeAction($action)
    {
        if (!parent::beforeAction($action)) {
            return false;
        }

        return AccessHelpers::chequeo();
    }

    /**
     * Lists all Servicio models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ServicioSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Servicio model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Servicio model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Servicio();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            $arreglo = Yii::$app->request->post('Servicio');
            
            if ($arreglo['activo'] == 1) {
                $connection = \Yii::$app->db;
                $query = 'UPDATE is_solicitud SET activo=0 WHERE id_solicitud='.$arreglo['id_solicitud'];
                $connection->createCommand($query)->query();
            };
            $model->activo = 1;
            $model->save();
            return $this->redirect(['view', 'id' => $model->id_servicio]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Servicio model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $arreglo = Yii::$app->request->post('Servicio');
            if ($arreglo['activo'] == 1) {
                $connection = \Yii::$app->db;
                $query = 'UPDATE is_solicitud SET activo=0 WHERE id_solicitud='.$arreglo['id_solicitud'];
                $connection->createCommand($query)->query();
            };
            return $this->redirect(['view', 'id' => $model->id_servicio]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Servicio model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        /*$model = $this->findModel($id);

        $model->activo = 0;
        $model->save();*/
        return $this->redirect(['index']);
    }

    /**
     * Finds the Servicio model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Servicio the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Servicio::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionBuscarServicios($cliente) {
        $connection = \Yii::$app->db;
        $query = "SELECT se.id_servicio,DATE_FORMAT(se.fecha,'%d-%m-%Y') as fecha, LEFT(se.descripcion,40) AS descripcion,
                se.hora_salida,se.hora_entrada,se.total_horas 
                from is_solicitud s, is_servicio se
                where s.id_solicitud=se.id_solicitud 
                and se.activo=1 and s.id_cliente='.$cliente.'
                order by se.fecha";
        $pendientes = $connection->createCommand($query)->queryAll();
        //$pendientes = $comand->readAll();
        echo Json::encode($pendientes);
    }    

    public function actionBuscarCostoPorcentaje($cliente) {
        $connection = \Yii::$app->db;
        $query = "SELECT c.costo, p.porcentaje
                from is_cliente i, is_porcentaje p, is_costo c
                where i.id_porcentaje=p.id_porcentaje and i.id_costo=c.id_costo
                and i.activo=1 and i.id_cliente=".$cliente;
        $pendientes = $connection->createCommand($query)->queryAll();
        //$pendientes = $comand->readAll();
        echo Json::encode($pendientes);
    }

    public function actionImprimir($id = null) {
        echo "<script>";
        echo "window.open('../site/imprimir-hoja?id_servicio='+$id,'_parent','');";
        echo "</script>";
    }

}
