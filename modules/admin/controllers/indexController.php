<?php

class indexController extends adminController{

  private $_usuarios;

  public function __construct(){
    parent::__construct();

    if(!Session::get("autenticado")){$this->redireccionar("login");}

    $this->_usuarios = $this->loadModel("index");

  }

  public function index(){
    $this->_view->assign("titulo","Usuarios");
    $this->_view->assign("usuarios",$this->_usuarios->getUsuarios());
    $this->_view->renderizar("index");
  }

}
