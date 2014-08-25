<div class="jumbotron">
  <h1>{$titulo}</h1>
  <!--<p>Un texto acá</p>
  <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>-->
</div>

<div class="bloque">

	<form id="form1" method="POST" action="" class="form">
		<input type="hidden" name="enviar" value="1">
		<fieldset>
			<div class="form-group">
			    <label for="nombre">Nombre:</label>
			    <input type="text" class="form-control" id="nombre" placeholder="Nombre" name="nombre" value="<?php if(isset($this->datos['nombre'])) echo $this->datos['nombre'];?>">
			</div>
			<div class="form-group">
			    <label for="titulo">Usuario:</label>
			    <input type="text" class="form-control" id="usuario" placeholder="Usuario" name="usuario" value="<?php if(isset($this->datos['usuario'])) echo $this->datos['usuario'];?>">
			</div>
			<div class="form-group">
			    <label for="email">Email:</label>
			    <input type="text" class="form-control" id="email" placeholder="E-Mail" name="email" value="<?php if(isset($this->datos['email'])) echo $this->datos['email'];?>">
			</div>
			<div class="form-group">
			    <label for="pass">Contraseña:</label>
			    <input type="password" class="form-control" id="pass" placeholder="Contraseña" name="pass" value="<?php if(isset($this->datos['pass'])) echo $this->datos['pass'];?>">
			</div>
			<div class="form-group">
			    <label for="confirmar">Confirmar contraseña:</label>
			    <input type="password" class="form-control" id="confirmar" placeholder="Confirmar" name="confirmar" value="<?php if(isset($this->datos['confirmar'])) echo $this->datos['confirmar'];?>">
			</div>
			<input type="submit" value="Registrar" class="btn btn-primary">

		</fieldset>		
	</form>

</div>