
<div class="bloque">
	<form id="form1" method="POST" action="{$_layoutParams.root}login" class="form">
		<input type="hidden" name="enviar" value="1">
		<fieldset>
			<div class="form-group">
			    <label for="titulo">Usuario:</label>
			    <input type="text" class="form-control input-lg" id="usuario" placeholder="Usuario" name="usuario" value="{if isset($post.usuario)}{$post.usuario}{/if}">
			 </div>
			 <div class="form-group">
			    <label for="pass">Contraseña:</label>
			    <input type="password" class="form-control input-lg" id="pass" placeholder="Contraseña" name="pass" value="{if isset($post.pass)}{$post.pass}{/if}">
			 </div>
			  <input type="submit" value="Entrar" class="btn btn-primary">

		</fieldset>
	</form>

</div>
