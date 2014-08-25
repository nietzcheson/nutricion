<?php

class perfilModel extends Model{

  public function __construct(){
    parent::__construct();
  }

  public function getPerfil($id){
    $perfil = $this->_db->query("SELECT * FROM perfiles WHERE id='{$id}'");
    return $perfil->fetch();
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

  public function actualizarPerfil($datosEnviar){
    $this->actualizarSQL($datosEnviar,"perfiles");
  }

  public function getIdPerfil($id){
    $perfil = $this->_db->query("SELECT * FROM historiales WHERE id_perfil='{$id}'");
    return $perfil->fetch();
  }

  public function crearHistorial($id){
    $this->insertarSQL($id,"historiales");
  }

  public function actualizarHistorial($datosEnviar){
    $this->actualizarSQL($datosEnviar,"historiales");
  }

  public function getGruposSanguineos(){
    $grupos = $this->_db->query("SELECT * FROM grupos_sanguineos");
    return $grupos->fetchAll();
  }

  public function crearSesion($datosEnviar){
    $this->insertarSQL($datosEnviar,"sesiones");
  }

  public function getSesiones($id){
    $sesiones = $this->_db->query("SELECT * FROM sesiones WHERE id_perfil='{$id}'");
    return $sesiones->fetchAll();
  }

  public function getSesion($sesion){
    $sesion = $this->_db->query("SELECT * FROM sesiones WHERE id='{$sesion}'");
    return $sesion->fetch();
  }

  public function actualizarSesion($datosEnviar){
    $this->actualizarSQL($datosEnviar,"sesiones");
  }

  public function getDatosGraficas($id,$celda){
    $datos = $this->_db->query("SELECT $celda FROM sesiones WHERE id_perfil='{$id}'");
    return $datos->fetchAll();
  }

}
