<?php

//"alter table [tabla] add unique [celda]([celda],[celda])"
/*

	select r.role, p.permiso, pr.valor from roles r, permisos p, permisos_role pr where r.id_role = pr.role and p.id_permiso = pr.permiso;

*/

class ACL{

	private $registry;
	private $_db;
	private $_id;
	private $_role;
	private $_permisos;

	public function __construct($id = false){

		if($id){
			$this->_id = (int) $id;
		}else{
			if(Session::get("id_usuario")){
				$this->_id = Session::get("id_usuario");
			}else{
				$this->_id = 0;
			}
		}

		$this->_registry = registry::getInstancia();
		$this->_db = $this->_registry->_db;
		$this->_role = $this->getRole();
		$this->_permisos = $this->getPermisosRole();
		$this->compilarAcl();
	}

	public function compilarAcl(){
		$this->_permisos = array_merge(
			$this->_permisos,
			$this->getPermisosUsuario()
		);
	}

	public function getRole(){
		$role = $this->_db->query(
			"SELECT role from usuarios WHERE id = {$this->_id}"
		);

		$role = $role->fetch();
		return $role["role"];
	}

	public function getPermisosRoleId(){
		$ids = $this->_db->query(
			"SELECT permiso FROM permisos_role WHERE role='{$this->_role}'"
		);

		$ids = $ids->fetchAll(PDO::FETCH_ASSOC);
		$id = array();
		for($i=0;$i < count($ids);$i++){
			$id[] = $ids[$i]["permiso"];
		}

		return $id;
	}

	public function getPermisosRole(){

		$permisos = $this->_db->query(
			"SELECT * FROM permisos_role WHERE role='{$this->_role}'"
			);

		$permisos = $permisos->fetchAll(PDO::FETCH_ASSOC);
		$data = array();

		for($i=0; $i < count($permisos);$i++){
			$key = $this->getPermisoKey($permisos[$i]["permiso"]);

			if($key == ''){continue;}

			if($permisos[$i]["valor"] == 1){
				$v = true;
			}else{
				$v = false;
			}

			$data[$key] = array(
				"key"=> $key,
				"permiso" => $this->getPermisoNombre($permisos[$i]["permiso"]),
				"valor" => $v,
				"heredado" => true,
				"id" => $permisos[$i]["permiso"]
			);
		}

		return $data;
	}

	public function getPermisoKey($permisoID){
		$permisoID = (int) $permisoID;

		$key = $this->_db->query(
			"SELECT llave FROM permisos WHERE id_permiso = {$permisoID}"
		);

		$key = $key->fetch();

		return $key["llave"];
	}

	public function getPermisoNombre($permisoID){
		$permisoID = (int) $permisoID;

		$key = $this->_db->query(
			"SELECT permiso FROM permisos WHERE id_permiso = {$permisoID}"
		);

		$key = $key->fetch();

		return $key["permiso"];
	}

	public function getPermisosUsuario(){
		$ids = $this->getPermisosRoleId();

		if(count($ids)){
			$permisos = $this->_db->query(
			"SELECT * FROM permisos_usuario WHERE usuario = {$this->_id} AND permiso in(".implode(",",$ids).")"
			);

			$permisos = $permisos->fetchAll(PDO::FETCH_ASSOC);
		}else{
			$permisos = array();
		}


		$data = array();

		for($i=0; $i < count($permisos);$i++){
			$key = $this->getPermisoKey($permisos[$i]["permiso"]);

			if($key ==''){
				continue;
			}

			if($permisos[$i]["valor"] == 1){
				$v = true;
			}else{
				$v = false;
			}

			$data[$key] = array(
				"key"=> $key,
				"permiso" => $this->getPermisoNombre($permisos[$i]["permiso"]),
				"valor" => $v,
				"heredado" => false,
				"id" => $permisos[$i]["permiso"]
			);
		}

		return $data;
	}

	public function getPermisos(){
		if(isset($this->_permisos) && count($this->_permisos)){
			return $this->_permisos;
		}
	}

	public function permiso($key){
		if(array_key_exists($key,$this->_permisos)){
			if($this->_permisos[$key]["valor"] == true || $this->_permisos[$key]["valor"] == 1){
				return true;
			}else{
				return false;
			}
		}
		return true;
	}

	public function acceso($key){

		// if($this->permiso($key)){
		// 	Session::tiempo();
		// 	return;
		// }

		// header("location: " . BASE_URL . "error/access/5050");
		// exit;

		# Se modifica la funcion de acceso, sigue las siguientes reglas:
		# Si la llave no existe entonces se permite pasar el usuario
		# Si la llave existe, entonces verifica si el acceso es permitido o no,
		# restringuiendo el acceso y redireccionando a la ultima pagina cisitada.
		# para esto ultimo se combina con variables se sesion.
		# la last_url se carga justo antes de renderizar la vista.
		$acceso= $this->permiso($key);
	    if (!$acceso) {
	    	# Se obtiene la ruta que se intenta rendedizar y compararla con la anterior
	    	# De esta forma se evita el BUCLE
	    	$url = filter_input(INPUT_GET, "url",FILTER_SANITIZE_URL);
			$url = explode("/", $url);
			$url = array_filter($url);
			$url = implode("/",$url);
			$ruta = Session::get("last_url");
			if ($url!=$ruta) {
				header("location:" . BASE_URL . Session::get("last_url"));
			}
			
	    }
	    return $this->getRole();
	}

}

?>
