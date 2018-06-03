<?php

namespace app\controllers;

use Yii;
use app\models\Facturacion;
use app\models\FacturacionSearch;
use app\models\AccessHelpers;
use app\models\ReporteFacturacionForm;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\db\Query;
use yii\helpers\Json;
Use app\itbz\fpdf\src\fpdf\fpdf;

/**
 * FacturacionController implements the CRUD actions for Facturacion model.
 */
class FacturacionController extends Controller
{
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
     * Lists all Facturacion models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new FacturacionSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionReporte()
    {
        $model = new ReporteFacturacionForm();

        return $this->render('reporte', [
            'model' => $model,
        ]);
    }

    /**
     * Displays a single Facturacion model.
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
     * Creates a new Facturacion model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Facturacion();
        $connection = \Yii::$app->db;
        if ($model->load(Yii::$app->request->post())) {
            //var_dump($model->attributes);die;
            $model->save();
            $servicios = explode("¬",$_POST['i_servicios']);

            $query = "DELETE FROM is_facturacion_servicio WHERE id_facturacion=".$model->id_facturacion;
            $connection->createCommand($query)->query();

            for ($i=0;$i < count($servicios) - 1;$i++) {
                $campos = explode("#",$servicios[$i]);
                $query = "INSERT INTO is_facturacion_servicio VALUES (".$campos[0].",".$model->id_facturacion.");";
                $connection->createCommand($query)->query();

                $query = "UPDATE is_servicio SET activo=0 WHERE id_servicio=".$campos[0];
                $connection->createCommand($query)->query();                
            }

            return $this->redirect(['view', 'id' => $model->id_facturacion]);
        } else {
            $query = 'SELECT c.id_cliente,c.razon_social
                    from is_cliente c, is_solicitud s, is_servicio se
                    where c.id_cliente=s.id_cliente and s.id_solicitud=se.id_solicitud 
                    and se.activo=1
                    group by c.id_cliente,c.razon_social
                    order by c.razon_social';
            $pendientes = $connection->createCommand($query)->queryAll();
            //$pendientes = $comand->readAll();

            return $this->render('create', [
                'model' => $model,
                'pendientes' => $pendientes,
            ]);
        }
    }

    /**
     * Updates an existing Facturacion model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id_facturacion]);
        } else {
            $connection = \Yii::$app->db;
            $query = 'SELECT c.id_cliente,c.razon_social
                    from is_cliente c, is_solicitud s, is_servicio se
                    where c.id_cliente=s.id_cliente and s.id_solicitud=se.id_solicitud 
                    and se.activo=1
                    group by c.id_cliente,c.razon_social
                    order by c.razon_social';
            $pendientes = $connection->createCommand($query)->queryAll();
            //$pendientes = $comand->readAll();

            return $this->render('create', [
                'model' => $model,
                'pendientes' => $pendientes,
            ]);
        }
    }

    /**
     * Deletes an existing Facturacion model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id) {
        $connection = \Yii::$app->db;

        $query = "SELECT * from is_facturacion_servicio where id_facturacion=".$id;
        $pendientes = $connection->createCommand($query)->queryAll();
        for ($i=0;$i<count($pendientes);$i++) {
            $query = "UPDATE is_servicio SET activo=1 WHERE id_servicio=".$pendientes[$i]['id_servicio'];
            $connection->createCommand($query)->query();
        }

        $query = "DELETE FROM is_facturacion_servicio WHERE id_facturacion=".$id;
        $connection->createCommand($query)->query();

        $this->findModel($id)->delete();
        return $this->redirect(['index']);
    }

    /**
     * Finds the Facturacion model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Facturacion the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Facturacion::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    /**********************************************************************************************************************************************************************************/
    public function actionImprimir($id = null) {
        $connection = \Yii::$app->db;

        if ($id<1) $id=1;
        $query = "SELECT * FROM is_facturacion where id_facturacion=".$id;
        $facturas = $connection->createCommand($query)->queryOne();

        $query = "SELECT s.id_servicio, s.descripcion as servicio,DATE_FORMAT(s.fecha,'%d-%m-%Y') AS fecha, CONCAT(u.apellido, ', ', u.nombre) as nombre, s.total_horas, c.razon_social,s.hora_entrada,s.hora_salida
            FROM is_facturacion_servicio f, is_servicio s, is_usuario u, is_cliente c, is_solicitud so
            where f.id_servicio=s.id_servicio and s.id_usuario=u.id_usuario and so.id_solicitud=s.id_solicitud and so.id_cliente=c.id_cliente and f.id_facturacion=".$id;
        $detalle_facturas = $connection->createCommand($query)->queryAll();
        /*****************************************************************************************************************/
        $pdf = new \fpdf\FPDF('L','mm','Letter');
        $pdf->SetAutoPageBreak(false,35);
        /*****************************************************************************************************************/
        $pdf->AddPage(); 
        $pdf->SetFont('Arial','',10);        
        $pdf->Cell(255,27,"",1,1,'L',0); 
        $logo = "../img/logo.jpg";
        $pdf->Image($logo,12,11,54,25);     
        $yactual = $pdf->getY(); 
        /*****************************************************************************************************************/
        $x_izq = 10;
        $x_cen = 120;
        $x_der = 225;
        $pdf->SetY(12);
        $pdf->SetX($x_der);
        $pdf->SetFillColor(180,180,180);
        $pdf->Cell(30,5,"Reporte No.",1,1,'C',1);      
        $pdf->SetFillColor(255,255,255);
        $pdf->SetY(17);
        $pdf->SetX($x_der);
        $pdf->Cell(30,5,$facturas['id_facturacion'],1,1,'C',1);           
        $pdf->SetY(30);
        $pdf->SetX($x_cen);
        $pdf->SetFont('Arial','B',12); 
        $pdf->Cell(30,5,'Reporte de Servicios por Cliente',0,1,'C',1);           
        $pdf->SetFont('Arial','',9); 
        /*****************************************************************************************************************/
        $pdf->ln(5);
        $pdf->SetFillColor(180,180,180);
        $pdf->SetFont('Arial','B',9); 
        $pdf->Cell(255,5,"Cliente:",1,1,'L',1);     
        $pdf->SetFont('Arial','',9); 
        $pdf->MultiCell(255,5,$detalle_facturas[0]['razon_social'],1,'L');
        /*****************************************************************************************************************/
        $pdf->ln(5);
        //$pdf->setY($yactual);
        $pdf->SetFont('Arial','B',9); 
        $pdf->SetFillColor(180,180,180);
        $pdf->SetWidths(array(40,40,55,40,40,40));
        $pdf->SetAligns(array('C','C','C','C','C','C'));
        $pdf->SetX($x_izq);
        $pdf->Row(array('Servicio','Fecha','Asesor','Hora de Entrada','Hora de Salida','Total Horas'), false, 'DF');
        /*****************************************************************************************************************/
        //DETALLE
        $pdf->SetFont('Arial','',9); 
        $pdf->SetFillColor(255,255,255);
        $pdf->SetWidths(array(40,40,55,40,40,40));
        $pdf->SetAligns(array('C','C','C','C','C','C'));
        for ($i=0;$i<count($detalle_facturas);$i++) {
            $hora_e = substr($detalle_facturas[$i]['hora_entrada'], 0,2).":".substr($detalle_facturas[$i]['hora_entrada'], 2,2);
            $hora_s = substr($detalle_facturas[$i]['hora_salida'], 0,2).":".substr($detalle_facturas[$i]['hora_salida'], 2,2);
            $pdf->SetX($x_izq);
            $arreglo = array($detalle_facturas[$i]['id_servicio'],$detalle_facturas[$i]['fecha'],$detalle_facturas[$i]['nombre'],$hora_e,$hora_s,$detalle_facturas[$i]['total_horas']) ;
            $pdf->Row($arreglo, false, 'DF');
        }
        /*****************************************************************************************************************/
        //TOTAL HORAS
        $pdf->SetFont('Arial','B',9); 
        $pdf->SetX($x_izq);
        $pdf->SetWidths(array(215,40));
        $pdf->SetAligns(array('R','C'));
        $pdf->Row(array('Total de Horas',$facturas['total_horas']), false, 'DF');
        /*****************************************************************************************************************/
        //TOTAL Monto
        $pdf->ln();
        $pdf->SetFont('Arial','B',9); 
        $pdf->SetX($x_izq+25);
        $pdf->SetWidths(array(50,50,50,50));
        $pdf->SetAligns(array('R','C','R','C'));
        $pdf->Row(array('Costo por Horas',$facturas['costo_hora']." Bs.",'Monto Total',number_format(($facturas['total_horas']*$facturas['costo_hora']),2,'.',',')." Bs."), false, 'S');
        /*****************************************************************************************************************/
        $pdf->setY(200);
        $pdf->SetFont('Arial','',8); 
        $texto = "Dirección: Urb. Sorocaima, Edif. San Vicente, Piso 1, ";
        $texto.= "Ofic 1-B, Maiquetía, Edo. Vargas. Teléfonos: (0212) 331.6140, (0414) 299.2745";
        $pdf->MultiCell(250,4,utf8_decode($texto),0,'C');
        $pdf->SetFont('Arial','B',8); 
        $texto = "Web: innovasoluciones.com.ve                  Email: innovasoluciones@cantv.net";
        $pdf->MultiCell(250,4,$texto,0,'C');     

        $pdf->Output('');
        exit;
    }
}
