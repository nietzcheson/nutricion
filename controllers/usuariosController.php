<?php 
class usuariosController extends Controller{
	public function __construct(){
		parent::__construct();
		if(!Session::get("autenticado")){$this->redireccionar("login");}
	}
	public function index(){}
}
?>