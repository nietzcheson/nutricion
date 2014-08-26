<?php


require_once ROOT . "libs" . DS . "Smarty" . DS . "libs" . DS . "Smarty.class.php";

class View extends Smarty{

	private $_request;
	private $_js;
	private $_css;
	private $_acl;
	private $_rutas;
	private $_jsPlugin;
	private $_template;
	private $_item;


	public function __construct(Request $peticion, ACL $_acl){
		parent::__construct();
		$this->_request = $peticion;
		$this->_js = array();
		$this->_css = array();
		$this->_acl = $_acl;
		$this->_rutas = array();
		$this->_jsPlugin = array();
		$this->_template = DEFAULT_LAYOUT;
		$this->_item = "";

		$modulo = $this->_request->getModulo();
		$controlador = $this->_request->getControlador();

		if($modulo){
			$this->_rutas["view"] = ROOT . "modules" . DS . $modulo . DS . "views" . DS . $controlador . DS;
			$this->_rutas["js"] = BASE_URL . "modules/" .$modulo . "/views/" .$controlador . "/js/";
			$this->_rutas["css"] = BASE_URL . "modules/" .$modulo . "/views/" .$controlador . "/css/";
		}else{
			$this->_rutas["view"] = ROOT . "views" . DS . $controlador . DS;
			$this->_rutas["js"] = BASE_URL . "views/" .$controlador . "/js/";
			$this->_rutas["css"] = BASE_URL . "views/" .$controlador . "/css/";
		}
	}



	public function renderizar($vista,$item=false, $noLayout = false){

		if($item!=false){
				define("ID_ITEM",$item);
			}else{
				define("ID_ITEM","");
			}


		if($item){
			$this->_item = $item;
		}

		$this->template_dir = ROOT . "views" . DS . "layout" 	. DS . $this->_template . DS;
		$this->config_dir 	= ROOT . "views" . DS . "layout" 	. DS . $this->_template . DS . "configs" . DS;
		$this->cache_dir 	= ROOT . "tmp" 	 . DS . "cache" 	. DS;
		$this->compile_dir 	= ROOT . "tmp"   . DS . "template"  . DS;

		$js = array();

		if(count($this->_js)){
			$js = $this->_js;
		}

		$css = array();

		if(count($this->_css)){
			$css = $this->_css;
		}

		$_params = array(
			"ruta_css"			=>		BASE_URL . "views/layout/" . $this->_template . "/css/",
			"ruta_img"			=>		BASE_URL . "views/layout/" . $this->_template . "/img/",
			"ruta_js"			=>		BASE_URL . "views/layout/" . $this->_template . "/js/",
			"ruta_bootstrap"	=>		BASE_URL . "public/bootstrap/",
			"js"				=>		$js,
			"css"			=>			$css,
			//"menu"				=>		$menu,
			"item"				=>		$this->_item,
			"root"				=>		BASE_URL,
			"configs" 			=>		array(
											"app_name" 		=> 		APP_NAME,
											"app_slogan" 	=> 		APP_SLOGAN,
											"app_company" 	=> 		APP_COMPANY,
											"app_logo" => BASE_URL . "public/img/logo-main.png",
										)
		);

		// echo "<pre>";print_r($this->_rutas);
		// exit;

		if(is_readable($this->_rutas["view"] . $vista . ".tpl")){

			if($noLayout){
				$this->template_dir = $this->_rutas["view"];
				$this->display($this->_rutas["view"] . $vista . ".tpl");
				exit;
			}
			$this->assign("_contenido",$this->_rutas["view"] . $vista . ".tpl");
		}else{
			throw new Exception("Error de vista");
		}

		$this->assign("widgets",$this->getWidgets());
		$this->assign("_acl",$this->_acl);
		$this->assign("_layoutParams",$_params);

		# Almacenar en seccion la ultima vista visitada con sus respectivos argumentos
		$url = filter_input(INPUT_GET, "url",FILTER_SANITIZE_URL);
		$url = explode("/", $url);
		$url = array_filter($url);
		$url = implode("/",$url);
		Session::set("last_url",$url);
		
		$this->display('template.tpl');
	}

	public function setJS(array $js){

		if(is_array($js) && count($js)){
			for($i=0;$i<count($js); $i++){
				$this->_js[] = $this->_rutas["js"] . $js[$i].".js";
			}
		}else{
			throw new Exception("Error de jQuery");

		}

	}

	public function setCss (array $css){

			if (is_array($css) && count($css)){
				for ($i=0; $i < count($css); $i++) {
					$this->_css[] = $this->_rutas["css"] . $css[$i].".css";
				}
			}else{
				throw new Exception("Error de css");
			}
		}

	public function setJsPlugin(array $js){

		if(is_array($js) && count($js)){
			for($i=0;$i<count($js); $i++){
				$this->_jsPlugin[] = BASE_URL . "public/js/" . $js[$i] . ".js";
			}
		}else{
			throw new Exception("Error de plugin jQuery");

		}

	}

	public function setTemplate($template){
		$this->_template = (string) $template;
	}

	public function widget($widget,$method,$options = array()){
		if(!is_array($options)){
			$options = array($options);
		}

		if(is_readable(ROOT . "widgets" . DS . $widget . ".php")){
			include_once ROOT . "widgets" . DS . $widget . ".php";

			$widgetClass = $widget . "Widget";

			if(!class_exists($widgetClass)){
				throw new Exception("Error clase widget", 1);
			}

			if(is_callable($widgetClass,$method)){
				if(count($options)){
					return call_user_func_array(array(new $widgetClass), $method, $options);
				}else{
					return call_user_func(array(new $widgetClass, $method));
				}
			}

			throw new Exception("Error del metodo widget", 1);

		}

		throw new Exception("Error en el Widget", 1);

	}

	public function getLayoutPositions(){
		if(is_readable(ROOT . "views" . DS . "layout" . DS . $this->_template . DS . "configs.php")){
			include_once ROOT . "views" . DS . "layout" . DS . $this->_template . DS . "configs.php";

			return get_layout_positions();
		}

		throw new Exception("Error configuración de Layout");

	}

	public function getWidgets(){
		$widgets = array(
			"menu-sidebar" => array(
				"config" =>$this->widget("menu","getConfig"),
				"content" => array("menu","getMenu")
			),
		);

		$positions = $this->getLayoutPositions();
		$keys = array_keys($widgets);

		foreach($keys as $k){
			if(isset($positions[$widgets[$k]['config']['position']])){
				if(!isset($widgets[$k]["config"]["hide"]) || !in_array($this->_item, $widgets[$k]["config"]["hide"])){
					if($widgets[$k]["config"]["show"] === "all" || in_array($this->_item, $widgets[$k]["config"]["show"])){
						$positions[$widgets[$k]["config"]["position"]][] = $this->getWidgetContent($widgets[$k]["content"]);
					}
				}
			}
		}

		return $positions;
	}

	public function getWidgetContent(array $content){
		if(!isset($content[0]) || !isset($content[1])){
			throw new Exception("Error contenido Widget");
			return;
		}

		if(!isset($content[2])){
			$content[2] = array();
		}

		return $this->widget($content[0],$content[1],$content[2]);
	}

}



?>
