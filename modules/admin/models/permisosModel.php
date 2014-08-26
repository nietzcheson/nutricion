<?php

class permisosModel extends Model{

	public function __construct(){
		parent::__construct();
	}

	public function getPermisos(){
		$permisos = $this->_db->query("SELECT * FROM permisos ORDER BY permiso");

		return $permisos->fetchAll(PDO::FETCH_ASSOC);
	}
	public function getPermiso($id_permiso){
		$permisos = $this->_db->query("SELECT * FROM permisos WHERE id_permiso = '$id_permiso'");
		return $permisos->fetch();
	}
	public function actualizarPermiso($datos){
		$this->actualizarSQL($datos,"permisos");
	}
	public function crearPermiso($datos){
		$this->insertarSQL($datos,"permisos");
	}
}