<div class="bloque">
	{if isset($usuarios) && count($usuarios)}
	<table class="table table-condensed">
      	<thead>
        	<tr>
          		<th># ID</th>
          		<th>Usuario</th>
          		<th>Role</th>
          		<th></th>
        	</tr>
      	</thead>
      	<tbody>
      		{foreach item=usuario from=$usuarios}
	        <tr>
	          	<td>{$usuario.id}</td>
	          	<td>{$usuario.usuario}</td>
	          	<td>{$usuario.role}</td>
	          	<td class="text-right">
	          		<a class="btn btn-default" href="{$_layoutParams.root}admin/usuarios/permisos/{$usuario.id}">
	          			<span class="glyphicon glyphicon-wrench"></span> Permisos de usuario
	          		</a>
	          	</td>
	        </tr>
	        {/foreach}
      	</tbody>
    </table>
    {/if}
</div>
