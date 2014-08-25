<?php 

class registroModel extends Model{

	public function __construct(){
		parent::__construct();
	}

	public function verificarUsuario($usuario){
		$id = $this->_db->query("select id,codigo from usuarios where usuario='$usuario'");

		if($id->fetch()){
			return true;
		}

		return false;
	}

	public function verificarEmail($email){
		$id = $this->_db->query("select id from usuarios where email='$email'");

		if($id->fetch()){
			return true;
		}

		return false;
	}

	public function registrarUsuario($nombre,$usuario,$pass,$email){

		$random = rand(1782598471,9999999999);
		$this->_db->prepare("INSERT INTO usuarios values(null,:nombre,:usuario,:pass,:email,'usuario', 0,now(),:codigo)")
		->execute(array(
			':nombre' => $nombre, 
			':usuario' => $usuario,
			':pass' => Hash::getHash("sha1",$pass, HASH_KEY),
			':email' => $email,
			':codigo' => $random
		));
	}

	public function getUsuario($id,$codigo){
		$usuario = $this->_db->query("SELECT * FROM usuarios WHERE id= '$id' AND codigo='$codigo' ");
		return $usuario->fetch();
	}

	public function activarUsuario($id,$codigo){
		$this->_db->query("UPDATE usuario SET estado=1 WHERE id='$id' AND codigo='$codigo' " );
	}

}


?>