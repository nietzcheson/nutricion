<div class="jumbotron">
  <h1>{$titulo}</h1>
  <!--<p>Un texto acá</p>
  <p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>-->
  	<a class="btn btn-default"href="{$_layoutParams.root}post/">Regresar</a>
</div>

<div class="bloque">

	<form id="form1" method="POST" action="{$_layoutParams.root}post/nuevo" class="form" enctype="multipart/form-data">
		<input type="hidden" name="guardar" value="1">
		<fieldset>
			<div class="form-group">
			    <label for="titulo">Título:</label>
			    <input type="text" class="form-control" id="titulo" placeholder="Título" name="titulo" value="{if isset($post.titulo)}{$post.titulo}{/if}">
			</div>
			<div class="form-group">
			    <label for="cuerpo">Cuerpo:</label>
			    <textarea class="form-control" id="cuerpo" name="cuerpo">{if isset($post.cuerpo)}{$post.cuerpo}{/if}</textarea>
			</div>
			<div class="form-group">
			    <label for="titulo">Imagen:</label>
			    <input type="file" class="form-control" id="titulo" placeholder="Título" name="imagen"/>
			</div>
			  <input type="submit" value="Guardar" class="btn btn-primary">

		</fieldset>		
	</form>

</div>

<p></p>