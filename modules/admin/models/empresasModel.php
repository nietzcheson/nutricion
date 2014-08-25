<?php

class EmpresasModel extends Model{

  public function __construct(){
    parent::__construct();
  }

  public function crearEmpresa($datosEnviar){
    $this->insertarSQL($datosEnviar,"empresas");
  }

  public function getEmpresas(){
    $empresas = $this->_db->query("SELECT * FROM empresas");
    return $empresas->fetchAll();
  }

  public function getEmpresa($id){
    $empresas = $this->_db->query("SELECT * FROM empresas WHERE id='{$id}'");
    return $empresas->fetch();
  }

  public function actualizarEmpresa($datosEnviar){
    $this->actualizarSQL($datosEnviar,"empresas");
  }

  public function eliminarEmpresa($id){

    $id = (int) $id;

    $this->_db->query("DELETE FROM empresas WHERE id='{$id}'");
  }
}

?>
