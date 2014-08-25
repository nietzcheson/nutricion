	{if isset($roles) && count($roles)}
	<table class="table table-condensed">
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
	          	<td class="text-right">

	          		<a class="btn btn-default" href="{$_layoutParams.root}admin/roles/permisos_role/{$role.id_role}">
	          			<span class="glyphicon glyphicon-wrench"></span>
	          		</a>
	          	</td>
	          	<td></td>
	        </tr>
	        {/foreach}
      	</tbody>
    </table>
    {/if}
