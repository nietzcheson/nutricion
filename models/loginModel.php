<?php 

class loginModel extends Model{

	public function __construct(){
		parent::__construct();
	}

	public function getUsuario($usuario,$pass){
		$datos = $this->_db->query("SELECT * FROM usuarios WHERE usuario='$usuario' AND pass='".Hash::getHash("sha1",$pass,HASH_KEY)."' ");

		return $datos->fetch();
	}
}

?>