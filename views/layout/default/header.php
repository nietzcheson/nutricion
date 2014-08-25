<!DOCTYPE html>
<?php ob_start();?>
<html>
	<head>
		<meta charset="UTF-8">
		<title><?php if(isset($this->titulo))echo $this->titulo;?></title>
		<link rel="stylesheet" href="<?php echo $layoutParams['ruta_bootstrap']?>css/bootstrap.css"/>
		<link rel="stylesheet" href="<?php echo $layoutParams['ruta_css']?>estilos.css"/>
		<!--<script src="<?php echo $layoutParams['ruta_js']?>jQuery.js"></script>-->
		<script src="<?php echo BASE_URL?>public/js/jQuery.js"></script>
		<script src="<?php echo BASE_URL?>public/js/jquery.validate.js"></script>
		<script src="<?php echo $layoutParams['ruta_bootstrap']?>js/bootstrap.min.js"/></script>
		<script src="<?php echo $layoutParams['ruta_js']?>funciones.js"></script>

		<?php if(isset($layoutParams["js"]) && count(is_array($layoutParams["js"]))): ?>
			<?php for($i=0; $i < count($layoutParams["js"]); $i++):?>
				<script src="<?php echo $layoutParams['js'][$i];?>"></script>
			<?php endfor;?>
		<?php endif;?>
	</head>
	<body>
		<noscript>
			Esta aplicación funcionará mucho mejor usando Javascript
		</noscript>
		
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<?php if(isset($this->_error)):?>
				<div class="alert alert-danger alert-dismissable">
				  	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				  	<strong><?php echo $this->_error;?>!</strong>
				</div>
			<?php endif;?>
			<?php if(isset($this->_mensaje)):?>
				<div class="alert alert-info alert-dismissable">
				  	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				  	<strong><?php echo $this->_mensaje;?>!</strong>
				</div>
			<?php endif;?>
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="<?php echo BASE_URL?>"><?php echo APP_NAME;?></a>
		      <p class="navbar-text">Signed in as Mark Otto</p>
		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <!--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="#">Link</a></li>
		        <li><a href="#">Link</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		            <li class="divider"></li>
		            <li><a href="#">One more separated link</a></li>
		          </ul>
		        </li>
		      </ul>
		      <form class="navbar-form navbar-left" role="search">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="Search">
		        </div>
		        <button type="submit" class="btn btn-default">Submit</button>
		      </form>-->
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="#">Link</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		          </ul>
		        </li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>

		<section>
			<div id="wrap-contenedor">
				<div id="contenedor">
					<nav id="nav-menu">
						<?php if(isset($layoutParams["menu"]) && count($layoutParams["menu"])):?>
							<ul class="list-group">
								<?php foreach($layoutParams["menu"] as $menu):?>

								<?php 
									if($item && $menu['id'] == $item ){
			                            $_item_style = 'active'; 
			                            } else {
			                            $_item_style = '';
			                        }
								?>

							      <a href="<?=$menu['enlace']?>" class="list-group-item <?php echo $_item_style;?>">
							      	<span class="glyphicon glyphicon-<?php if(isset($menu["icono"])) echo $menu["icono"]?>"> <?=$menu["titulo"]?></span>
							      </a>
							  	<?php endforeach;?>
	    					</ul>
    					<?php endif;?>
					</nav>

					<div class="panel panel-default wrap-contenido">



