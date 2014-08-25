<?php 

class nombresModel extends Model{


	public function __construc(){
		parent::__construc();
	}

	public function getGeneros(){

		$generos = $this->_db->query("SELECT * FROM generos");
		return $generos->fetchAll();

	}
}


?>