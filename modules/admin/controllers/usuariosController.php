<?php

class usuariosController extends adminController{

	private $_usuarios;

	public function __construct(){
		parent::__construct();
		$this->_usuarios = $this->loadModel("usuarios");

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

	public function crear(){
		$this->_view->assign("titulo","Crear usuario");
		$btnHeader = array(
			array(
				"titulo" => "return",
				"enlace" => "admin/usuarios"
			),

		);

		$this->_view->assign("btnHeader",$btnHeader);

		$this->_view->assign("roles",$this->_usuarios->getRoles());


		if($this->getInt("crear")==1){



			$this->_view->assign("datos",$_POST);
			$role = $this->getSql("role");
			$estado = $this->getInt("estado");
			$nombre_usuario = $this->getSql("nombre_usuario");
			$usuario = $this->getTexto("usuario");
			$email = $this->getTexto("email");
			$passw = $this->getSql("passw");
			$r_passw = $this->getSql("r_passw");

			$errores="";
				if ($role=="x") {
					$errores.="Debe seleccionar el role<br>";
				}
				if ($nombre_usuario=="") {
					$errores.="El Nombre Usuario está vacío<br>";
				}
				if ($usuario=="") {
					$errores.="El Usuario está vacío<br>";
				}
				if ($email=="") {
					$errores.="El Email está vacío<br>";
				}

				$emails = $this->_usuarios->getEmails();
				$mailExiste = 0;
				foreach($emails as $mail){
					if($mail["email"]==$email){
						$mailExiste = 1;
					}

				}

				if ($mailExiste==1) {
					$errores.="El Mail ".$email." ya existe. Debe usar otro correo electrónico para crear esta cuenta<br/>";
				}

				if ($passw=="") {
					$errores.="El Password está vacío<br>";
				}else{
					if($r_passw==""){
						$errores.="El Repetir Password está vacío<br>";
					}else{
						if($passw != $r_passw){
							$errores.="Los password no son iguales<br>";
						}
					}
				}

				if ($errores!="") {
					$this->_view->assign("_error",$errores);
					$this->_view->renderizar('crear-usuario',"empresas");
					exit;
				}

				$random = rand(1782598471,9999999999);
				$datosEnviar = array(
					"nombre"         =>$nombre_usuario,
					"usuario"        =>$usuario,
					"pass"       		=>Hash::getHash("sha1",$passw, HASH_KEY),
					"email"      		=>$email,
					"estado"  			 =>1,
					"codigo" 			  =>$random
				);

				$this->_usuarios->crearUsuario($datosEnviar);
				$this->_view->assign("_mensaje","El usuario ha sido creado");
				$this->_view->assign("datos",$_POST="");
				$this->_view->renderizar("crear-usuario","empresas");
				exit();

		}



		$this->_view->renderizar("crear-usuario","usuarios");
	}

}



?>
