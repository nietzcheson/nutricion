<ul class="nav nav-tabs">
  <li><a href="{$_layoutParams.root}admin/perfil/datos/{$id}">Datos personales</a></li>
  <li><a href="{$_layoutParams.root}admin/perfil/historial/{$id}">Historial clínico</a></li>
  <li class="active"><a href="{$_layoutParams.root}admin/perfil/sesiones/{$id}">Sesiones</a></li>
</ul>

<div class="page-header">
    <a href="{$_layoutParams.root}admin/perfil/crear_sesion/{$id}" class="btn btn-success">Crear sesión</a>
    <a href="{$_layoutParams.root}admin/perfil/graficas/{$id}" class="btn btn-danger">
      <span class="glyphicon glyphicon-th-list"></span> |
      <span class="glyphicon glyphicon-stats"></span> Tablas y gráficas
    </a>

</div>


{if isset($sesiones) && count($sesiones)}
<div class="table-responsive">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Número de sesión</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      {assign var=contador value="0"}

      {foreach item=sesion from=$sesiones}
      <tr id="{$empresa.id}">
        {assign var=contador value= $contador + 1}
        <td>Sesión {$contador}</td>
        <td class="text-right">
          <div class="btn-group">
              <a class="btn btn-default" href="{$_layoutParams.root}admin/perfil/sesion/{$id}/{$sesion.id}">
                <span class="glyphicon glyphicon-eye-open"></span>
              </a>
            <button type="button" class="btn btn-default btn-delete" id="{$empresa.id}">
              <span class="glyphicon glyphicon-trash"></span>
            </button>
          </div>
        </td>
      </tr>
      {/foreach}
    </tbody>
  </table>
</div>
{else}
<div class="alert alert-success">
  <strong>¡Aún no hay sesiones!</strong>
</div>
{/if}
