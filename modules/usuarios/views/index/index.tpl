<div class="jumbotron">
  <h1>{$titulo}</h1>
  <!--<p>Un texto acá</p>
  <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>-->
  <a class="btn btn-success"href="{$_layoutParams.root}usuarios/roles">Roles</a>
  <a class="btn btn-success"href="{$_layoutParams.root}acl/permisos">Permisos</a>
</div>

<div class="bloque">
	{if isset($usuarios) && count($usuarios)}
	<table class="table table-bordered">
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
	          	<td class="text-center">

	          		<a class="btn btn-warning" href="{$_layoutParams.root}usuarios/permisos/{$usuario.id}">
	          			<span class="glyphicon glyphicon-wrench"></span>
	          		</a>
	          	</td>
	        </tr>
	        {/foreach}
      	</tbody>
    </table>
    {/if}
</div>