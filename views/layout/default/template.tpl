<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>{$titulo|default:"Sin título"}</title>
		<link rel="stylesheet" href="{$_layoutParams.ruta_bootstrap}css/bootstrap.css"/>
		<link rel="stylesheet" href="{$_layoutParams.ruta_css}estilos.css"/>
		<!--<script src="<?php echo $_layoutParams['ruta_js']?>jQuery.js"></script>-->
	</head>
	<body>
		<noscript>
			Esta aplicación funcionará mucho mejor usando Javascript
		</noscript>

		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			{if isset($_error)}
				<div class="alert alert-danger alert-dismissable">
				  	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				  	<strong>{$_error}!</strong>
				</div>
			{/if}
			{if isset($_mensaje)}
				<div class="alert alert-info alert-dismissable">
				  	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				  	<strong><?php echo $this->_mensaje;?>!</strong>
				</div>
			{/if}
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="{$_layoutParams.root}">{$_layoutParams.configs.app_name}</a>
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
					{if isset($widgets.sidebar)}
						{foreach item=sidebar from=$widgets.sidebar}
							{$sidebar}
						{/foreach}
					{/if}

					<div class="panel panel-default wrap-contenido">
						{include file=$_contenido}
					</div>
				</div>
			</div>
		</section>

		<footer>
			<div id="wrap-footer">
				<div class="contenido-footer">
					Copyright &copy <a href="https://www.artesan.us" target="_blank">{$_layoutParams.configs.app_company}</a>
				</div>
			</div>
		</footer>
		<script src="{$_layoutParams.root}public/js/jQuery.js"></script>
		<script src="{$_layoutParams.root}public/js/jquery.validate.js"></script>
		<script src="{$_layoutParams.ruta_bootstrap}js/bootstrap.min.js"/></script>
		<script src="{$_layoutParams.ruta_js}funciones.js"></script>
		<script type="text/javascript">
			var _root_ = '{$_layoutParams.root}';
		</script>

		{if isset($_layoutParams.js) && count($_layoutParams.js)}
			{foreach item=js from=$_layoutParams.js}
				<script src="{$js}"></script>
			{/foreach}
		{/if}
	</body>
</html>
