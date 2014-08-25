<?php

class rolesController extends adminController{

	private $_modelo;
	public function __construct(){
		parent::__construct();
		$this->_modelo = $this->loadModel("roles");
	}

	public function index(){
		$this->_view->assign("titulo","Roles");
		$btnHeader = array(
			array(
				"titulo"  => "return",
				"enlace"  => "admin/usuarios"
			),
			array(
				"titulo"  => "Crear role",
				"enlace"  => "admin/roles/crear"
			)
		);
		$this->_view->assign("btnHeader",$btnHeader);
		$this->_view->assign("roles",$this->_modelo->getRoles());
		$this->_view->renderizar("index","usuarios");
	}

	public function permisos_role($roleID){

		$id = $this->filtrarInt($roleID);

		if(!$id){
			$this->redireccionar("acl/roles");
		}

		$row = $this->_modelo->getRole($id);

		if(!$row){
			$this->redireccionar("acl/roles");
		}


		$this->_view->assign("titulo","Permisos role");
		$btnHeader = array(
			array(
				"titulo"  => "return",
				"enlace"  => "admin/roles"
			)
		);
		$this->_view->assign("btnHeader",$btnHeader);

		if($this->getInt("guardar") == 1){
			$values = array_keys($_POST);
			$replace = array();
			$eliminar = array();

			for($i=0; $i < count($values); $i++){
				if(substr($values[$i],0,5) == "perm_"){
					if($_POST[$values[$i]] == "x"){
						$eliminar[] = array(
							"role" => $id,
							"permiso" => substr($values[$i],5)
						);
					}else{
						if($_POST[$values[$i]] == 1){
							$v = 1;
						}else{
							$v = 0;
						}

						$replace[] = array(
							"role" => $id,
							"permiso" => substr($values[$i],5),
							"valor" => $v
						);
					}
				}
			}

			for($i=0; $i < count($eliminar);$i++){
				$this->_modelo->eliminarPermisoRole(
					$eliminar[$i]["role"],
					$eliminar[$i]["permiso"]
				);
			}

			for($i=0; $i < count($replace);$i++){
				$this->_modelo->editarPermisoRole(
					$replace[$i]["role"],
					$replace[$i]["permiso"],
					$replace[$i]["valor"]
				);
			}
		}

		$this->_view->assign("role",$row);
		$this->_view->assign("permisos",$this->_modelo->getPermisosRole($id));
		$this->_view->renderizar("permisos_role");
	}

	public function crear(){
		$this->_view->assign("titulo","Crear Role");
		$btnHeader = array(
			array(
				"titulo"  => "return",
				"enlace"  => "admin/roles"
			)
		);
		$this->_view->assign("btnHeader",$btnHeader);

		if($this->getInt("crear")==1){
			$this->_view->assign("datos",$_POST);
			$role = $this->getSql("role");

			$errores="";
				if ($role=="") {
					$errores.="El role está vacío<br>";
				}
				if ($errores!="") {
					$this->_view->assign("_error",$errores);
					$this->_view->renderizar('crear-role',"empresas");
					exit;
				}

				$datosEnviar = array(
					"role"         =>$role,
				);

				$this->_modelo->crearRole($datosEnviar);
				$this->_view->assign("_mensaje","El role ha sido creado");
				//$this->redireccionar('empresas');
				$this->_view->assign("datos",$_POST="");
				$this->_view->renderizar("crear-role","usuarios");
				exit();

		}


		$this->_view->assign("roles",$this->_modelo->getRoles());
		$this->_view->renderizar("crear-role","usuarios");
	}

}


?>
