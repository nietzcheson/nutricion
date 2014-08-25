<?php

class loginController extends Controller{

	private $_login;

	public function __construct(){
		parent::__construct();
		$this->_login = $this->loadModel("login");
		$this->_view->setTemplate("test");
	}

	public function index(){

		/*if(Session::get("autenticado")){
			$this->redireccionar();
		}*/

		$this->_view->assign("titulo","Iniciar session");

		if($this->getInt("enviar") == 1){
			$this->_view->assign("post",$_POST);

			if(!$this->getAlphaNum("usuario")){
				$this->_view->assign("_error","Debe introduccir su nombre de usuario");
				$this->_view->renderizar("index","login");
				exit;
			}

			if(!$this->getSql("pass")){
				$this->_view->assign("_error","Debe introduccir su contraseña");
				$this->_view->renderizar("index","login");
				exit;
			}

			$row = $this->_login->getUsuario(
				$this->getAlphaNum("usuario"),
				$this->getSql("pass")
			);

			if(!$row){
				$this->_view->assign("_error","Usuario y/o contraseña incorrectos");
				$this->_view->renderizar("index","login");
				exit;
			}

			if($row["estado"] != 1){
				$this->_view->assign("_error","Este usuario no está habilitado");
				$this->_view->renderizar("index","login");
				exit;
			}

			Session::set("autenticado",true);
			Session::set("level",$row["role"]);
			Session::set("usuario",$row["usuario"]);
			Session::set("id_usuario",$row["id"]);
			Session::set("tiempo",time());

			$this->redireccionar("index");
		}

		$this->_view->renderizar("index","login");

	}


	public function cerrar(){
		Session::destroy();
		//Session::destroy(array('var1','var2'));
		$this->redireccionar();
	}


}


?>
