<div class="jumbotron">
  <h1>{$titulo}</h1>
  <!--<p>Un texto acá</p>
  <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>-->
  {if $_acl->permiso("nuevo_post")}
  <a class="btn btn-success"href="{$_layoutParams.root}post/nuevo">Nuevo post</a>
  {/if}
</div>

<div class="bloque">
<div id="lista_registros">


{if isset($posts) && count($posts)}
	<table class="table">
		<thead>
			<tr>
				<th class="col-md-2">Título</th>
				<th class="col-md-4">Cuerpo</th>
				<th class="col-md-4">Imagen</th>
				<th class="col-md-2"></th>
			</tr>
		</thead>
		<tbody>
			{foreach item=post from=$posts}
			<tr>
				<td>
					{$post.titulo}
				</td>
				<td><p class="lead">{$post.cuerpo}</p></td>
				<td>
					{if isset($post.imagen)}
					<a href="{$_layoutParams.root}public/img/post/{$post.imagen}">
						<img src="{$_layoutParams.root}public/img/post/thumb/thumb_{$post.imagen}"/>
					</a>
					{/if}
				</td>

				<td>
					<a href="{$_layoutParams.root}post/editar/{$post.id}">
						<button type="button" class="btn btn-default">
					  		<span class="glyphicon glyphicon-eye-open"></span>
						</button>
					</a>
					<a href="{$_layoutParams.root}post/eliminar/{$post.id}">
						<button type="button" class="btn btn-default">
					  		<span class="glyphicon glyphicon-trash"></span>
						</button>
					</a>
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
{else}
	<div class="alert alert-danger">
	  	Aún no hay posts
	</div>
{/if}


	<div class="text-center">
		{$paginacion|default:""}
	</div>

</div>

</div>
