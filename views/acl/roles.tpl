<div class="jumbotron">
  <h1>{$titulo}</h1>
  <!--<p>Un texto acá</p>
  <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>-->
<a class="btn btn-default" href="{$_layoutParams.root}acl/">Regresar</a>
</div>

<div class="bloque">
	{if isset($roles) && count($roles)}
	<table class="table table-bordered">
      	<thead>
        	<tr>
          		<th># ID</th>
          		<th>Role</th>
          		<th></th>
          		<th></th>
        	</tr>
      	</thead>
      	<tbody>
      		{foreach item=role from=$roles}
	        <tr>
	          	<td>{$role.id_role}</td>
	          	<td>{$role.role}</td>
	          	<td class="text-center">

	          		<a class="btn btn-warning" href="{$_layoutParams.root}acl/permisos_role/{$role.id_role}">
	          			<span class="glyphicon glyphicon-wrench"></span>
	          		</a>
	          	</td>
	          	<td></td>
	        </tr>
	        {/foreach}
      	</tbody>
    </table>
    {/if}
</div>