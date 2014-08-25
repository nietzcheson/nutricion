

	<form method="POST" action="" name="acl">
		<input type="hidden" name="guardar" value="1"/>
		{if isset($permisos) && count($permisos)}
		<table class="table table-condensed">
	      	<thead>
	        	<tr>
	          		<th>Permiso</th>
	          		<th class="text-center">Habilitado</th>
	          		<th class="text-center">Denegado</th>
	          		<th class="text-center">Ignorar</th>
	        	</tr>
	      	</thead>
	      	<tbody>
	      		{foreach item=permiso from=$permisos}
		        <tr>
		          	<td>{$permiso.nombre}</td>
		          	<td class="text-center">
		          		<input type="radio" name="perm_{$permiso.id}" value="1" {if $permiso.valor == 1}checked{/if}/>
		          	</td>
		          	<td class="text-center">
		          		<input type="radio" name="perm_{$permiso.id}" value="" {if $permiso.valor == ""}checked{/if}/>
		          	</td>
		          	<td class="text-center">
		          		<input type="radio" name="perm_{$permiso.id}" value="x" {if $permiso.valor === "x"}checked{/if}/>
		          	</td>
		        </tr>
		        {/foreach}
	      	</tbody>
	    </table>
		{/if}

		<input class="btn btn-success" type="submit" value="Guardar"/>

	</form>
