<?php

class perfilesModel extends Model{

  public function __construct(){
    parent::__construct();
  }

  public function crearPerfil($datosEnviar){
    $this->insertarSQL($datosEnviar,"perfiles");
  }

  public function getFrecuencias(){
    $frecuencias = $this->_db->query("SELECT * FROM frecuencias");
    return $frecuencias->fetchAll();
  }

  public function getTiposPerfil(){
    $frecuencias = $this->_db->query("SELECT * FROM tipos_perfil");
    return $frecuencias->fetchAll();
  }

  public function getEmpresas(){
    $empresas = $this->_db->query("SELECT * FROM empresas");
    return $empresas->fetchAll();
  }

  public function getPerfiles(){
    $perfiles = $this->_db->query("SELECT * FROM perfiles");
    return $perfiles->fetchAll();
  }
}
