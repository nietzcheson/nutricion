<?php 

class nombresController extends Controller{


	private $_nombres;
	public function __construct(){
		parent::__construct();
		$this->_nombres = $this->loadModel("nombres");
	}

	public function index(){

		$this->_view->assign("titulo","Nombres");
		$this->_view->setJs(array("nombres"));
		$this->_view->assign("generos",$this->_nombres->getGeneros());
		$this->_view->renderizar("index");
	}

}


?>