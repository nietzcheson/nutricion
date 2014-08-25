<?php 

class registroController extends Controller{

	private $_registro;

	public function __construct(){
		parent::__construct();
		$this->_registro = $this->loadModel("registro");
	}

	public function index(){

		if(Session::get("autenticado")){
			$this->redireccionar();
		}

		

		if($this->getInt("enviar")==1){
			$this->_view->datos = $_POST;

			if(!$this->getSql("nombre")){
				$this->_view->_error = "Debe introduccir su nombre";
				$this->_view->renderizar("index","registro");
				exit;
			}

			if(!$this->getAlphaNum("usuario")){
				$this->_view->_error = "Debe introduccir su usuario";
				$this->_view->renderizar("index","registro");
				exit;
			}

			if($this->_registro->verificarUsuario($this->getAlphaNum("usuario"))){
				$this->_view->_error = "El usuario ".$this->getAlphaNum("usuario")." ya está registrado";
				$this->_view->renderizar("index","registro");
				exit;
			}

			if(!$this->validarEmail($this->getPostParam("email"))){
				$this->_view->_error = "La dirección de email es incorrecta";
				$this->_view->renderizar("index","registro");
				exit;
			}

			if(!$this->getSql("pass")){
				$this->_view->_error = "Debe introduccir su password";
				$this->_view->renderizar("index","registro");
				exit;
			}

			if($this->getPostParam("pass") != $this->getPostParam("confirmar")){
				$this->_view->_error = "Las contraseñas son distintas";
				$this->_view->renderizar("index","registro");
				exit;
			}

			$this->getLibrary("PHPMailer/PHPMailerAutoload");
			$mail = new PHPMailer();

			$this->_registro->registrarUsuario(
				$this->getSql("nombre"),
				$this->getAlphaNum("usuario"),
				$this->getSql("pass"),
				$this->getPostParam("email")
			);

			$usuario = $this->_registro->verificarUsuario($this->getAlphaNum("usuario"));



			if(!$usuario){
				$this->_view->_error = "Detectamos un error al registrar el usuario";
				$this->_view->renderizar("index","registro");
				exit;
			}

			$mail->From = "framework.artesan.us";
			$mail->FromName = "Registro en Artesanus";
			$mail->Subject = "Activación de cuenta de usuario";
			$mail->Body = "Hola<strong>".$this->getSql("nombre")."</strong>" . 
							"<p>Se ha registrado en www.framework.artesan.us " .
							"para activar su cuenta haga clic sobre el siguiente enlace:<br> ".
							"<a href='". BASE_URL."registro/activar/".$usuario['id']."/".$usuario['codigo']."'>Enlace</a></p>";
			$mail->AltBody = "Su servidor de correo no soporta html";
			$mail->AddAddress($this->getPostParam("email"));
			$mail->send();


			$this->_view->datos = false;
			$this->_view->_mensaje = "Registro completado. Revise su email para activar su cuenta";
		}

		$this->_view->assign("titulo","Registro");
		$this->_view->renderizar("index","registro");
	}

	public function activar($id,$codigo){
		if(!$this->filtrarInt($id) || !$this->filtrarInt($codigo)){
			$this->_view->_error = "Esta cuenta no existe";
			$this->_view->renderizar("activar","registro");
			exit;
		}

		$row = $this->_registro->getUsuario(
			$this->filtrarInt($id),
			$this->filtrarInt($codigo)
		);

		if(!$row){
			$this->_view->_error = "Esta cuenta no existe";
			$this->_view->renderizar("activar","registro");
			exit;
		}

		if($row['estado']==1){
			$this->_view->_error = "Esta cuenta ya está activada";
			$this->_view->renderizar("activar","registro");
			exit;
		}

		$this->_registro->activarUsuario(
			$this->filtrarInt($id),
			$this->filtrarInt($codigo)
		);

		if($row['estado']==0){
			$this->_view->_error = "Error al activar la cuenta. Por favor intente más tarde";
			$this->_view->renderizar("activar","registro");
			exit;
		}

		$this->_view->_mensaje = "Su cuenta ha sido activada";
		$this->_view->renderizar("activar","registro");


	}



}


?>