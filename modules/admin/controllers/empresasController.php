<?php
class empresasController extends adminController{

  private $_modelo;
  public function __construct(){
    parent::__construct();
    $this->_modelo = $this->loadModel("empresas");
  }

  public function index(){
    $this->_view->assign("titulo","Empresas");
    $this->_view->setJs(array("empresas"));
    $btnHeader = array(
      array(
        "titulo" => "Crear empresa",
        "enlace" => "admin/empresas/crear"
      ),

    );
    $this->_view->assign("btnHeader",$btnHeader);
    $this->_view->assign("empresas",$this->_modelo->getEmpresas());
    $this->_view->renderizar("index","empresas");
  }

  public function crear(){
    $this->_view->assign("titulo","Crear empresa");
    $btnHeader = array(
      array(
        "titulo" => "return",
        "enlace" => "admin/empresas"
      ),

    );

    $this->_view->assign("btnHeader",$btnHeader);

    if($this->getInt("crear")==1){
      $this->_view->assign("datos",$_POST);
      $nombre = $this->getSql("nombre");
      $email = $this->getSql("email");
      $tel = $this->getInt("telefono");
      $direccion = $this->getTexto("direccion");
      $observaciones = $this->getTexto("observaciones");

      $errores="";
				if ($nombre=="") {
					$errores.="El nombre está vacío<br>";
				}
        if ($email=="") {
          $errores.="El email está vacío<br>";
        }else if($email==false){
          $errores.="El email es falso<br>";
        }
        if ($tel=="") {
          $errores.="El teléfono está vacío<br>";
        }
        if ($direccion=="") {
          $errores.="La dirección está vacía<br>";
        }
				if ($errores!="") {
					$this->_view->assign("_error",$errores);
					$this->_view->renderizar('crear-empresa',"empresas");
					exit;
				}

        $datosEnviar = array(
					"empresa"         =>$nombre,
					"email"          =>$email,
					"telefono"       => $tel,
					"direccion"      =>$direccion,
					"observaciones"  =>$observaciones,
					"fecha_creacion" =>DATE_FORMAT
				);

				$this->_modelo->crearEmpresa($datosEnviar);
        $this->_view->assign("_mensaje","La empresa ha sido creada");
        //$this->redireccionar('empresas');
        $this->_view->assign("datos",$_POST="");
        $this->_view->renderizar("crear-empresa","empresas");
				exit();

    }

    $this->_view->renderizar("crear-empresa","empresas");
  }

  public function perfil($id){
    $this->_view->assign("titulo","Perfil empresa");
    $btnHeader = array(
      array(
        "titulo" => "return",
        "enlace" => "admin/empresas"
      ),

    );
    $this->_view->assign("btnHeader",$btnHeader);

    if($this->getInt("actualizar")==1){
      //$this->_view->assign("datos",$_POST);
      $id = $this->getInt("id");
      $nombre = $this->getSql("nombre");
      $email = $this->getSql("email");
      $tel = $this->getInt("telefono");
      $direccion = $this->getTexto("direccion");
      $observaciones = $this->getTexto("observaciones");

      $errores="";
        if ($nombre=="") {
          $errores.="El nombre está vacío<br>";
        }
        if ($email=="") {
          $errores.="El email está vacío<br>";
        }else if($email==false){
          $errores.="El email es falso<br>";
        }
        if ($tel=="") {
          $errores.="El teléfono está vacío<br>";
        }
        if ($direccion=="") {
          $errores.="La dirección está vacía<br>";
        }
        if ($errores!="") {
          $this->_view->assign("_error",$errores);
          $this->_view->renderizar('crear-empresa',"empresas");
          exit;
        }

        $datosEnviar = array(
          "id"             =>$id,
          "empresa"         =>$nombre,
          "email"          =>$email,
          "telefono"       => $tel,
          "direccion"      =>$direccion,
          "observaciones"  =>$observaciones,
        );

        $this->_modelo->actualizarEmpresa($datosEnviar);
        $this->_view->assign("_mensaje","Los datos de la empresa han sido actualizados");
        $this->_view->assign("empresa",$this->_modelo->getEmpresa($id));
        $this->_view->renderizar("perfil","empresas");
        exit();
    }

    $this->_view->assign("empresa",$this->_modelo->getEmpresa($id));
    $this->_view->renderizar("perfil","empresas");
  }

  public function eliminar(){
    $id = $this->getInt("id");


    $this->_modelo->eliminarEmpresa($id);
    echo json_encode($id);
  }

}
?>
