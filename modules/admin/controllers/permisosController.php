<?php

class permisosController extends adminController{

	private $_modelo;
	public function __construct(){
		parent::__construct();
		$this->_modelo = $this->loadModel("permisos");
	}

	public function index(){
		$this->_view->assign("titulo","Permisos");
		$btnHeader = array(
			array(
				"titulo"  => "return",
				"enlace"  => "admin/usuarios"
			),
			array(
				"titulo"  => "Crear Permiso",
				"enlace"  => "admin/permisos/crear"
			)
		);
		$this->_view->assign("btnHeader",$btnHeader);
		$this->_view->assign("permisos",$this->_modelo->getPermisos());
		$this->_view->renderizar("index","permisos");
	}
}