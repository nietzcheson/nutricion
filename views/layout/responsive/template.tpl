<!DOCTYPE html>
<html>
  <head>
    <title>{$titulo}</title>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="{$_layoutParams.ruta_bootstrap}css/bootstrap.css"/>
    <link rel="stylesheet" href="{$_layoutParams.root}public/css/jQueryUI.min.css"/>
    <link rel="stylesheet" href="{$_layoutParams.ruta_css}estilos.css"/>
    {if isset($_layoutParams.css) && count($_layoutParams.css)}
      {foreach item=css from=$_layoutParams.css}
        <link rel="stylesheet" href="{$css}"/>
      {/foreach}
    {/if}
  </head>
  <body>
    <div id="wrapper">
      <div class="bloque1">
        <header id="head-lead">
            <img src="{$_layoutParams.configs.app_logo}"/>
        </header>
        <nav id="nav">
          {if isset($widgets.sidebar)}
            {foreach item=sidebar from=$widgets.sidebar}
              {$sidebar}
            {/foreach}
          {/if}
          <a href="{$_layoutParams.root}login/cerrar" type="button" class="btn btn-default btn-lg btn-block" id="close_count">Cerrar cuenta <span class="glyphicon glyphicon-off"></span></a>
        </nav>

      </div>
      <div class="bloque2">
        {if isset($_error)}
          <div class="alert alert-danger fade in">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong>{$_error}</strong>
          </div>
        {/if}
        {if isset($_mensaje)}
          <div class="alert alert-info fade in">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <strong>{$_mensaje}!</strong>
          </div>
        {/if}

              <div class="page-header">
        <h1>{if isset($titulo)}{$titulo}{/if} <small></small></h1>


      </div>
      {if isset($btnHeader)}
      <h1>
      <div class="btn-group">
        {foreach item=btn from=$btnHeader}
          {if $btn.titulo=="return"}
              <a class="btn btn-default" href="{$_layoutParams.root}{$btn.enlace}">
                <span class="glyphicon glyphicon-hand-left"></span> Regresar
              </a>
          {else}
              <a class="btn btn-default" href="{$_layoutParams.root}{$btn.enlace}">{$btn.titulo}</a>
          {/if}

        {/foreach}
      </div>
    </h1>
      {/if}
        <div class="panel panel-default">
          <div class="panel-body">
            {include file=$_contenido}
          </div>
        </div>
    </div>
    </div>


    <script src="{$_layoutParams.root}public/js/jQuery.js"></script>
    <script src="{$_layoutParams.root}public/js/jQueryUI.js"></script>
    <script src="{$_layoutParams.root}public/js/jquery.validate.js"></script>
    <script src="{$_layoutParams.root}public/js/Chart.js"></script>
    <script src="{$_layoutParams.ruta_bootstrap}js/bootstrap.min.js"/></script>
    <script src="{$_layoutParams.root}public/js/funciones.js"></script>
    <script type="text/javascript">
      var _root_ = '{$_layoutParams.root}';
    </script>

    {if isset($_layoutParams.js) && count($_layoutParams.js)}
      {foreach item=js from=$_layoutParams.js}
        <script src="{$js}"></script>
      {/foreach}
    {/if}
  </body>

</html>
