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
	public function editar($id_permiso=false){
		if (!$id_permiso) {
			$this->redireccionar("permisos/index");
		}
		$btnHeader = array(
			array(
				"titulo"  => "return",
				"enlace"  => "admin/permisos"
			)
		);
		if($this->getInt("modificar") == 1){
			$permiso = $this->getSql("permiso");
			$llave = $this->getSql("llave");
			$errores="";
			if (trim($permiso)=="") {
				$errores.="El permiso debe tener algun nombre";
			}
			if (trim($llave)=="") {
				$errores.="La llave del permiso debe tener algun nombre";
			}
			if ($errores!="") {
				$this->_view->assign("_error",$errores);
				$this->_view->renderizar('crear-usuario',"permisos");
				exit;
			}else{
				$datosEnviar = array(
					"id_permiso"=>$id_permiso,
					"permiso"=>$permiso,
					"llave"=> $llave
				);
				$this->_modelo->actualizarPermiso($datosEnviar);
				$this->_view->assign("_mensaje","El pemiso ha sido modificado");
			}
		}
		$this->_view->assign("btnHeader",$btnHeader);
		$this->_view->assign("titulo","Editar Permiso");
		$this->_view->assign("permiso",$this->_modelo->getPermiso($id_permiso));
		$this->_view->renderizar("editar","permisos");
	}
	public function crear(){
		$btnHeader = array(
			array(
				"titulo"  => "return",
				"enlace"  => "admin/permisos"
			)
		);
		if($this->getInt("crear") == 1){
			$this->_view->assign("datos",$_POST);
			$permiso = $this->getSql("permiso");
			$llave = $this->getSql("llave");
			$errores="";
			if (trim($permiso)=="") {
				$errores.="El permiso debe tener algun nombre";
			}
			if (trim($llave)=="") {
				$errores.="La llave del permiso debe tener algun nombre";
			}
			if ($errores!="") {
				$this->_view->assign("_error",$errores);
			}else{
				$datosEnviar = array(
					"permiso"=>$permiso,
					"llave"=> $llave
				);
				$this->_modelo->crearPermiso($datosEnviar);
				$this->_view->assign("_mensaje","El pemiso ha sido creado");
			}
		}
		$this->_view->assign("btnHeader",$btnHeader);
		$this->_view->assign("titulo","Nuevo Permiso");
		$this->_view->renderizar("crear","permisos");
	}
}