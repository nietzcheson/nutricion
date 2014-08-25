<?php

class usuariosController extends adminController{

	private $_usuarios;

	public function __construct(){
		parent::__construct();
		$this->_usuarios = $this->loadModel("index");

	}

	public function index(){
		$this->_view->assign("titulo","Usuarios");
		$btnHeader = array(
			array(
				"titulo"  => "Crear usuario",
				"enlace"  => "admin/usuarios/crear"
			),
			array(
				"titulo"  => "Roles",
				"enlace"  => "admin/roles"
			),
			array(
				"titulo"  => "Permisos",
				"enlace"  => "admin/permisos"
			)

		);
		$this->_view->assign("btnHeader",$btnHeader);


		$this->_view->assign("usuarios",$this->_usuarios->getUsuarios());
		$this->_view->renderizar("index","usuarios");
	}

	public function permisos($usuarioID){

		$id = $this->filtrarInt($usuarioID);



		if($this->getInt("guardar") == 1){
			$values = array_keys($_POST);
			$replace = array();
			$eliminar = array();

			for($i=0; $i < count($values); $i++){
				if(substr($values[$i],0,5) == "perm_"){
					if($_POST[$values[$i]] == "x"){
						$eliminar[] = array(
							"usuario" => $id,
							"permiso" => substr($values[$i],5)
						);
					}else{
						if($_POST[$values[$i]] == 1){
							$v = 1;
						}else{
							$v = 0;
						}

						$replace[] = array(
							"usuario" => $id,
							"permiso" => substr($values[$i],5),
							"valor" => $v
						);
					}
				}
			}

			for($i=0; $i < count($eliminar);$i++){
				$this->_usuarios->eliminarPermiso(
					$eliminar[$i]["usuario"],
					$eliminar[$i]["permiso"]
				);
			}

			for($i=0; $i < count($replace);$i++){
				$this->_usuarios->editarPermiso(
					$replace[$i]["usuario"],
					$replace[$i]["permiso"],
					$replace[$i]["valor"]
				);
			}
		}

		$permisosUsuario = $this->_usuarios->getPermisosUsuario($id);
		$permisosRole = $this->_usuarios->getPermisosRole($id);

		if(!$permisosUsuario || !$permisosRole){
			$this->redireccionar("usuarios");
		}


		$this->_view->assign("titulo","Permisos de usuario");
		$btnHeader = array(
			array(
				"titulo"  => "return",
				"enlace"  => "admin/usuarios"
			)
		);
		$this->_view->assign("btnHeader",$btnHeader);
		$this->_view->assign("permisos", array_keys($permisosUsuario));
		$this->_view->assign("usuario",$permisosUsuario);
		$this->_view->assign("role",$permisosRole);
		$this->_view->assign("datos",$this->_usuarios->getUsuario($id));
		$this->_view->renderizar("permisos","usuarios");
	}

}



?>
