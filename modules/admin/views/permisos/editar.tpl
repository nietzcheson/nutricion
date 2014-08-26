<div class="bloque">
	{if is_array($permiso)}
		<form role="form" method="POST" action="">
			<input type="hidden" name="modificar" value="1"/>
			<div class="form-group col-md-6">
				<label for="permiso">Permiso</label>
				<input type="text" class="form-control" id="permiso" name="permiso" value="{$permiso.permiso}">
			</div>
			<div class="form-group col-md-6">
				<label for="llave">Llave</label>
				<input type="text" class="form-control" id="llave" name="llave" value="{$permiso.llave}">
			</div>
			<button type="submit" class="btn btn-success">Modificar permiso</button>
		</form>
    {/if}
</div>