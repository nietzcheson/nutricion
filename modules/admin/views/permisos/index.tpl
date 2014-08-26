<div class="bloque">
	{if is_array($permisos)}
	<table class="table table-condensed">
      	<thead>
        	<tr>
          		<th># ID</th>
          		<th>Permiso</th>
          		<th>Llave</th>
          		<th></th>
        	</tr>
      	</thead>
      	<tbody>
      		{foreach item=permiso from=$permisos}
	        <tr>
	          	<td>{$permiso.id_permiso}</td>
	          	<td>{$permiso.permiso}</td>
	          	<td>{$permiso.llave}</td>
	          	<td class="text-right">
	          		<a class="btn btn-default" href="{$_layoutParams.root}admin/permisos/editar/{$permiso.id_permiso}">
	          			<span class="glyphicon glyphicon-wrench"></span>
	          		</a>
	          	</td>
	        </tr>
	        {/foreach}
      	</tbody>
    </table>
    {/if}
</div>