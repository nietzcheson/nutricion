<?php

class menuModelWidget extends Model{

	public function __construct(){
		parent::__construct();
	}

	public function getMenu(){
		$menu = array(
			array(
				"id"			=>		"empresas",
				"icono" 	=> 		"th-large",
				"titulo"	=>		"Empresas",
				"enlace"	=>		BASE_URL . "admin/empresas",
			),
			array(
				"id"			=>		"perfiles",
				"icono" 	=> 		"user",
				"titulo"	=>		"Perfiles",
				"enlace"	=>		BASE_URL . "admin/perfiles",
			),

			array(
				"id"			=>		"usuarios",
				"icono" 	=> 		"cog",
				"titulo"	=>		"Usuarios",
				"enlace"	=>		BASE_URL . "admin/usuarios",
			),




		);

		return $menu;
	}


}


?>
