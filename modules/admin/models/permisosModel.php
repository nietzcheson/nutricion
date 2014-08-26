<?php

class permisosModel extends Model{

	public function __construct(){
		parent::__construct();
	}

	public function getPermisos(){
		$permisos = $this->_db->query("SELECT * FROM permisos ORDER BY permiso");

		return $permisos->fetchAll(PDO::FETCH_ASSOC);
	}
}