<?php

class ajaxModel extends Model{

	public function __construct(){
		parent::__construct();
	}

	public function getPaises(){
		$paises = $this->_db->query("SELECT * FROM paises");

		return $paises->fetchAll();
	}

	public function getCiudades($pais){
		$ciudades = $this->_db->query("SELECT * FROM ciudades WHERE pais='{$pais}' ORDER BY ciudad ASC");

		$ciudades->setFetchMode(PDO::FETCH_ASSOC);
		return $ciudades->fetchAll();
	}

	public function insertarCiudad($ciudad,$pais){
		$this->_db->query("INSERT INTO ciudades values(null,'{$ciudad}','{$pais}')");
	}

	public function getUsuario($id){
		$ciudades = $this->_db->query("SELECT * FROM usuarios WHERE id={$id}");
	}

}



?>
