<div class="bloque">
	<form role="form" method="POST" action="">
		<input type="hidden" name="crear" value="1"/>
		<div class="form-group col-md-6">
			<label for="permiso">Permiso</label>
			<input type="text" class="form-control" id="permiso" name="permiso" value="{$datos.permiso|default:''}">
		</div>
		<div class="form-group col-md-6">
			<label for="llave">Llave</label>
			<input type="text" class="form-control" id="llave" name="llave" value="{$datos.llave|default:''}">
		</div>
		<button type="submit" class="btn btn-success">Crear permiso</button>
	</form>
</div>