<?php

namespace app\controllers;

use Yii;
use mPDF;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ActivarForm;
use app\models\CambiarClaveForm;
use app\models\ReporteForm;
use app\models\ContactForm;
use app\models\AccessHelpers;
use app\models\RegisterForm;
use app\models\RecuperarClaveForm;
use app\models\Usuario;
use yii\widgets\ActiveForm;
use yii\web\Response;
use yii\helpers\Url;
use yii\helpers\Html;
use yii\db\Query;
use yii\helpers\Json;
Use app\itbz\fpdf\src\fpdf\fpdf;

class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['site-index'],
                'rules' => [
                    [
                        'actions' => ['site-index'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['site-logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
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
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        
        return $this->render('index');
    }

    public function actionReporte()
    {
        $model = new ReporteForm();

        return $this->render('reporte', [
            'model' => $model,
        ]);
    }
    
    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
    
    public function actionCambiar() {
        $model = new CambiarClaveForm;
           
        $msg = null;
        
        if ($model->load(Yii::$app->request->post()) && Yii::$app->request->isAjax)
        {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ActiveForm::validate($model);
        }

        if ($model->load(Yii::$app->request->post()))
        {
            if($model->validate()) {
                //Preparamos la consulta para guardar el usuario
                $table = new Usuario;
                $table->id_usuario = $model->id_usuario;
                $table->clave = md5("is".$model->clave);
                $table->clave_actual = md5("is".$model->clave_actual);
                
                $connection = \Yii::$app->db;

                $query = "UPDATE is_usuario
                SET clave='".$table->clave."'
                where id_usuario='".$table->id_usuario."' and clave='".$table->clave_actual."'";
                $connection->createCommand($query)->execute();
                
                $query = "SELECT count(*) as conteo 
                FROM is_usuario WHERE id_usuario='".$table->id_usuario."' and clave='".$table->clave."'";
                $salida = $connection->createCommand($query)->queryOne();
        
                if ($salida['conteo']>0) {
                    $msg = "Clave Actualizada";
                } else {
                    $msg = "Error al actualizar la clave";
                }
                
            } else {
                $model->getErrors();
            }
          }

        return $this->render('cambiar', [
            'model' => $model,
            'msg' => $msg
        ]);  
    }

    public function actionRegister() {
        $model = new RegisterForm;
           
        $msg = null;
        
        if ($model->load(Yii::$app->request->post()) && Yii::$app->request->isAjax)
        {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ActiveForm::validate($model);
        }

        if ($model->load(Yii::$app->request->post()))
        {
            if($model->validate()) {
                //Preparamos la consulta para guardar el usuario
                $table = new Usuario;
                $table->usuario = $model->usuario;
                $table->correo = $model->correo;
                $table->cedula = $model->cedula;
                $table->nombre = $model->nombre;
                $table->apellido = $model->apellido;
                $table->sexo = $model->sexo;
                $table->telefono = $model->telefono;
                $table->id_rol = 1;
                $table->id_pregunta = $model->id_pregunta;
                $table->observacion = $model->empresa;
                $table->respuesta_seguridad = $model->respuesta_seguridad;
                $table->id_cliente = 1;
                $table->activo = 0;
                $table->id_usuario = 0;
                $table->clave = md5("is".$model->clave);
                
                //Si el registro es guardado correctamente
                if ($table->insert())
                {
                    $msg = "Registro Guardado, Debe esperar que un administrador active su cuenta";
                }
                else
                {
                    $msg = "Error al guardar";
                }
            } else {
                $model->getErrors();
            }
          }

        return $this->render('register', [
            'model' => $model,
            'msg' => $msg
        ]);  
    }

    /**
     * Displays contact page.
     *
     * @return string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    public function actionRecuperar()
    {
        $model = new RecuperarClaveForm;
           
        $msg = null;
        
        if ($model->load(Yii::$app->request->post()))
        {
            $clave = md5("is".$model->clave);
            $connection = \Yii::$app->db;

            $query = "UPDATE is_usuario
            SET clave='$clave'
            where usuario='".$model->usuario."' and id_pregunta=".$model->id_pregunta." and respuesta_seguridad='".$model->respuesta_seguridad."' and correo='".$model->correo."'";
            $msg = $connection->createCommand($query)->execute();
            
            if ($msg > 0) {
                $msg = "Registro Guardado";
            } else {
                $msg = "Error al Actualizar";
            };
        }

        return $this->render('recuperar', [
            'model' => $model,
            'msg' => $msg
        ]);
    }

    public function actionActivar()
    {
        $model = new ActivarForm;
        $msg = null;
        
        if ($model->load(Yii::$app->request->post())) {
            $extra="";
            if ($model->reseteo==1) {
                $extra = md5("is123456");
                $extra = ",clave='".$extra."'";
            }
            
            $connection = \Yii::$app->db;
            $query = "UPDATE is_usuario
            SET id_cliente=".$model->id_cliente.", id_rol=".$model->id_rol.", activo=".$model->activado.", id_porcentaje=".$model->id_porcentaje." $extra
            where id_usuario=".$model->id_usuario;
            $msg = $connection->createCommand($query)->execute();
            
            if ($msg > 0) {
                $msg = "Registro Actualizado";
            } else {
                $msg = "Error al Actualizar";
            };
        }

        return $this->render('activar', [
            'model' => $model,
            'msg' => $msg
        ]);
    }

    public function actionBuscarServicios($cliente = null, $usuario = null, $fecha_inicial = null, $fecha_final = null) {
        $connection = \Yii::$app->db;
        $extra = "";
        if ($cliente!='') $extra=' and c.id_cliente='.$cliente;
        if ($usuario!='') $extra=' and u.id_usuario='.$usuario;

        $query = "SELECT se.id_servicio,DATE_FORMAT(se.fecha,'%d-%m-%Y') as fecha, LEFT(se.descripcion,40) AS descripcion,u.usuario, c.razon_social
                from is_solicitud s, is_servicio se, is_usuario u,is_cliente c
                where s.id_solicitud=se.id_solicitud and se.id_usuario=u.id_usuario and s.id_cliente=c.id_cliente
                and se.fecha between '$fecha_inicial' and '$fecha_final' $extra
                order by se.fecha";
        //echo $query;die;
        $pendientes = $connection->createCommand($query)->queryAll();
        //$pendientes = $comand->readAll();
        echo Json::encode($pendientes);
    }

    public function actionObservacion($usuario = null) {
        $connection = \Yii::$app->db;
        $extra = "";

        $query = "SELECT observacion
                from is_usuario
                where id_usuario=$usuario";
        $pendientes = $connection->createCommand($query)->queryOne();
        echo Json::encode($pendientes);
    }

    public function actionSamplePdf() {
        $mpdf = new mPDF;
        $mpdf->WriteHTML('Sample Text');
        $mpdf->Output();
        //$mpdf->Output('MyPDF.pdf', 'D');
        exit;
    }

    public function actionSampleFpdf()
    {
        $pdf = new \fpdf\FPDF();
        $pdf->AddPage();
        $pdf->SetFont('Arial','B',16);
        $pdf->Cell(40,10,'Hello World!');
        $pdf->Output();
        exit;
    }

    public function actionImprimirHoja($id_servicio = null) {
        $connection = \Yii::$app->db;

        $query = "SELECT s.id_servicio,s.descripcion,DATE_FORMAT(s.fecha,'%d-%m-%Y') AS fecha,s.hora_entrada,s.hora_salida,CONCAT(u.apellido, ', ', u.nombre) as nombre, so.descripcion as solicitud,c.razon_social, t.descripcion as tipo, su.descripcion as sucursal
            FROM is_servicio s, is_usuario u,is_solicitud so, is_cliente c, is_tipo_servicio t, is_sucursal su
            WHERE id_servicio=$id_servicio and s.id_usuario=u.id_usuario and s.id_solicitud=so.id_solicitud and so.id_cliente=c.id_cliente and t.id_tipo_servicio=so.id_tipo_servicio and su.id_sucursal=so.id_sucursal";
        $pendientes = $connection->createCommand($query)->queryOne();
        $pdf = new \fpdf\FPDF('P','mm','Letter');
        $pdf->SetAutoPageBreak(false,35);
        
        if (strlen($pendientes['hora_entrada']) < 4) {
            $hora_e = substr($pendientes['hora_entrada'], 0,1   ).":".substr($pendientes['hora_entrada'], 1,2);
        } else {
            $hora_e = substr($pendientes['hora_entrada'], 0,2).":".substr($pendientes['hora_entrada'], 2,2);    
        }
        
        $hora_s = substr($pendientes['hora_salida'], 0,2).":".substr($pendientes['hora_salida'], 2,2);
        /*****************************************************************************************************************/
        $pdf->AddPage(); 
        $pdf->SetFont('Arial','',10);        
        $pdf->Cell(193,27,"",1,1,'L',0); 
        $logo = "../img/logo.jpg";
        $pdf->Image($logo,12,11,54,25);     
        $yactual = $pdf->getY(); 
         /*****************************************************************************************************************/
        $pdf->SetY(12);
        $pdf->SetX(128);
        $pdf->SetFillColor(180,180,180);
        $pdf->Cell(30,5,"Servicio No.",1,1,'C',1);      
        $pdf->SetFillColor(255,255,255);
        $pdf->SetY(17);
        $pdf->SetX(128);
        $pdf->Cell(30,5,$pendientes['id_servicio'],1,1,'C',1);           
        $pdf->SetY(23);
        $pdf->SetX(128);
        $pdf->SetFillColor(180,180,180);
        $pdf->Cell(25,5,utf8_decode("Emisión"),1,1,'C',1);      
        $pdf->SetFillColor(255,255,255);
        $pdf->SetY(28);
        $pdf->SetX(128);
        $pdf->Cell(25,5,$pendientes['fecha'],1,1,'C',1);           
        $pdf->SetY(23);
        $pdf->SetX(153);
        $pdf->SetFillColor(180,180,180);
        $pdf->Cell(25,5,"Hora E",1,1,'C',1);      
        $pdf->SetFillColor(255,255,255);
        $pdf->SetY(28);
        $pdf->SetX(153);
        $pdf->Cell(25,5,$hora_e,1,1,'C',1);           
        $pdf->SetY(23);
        $pdf->SetX(178);
        $pdf->SetFillColor(180,180,180);
        $pdf->Cell(25,5,"Hora S",1,1,'C',1);      
        $pdf->SetFillColor(255,255,255);
        $pdf->SetY(28);
        $pdf->SetX(178);
        $pdf->Cell(25,5,$hora_s,1,1,'C',1);           
        /*****************************************************************************************************************/
        $pdf->setY($yactual);
        $pdf->SetFillColor(180,180,180);
        $pdf->Cell(193,5,"Cliente:",1,1,'L',1);     
        $pdf->MultiCell(193,5,$pendientes['razon_social']." (Sucursal ".$pendientes['sucursal'].")",1,'L');
        /*****************************************************************************************************************/
        $pdf->SetFillColor(180,180,180);
        $pdf->Cell(193,5,"Departamentos:",1,1,'L',1);     
        $pdf->SetFillColor(255,255,255);
        $pdf->MultiCell(193,5,'',1,'L');     
        /*****************************************************************************************************************/
        $pdf->SetFillColor(180,180,180);
        $pdf->Cell(193,5,"Requerimiento:",1,1,'L',1);              
        $pdf->SetFillColor(255,255,255);
        $yactividades = $pdf->GetY();
        //$pdf->MultiCell(192,5,utf8_decode($pendientes['solicitud']),0,'J'); 
        //$pdf->Cell(193,30,utf8_decode($pendientes['titulo']),1,1,'L',1);              
        $pdf->MultiCell(193,6,utf8_decode($pendientes['solicitud']),1,'L'); 
        $pdf->SetFillColor(180,180,180);              
        $pdf->Cell(193,5,"DESCRIPCION DEL SERVICIO:",1,1,'L',1);              
        $pdf->SetFillColor(255,255,255);
        $yservicios = $pdf->GetY();
        $pdf->Cell(193,130,"",1,1,'L',1);              
        /*****************************************************************************************************************/
        $texto = "Realizado por: ";
        $texto.= "                     ";
        $texto.= "                     ";
        $texto.= "                     ";
        $texto.= "                     ";
        $texto.= "Firma y sello de la empresa";
        $pdf->Ln(2); 
        $pdf->MultiCell(193,6,$texto,0,'L');     
        $pdf->MultiCell(193,6,$pendientes['nombre'],0,'L'); 
        /*****************************************************************************************************************/
        $pdf->MultiCell(193,6,"Tipo de servicio:",0,'L');    
        $pdf->MultiCell(193,6,utf8_decode($pendientes['tipo']),0,'L');    
        /*****************************************************************************************************************/
        $pdf->Ln(7); 
        $pdf->SetFont('Arial','',9); 
        $texto = "Dirección: Urb. Sorocaima, Edif. San Vicente, Piso 1, ";
        $texto.= "Ofic 1-B, Maiquetía, Edo. Vargas. Teléfonos: (0212) 331.6140, (0414) 299.2745";
        $pdf->MultiCell(193,4,utf8_decode($texto),0,'C');
        $pdf->SetFont('Arial','B',8); 
        $texto = "Web: innovasoluciones.com.ve                  Email: innovasoluciones@cantv.net";
        $pdf->MultiCell(193,4,$texto,0,'C');     
        /***********************************************/
        $pdf->SetFont('Arial','',10); 
        $pdf->SetX(10);
        $pdf->SetY($yservicios+1);
        $pdf->SetFont('Arial','',9); 
        $pdf->MultiCell(192,5,utf8_decode($pendientes['descripcion']),0,'J');          

        $pdf->Output('');
        exit;
    }
}
