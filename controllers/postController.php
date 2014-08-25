<?php 

class postController extends Controller{

	private $_posts;

	public function __construct(){
		parent::__construct();
		$this->_posts = $this->loadModel("post");
	}

	public function index($pagina = false){


		/*for($i=0;$i<300;$i++){
			$model = $this->loadModel("post");

			$model->insertarPost(
				"titulo" . $i,
				"cuerpo" . $i,
				"imagen" . "upl_535c569432569.png"
			);
		}*/

		if(!$this->filtrarInt($pagina)){
			$pagina = false;
		}else{
			$pagina = (int) $pagina;
		}

		$this->getLibrary("class.paginador");
		$paginador = new Paginador();
		$this->_view->setJS(array("prueba"));
		$this->_view->assign("posts",$paginador->paginar($this->_posts->getPosts(),$pagina));
		$this->_view->assign("paginacion",$paginador->getView("prueba","post/index"));
		$this->_view->assign("titulo","Posts");
		$this->_view->renderizar("index","post");
	}

	public function nuevo(){

		//Para restringir el acceso
		//Session::accesoEstricto(array("usuario"));

		$this->_acl->acceso("nuevo_post");
		$this->_view->assign("titulo","Nuevo Post");

		$this->_view->setJS(array('nuevo'));
		if($this->getInt("guardar") == 1){

			$this->_view->assign("post",$_POST);

			if(!$this->getTexto("titulo")){
				$this->_view->assign("_error","Debe introduccir el título del post");
				$this->_view->renderizar("nuevo","post");
				exit;
			}

			if(!$this->getTexto("cuerpo")){
				$this->_view->assign("_error","Debe introduccir el cuerpo del post");
				$this->_view->renderizar("nuevo","post");
				exit;
			}

			$imagen = "";

			if(isset($_FILES["imagen"]["name"])){
				$this->getLibrary("UpLoad". DS ."class.upload");
				$ruta = ROOT . "public" . DS . "img". DS . "post" . DS;

				$upload = new upload($_FILES["imagen"],"fr_FR");
				$upload->allowed = array("image/*");
				$upload->file_new_name_body = "upl_".uniqid();
				$upload->process($ruta);

				echo "Hasta acá";
				if($upload->processed){
					$imagen = $upload->file_dst_name;
					$thumb = new upload($upload->file_dst_pathname);
					$thumb->image_resize = true;
					$thumb->image_x = 100;
					$thumb->image_y = 70;
					$thumb->file_name_body_pre = "thumb_";
					$thumb->process($ruta . "thumb" . DS);
				}else{
					$this->_view->assign("_error",$upload->error);
					$this->_view->renderizar("nuevo","post");
					exit;
				}
			}

			$this->_posts->insertarPost(
				$this->getPostParam("titulo"),
				$this->getPostParam("cuerpo"),
				$imagen
			);

			$this->redireccionar("post");
		}

		$this->_view->renderizar("nuevo","post");
	}

	public function editar($id){

		$this->_acl->acceso("editar_post");

		if(!$this->filtrarInt($id)){
			$this->redireccionar("post");
		}

		if(!$this->_posts->getPost($this->filtrarInt($id))){
			$this->redireccionar("post");
		}

		$this->_view->titulo = "Editar POST";
		$this->_view->setJS(array("nuevo"));

		if($this->getInt("guardar") == 1){

			$this->_view->datos = $_POST;

			if(!$this->getTexto("titulo")){
				$this->_view->_error = "Debe introduccir el título del post";
				$this->_view->renderizar("editar","post");
				exit;
			}

			if(!$this->getTexto("cuerpo")){
				$this->_view->_error = "Debe introduccir el cuerpo del post";
				$this->_view->renderizar("editar","post");
				exit;
			}

			$this->_posts->editarPost(
				$this->filtrarInt($id),
				$this->getTexto("titulo"),
				$this->getTexto("cuerpo")
			);

			$this->redireccionar("post");
		}

		$this->_view->datos = $this->_posts->getPost($this->filtrarInt($id));
		$this->_view->renderizar("editar","post");

	}

	public function eliminar($id){

		//Para restringir el acceso
		Session::acceso("admin");

		if(!$this->filtrarInt($id)){
			$this->redireccionar("post");
		}

		if(!$this->_posts->getPost($this->filtrarInt($id))){
			$this->redireccionar("post");
		}

		$this->_posts->eliminarPost($this->filtrarInt($id));

		$this->redireccionar("post");
	}

	public function prueba(){
        /*
        for($i = 0; $i < 300; $i++){
            $model = $this->loadModel('post');
            $model->insertarPrueba('nombre ' . $i);
        }
        */
        
    	$this->getLibrary('class.paginador');
		$paginador = new Paginador();
			
        $this->_view->setJs(array('prueba'));
        $this->_view->assign('posts', $paginador->paginar($this->_posts->getPosts()));
		$this->_view->assign('paginacion', $paginador->getView('paginacion_ajax'));
        $this->_view->assign('titulo', 'Post');
        $this->_view->renderizar('prueba', 'prueba');
   }

	public function pruebaAjax(){

		$pagina = $this->getInt("pagina");
		$this->getLibrary("paginador");
		$paginador = new Paginador();
		$this->_view->setJS(array("prueba"));
		$this->_view->assign("posts",$paginador->paginar($this->_posts->getPosts(),$pagina));
		$this->_view->assign("paginacion",$paginador->getView("paginacion_ajax"));
		$this->_view->renderizar("ajax/prueba",false,true);
	}

}


?>