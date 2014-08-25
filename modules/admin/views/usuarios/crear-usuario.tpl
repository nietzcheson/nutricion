<form role="form" method="POST" action="">
	<input type="hidden" name="crear" value="1"/>
	<div class="form-group col-md-6">
		<label for="role">Role</label>
		<select class="form-control input-lg" id="role" name="role">
			<option value="x">Seleccione</option>
			{if isset($roles) && count($roles)>0}
				{foreach from=$roles item=role}
					<option {if isset($datos.role)}{if $datos.role==$role.id_role}selected{/if}{/if} value="{$role.id_role}">{$role.role}</option>
				{/foreach}
			{/if}
		</select>
	</div>
	<div class="form-group col-md-6">
		<label for="nombre_usuario">Nombre usuario</label>
		<input type="text" class="form-control input-lg" id="nombre_usuario" placeholder="Nombre usuario" name="nombre_usuario" value="{if isset($datos.nombre_usuario)}{$datos.nombre_usuario}{/if}">
	</div>
	<div class="form-group col-md-6">
		<label for="usuario">Usuario</label>
		<input type="text" class="form-control input-lg" id="usuario" placeholder="Usuario" name="usuario" value="{if isset($datos.usuario)}{$datos.usuario}{/if}">
	</div>
	<div class="form-group col-md-6">
		<label for="email">Email</label>
		<input type="text" class="form-control input-lg" id="email" placeholder="Email" name="email" value="{if isset($datos.email)}{$datos.email}{/if}">
	</div>
	<div class="form-group col-md-6">
		<label for="pass">Passw</label>
		<input type="text" class="form-control input-lg" id="pass" placeholder="Passw" name="passw" value="{if isset($datos.passw)}{$datos.passw}{/if}">
	</div>
	<div class="form-group col-md-6">
		<label for="r_passw">Repetir passw</label>
		<input type="text" class="form-control input-lg" id="r_passw" placeholder="Repetir passw" name="r_passw" value="{if isset($datos.r_passw)}{$datos.r_passw}{/if}">
	</div>
	<button type="submit" class="btn btn-success btn-lg">Crear usuario</button>
</form>
