<?php
class perfilesController extends adminController{

  private $_modelo;
  public function __construct(){
    parent::__construct();
    $this->_modelo = $this->loadModel("perfiles");
  }

  public function index(){
    $this->_view->assign("titulo","Perfiles");
    //$this->_view->setJs(array("perfiles"));

    $btnHeader = array(
      array(
        "titulo" => "Crear perfil",
        "enlace" => "admin/perfiles/crear"
      ),

    );

    $this->_view->assign("btnHeader",$btnHeader);

    $perfiles = $this->_modelo->getPerfiles();

    $empresas = $this->_modelo->getEmpresas();

    for($i=0;$i<count($perfiles);$i++){
      if($perfiles[$i]["id_tipoperfil"]==2){
        for($e=0;$e<count($empresas);$e++){
          if($empresas[$e]["id"]==$perfiles[$i]["id_empresa"]){
            $perfiles[$i]["nombre_empresa"] = $empresas[$e]["empresa"];
          }
        }
      }
    }

    $this->_view->assign("empresas",$perfiles);

    $this->_view->renderizar("index","perfiles");
  }

  public function crear(){
    $this->_view->assign("titulo","Crear perfil");
    $this->_view->assign("empresas",$this->_modelo->getEmpresas());
    $this->_view->setJs(array("crear-perfil"));
    $this->_view->setCss(array("perfiles"));
    $this->_view->assign("frecuencias",$this->_modelo->getFrecuencias());
    $this->_view->assign("tipos_perfil",$this->_modelo->getTiposPerfil());
    $btnHeader = array(
      array(
        "titulo" => "return",
        "enlace" => "admin/perfiles"
      ),

    );
    $this->_view->assign("btnHeader",$btnHeader);

    //$this->_view->assign("widget",$this->_view->widget("menu","menu"));
    //$this->_view->assign("empresas",$this->_modelo->getEmpresas());

    if($this->getInt("crear")==1){
      $this->_view->assign("datos",$_POST);
      $tipoPerfil            = $this->getInt("tipoPerfil");
      $idEmpresa             = "";
      $nombres               = $this->getSql("nombres");
      $apellidos             = $this->getSql("apellidos");
      $direccion             = $this->getSql("direccion");
      $email                 = $this->getSql("email");
      $frecuenciaEmail       = $this->getSql("frecuenciaEmail");
      $telefonoTrabajo       = $this->getInt("telefonoTrabajo");
      $telefonoCasa          = $this->getInt("telefonoCasa");
      $telefonoCelular       = $this->getInt("telefonoCelular");
      $edad                  = $this->getInt("edad");
      $estatura_metros       = $this->getSql("estatura_metros");
      $estatura_centimetros  = $this->getSql("estatura_centimetros");
      $centimetros           = $this->getSql("centimetros");
      $fechaNacimiento       = $this->getSql("fechaNacimiento");
      $lugarNacimiento       = $this->getSql("lugar_nacimiento");

      $errores="";
        if ($tipoPerfil=="") {
          $errores.="Seleccione el tipo de perfil<br>";
        }

        if($tipoPerfil==2){
          $idEmpresa = $this->getInt("empresa");

          if($idEmpresa==""){
            $errores.="La empresa está vacía<br>";
          }

        }

        if ($nombres=="") {
          $errores.="El nombre está vacío<br>";
        }
        if ($apellidos=="") {
          $errores.="El apellido está vacío<br>";
        }
        if ($direccion=="") {
          $errores.="La dirección está vacía<br>";
        }
        if ($email=="") {
          $errores.="El correo electrónico está vacío<br>";
        }
        if ($telefonoTrabajo=="" || $telefonoCasa=="" || $telefonoCelular=="") {
          $errores.="Se necesita al menos un número teléfonico<br>";
        }
        if ($edad=="") {
          $errores.="Seleccione la edad<br>";
        }
        if ($estatura_metros=="" && $estatura_centimetros=="") {
          $errores.="Seleccione los rangos de estatura (metros y centímetros)<br>";
        }
        if ($fechaNacimiento=="") {
          $errores.="La fecha de nacimiento está vacía<br>";
        }
        if ($lugarNacimiento=="") {
          $errores.="El lugar de nacimiento está vacío<br>";
        }
        if ($errores!=="") {
          $this->_view->assign("_error",$errores);
          $this->_view->renderizar('crear-perfil',"perfiles");
          exit;
        }

        $datosEnviar = array(
          "id_tipoperfil"        =>$tipoPerfil,
          "id_empresa"           =>$idEmpresa,
          "nombres"              =>$nombres,
          "apellidos"            =>$apellidos,
          "direccion"            =>$direccion,
          "email"                =>$email,
          "frecuenciaEmail"      =>$frecuenciaEmail,
          "telefono_trabajo"     =>$telefonoTrabajo,
          "telefono_casa"        =>$telefonoCasa,
          "telefono_celular"     =>$telefonoCelular,
          "edad"                 =>$edad,
          "estatura_metros"      =>$estatura_metros,
          "estatura_centimetros" =>$estatura_centimetros,
          "fecha_nacimiento"     =>$fechaNacimiento,
          "lugar_nacimiento"     =>$lugarNacimiento,
          "fecha_creacion"       =>DATE_FORMAT
        );

        $this->_modelo->crearPerfil($datosEnviar);
        $this->_view->assign("_mensaje","El Perfil ha sido creado");
        //$this->redireccionar('empresas');
        $this->_view->assign("datos",$_POST="");
        $this->_view->renderizar("crear-perfil","perfiles");
        exit();

    }

    $this->_view->renderizar("crear-perfil","perfiles");
  }

  public function empresas(){
    echo json_encode($this->_modelo->getEmpresas());
  }
}
