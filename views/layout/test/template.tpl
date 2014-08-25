<!DOCTYPE html>
<html lang="es">
    <head>
        <title>{$titulo|default:"Sin t&iacute;tulo"}</title>
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


      <div class="panel panel-default">
  <div class="panel-body">
    <h2 ></h2>
  </div>
</div>


    <div id="wrap-login">
      <div id="container-login">
          <img id="img-logo" src="{$_layoutParams.configs.app_logo}"/>
        {if isset($_error)}
            <div id="_errl" class="alert alert-error">
                <a class="close" data-dismiss="alert">x</a>
                {$_error}
            </div>
        {/if}

        {if isset($_mensaje)}
            <div id="_msgl" class="alert alert-success">
                <a class="close" data-dismiss="alert">x</a>
                {$_mensaje}
            </div>
        {/if}
        <div class="panel panel-default">
          <div class="panel-body">
            {include file=$_contenido}
          </div>
        </div>
      </div>
    </div>



        <div class="container" style="background: #fff;">
            <div class="span8">
                <noscript><p>Para el correcto funcionamiento debe tener el soporte para javascript habilitado</p></noscript>




            </div>

            <div class="span3">
                {if isset($_layoutParams.menu_right)}
                    <ul class="nav nav-tabs nav-stacked">
                        {foreach item=it from=$_layoutParams.menu_right}
                            {if isset($_layoutParams.item) && $_layoutParams.item == $it.id}
                                {assign var="_style" value='active'}
                            {else}
                                {assign var="_style" value=''}
                            {/if}

                            <li class="{$_style}"><a  href="{$it.enlace}"><i class="{$it.imagen}"> </i> {$it.titulo}</a></li>
                        {/foreach}
                    </ul>
                {/if}
            </div>
        </div>

        <!-- Footer -->
        <div class="navbar navbar-fixed-bottom">
            <div class="navbar-inner">
                <div class="container">
                    <div style="margin-top: 10px; text-align: center;">Copyright&copy; 2014 <a href="http://www.artesan.us" target="_blank">www.artesan.us</a></div>
                </div>
            </div>
        </div>

        <!-- javascript -->
        <script src="{$_layoutParams.root}public/js/jQuery.js"></script>
        <script src="{$_layoutParams.root}public/js/jQueryUI.js"></script>
        <script src="{$_layoutParams.root}public/js/jquery.validate.js"></script>
        <script src="{$_layoutParams.root}public/js/Chart.js"></script>
        <script src="{$_layoutParams.ruta_bootstrap}js/bootstrap.min.js"/></script>
        <script src="{$_layoutParams.root}public/js/funciones.js"></script>
        <script type="text/javascript">
          var _root_ = '{$_layoutParams.root}';
        </script>


        {if isset($_layoutParams.js_plugin) && count($_layoutParams.js_plugin)}
            {foreach item=plg from=$_layoutParams.js_plugin}
                <script src="{$plg}" type="text/javascript"></script>
            {/foreach}
        {/if}

        {if isset($_layoutParams.js) && count($_layoutParams.js)}
            {foreach item=js from=$_layoutParams.js}
                <script src="{$js}" type="text/javascript"></script>
            {/foreach}
        {/if}
    </body>
</html>
