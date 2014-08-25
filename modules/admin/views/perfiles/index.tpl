
{if isset($empresas) && count($empresas)}
<div class="table-responsive">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>#</th>
        <th>Nombre</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      {assign var=contador value="0"}

      {foreach item=empresa from=$empresas}
      <tr id="{$empresa.id}">
        {assign var=contador value= $contador + 1}
        <td>{$contador}</td>
        <td>{$empresa.nombres} {$empresa.apellidos}</td>
        <td class="text-right">
          <div class="btn-group">
              <a class="btn btn-default" href="{$_layoutParams.root}admin/perfil/datos/{$empresa.id}">
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
  <strong>¡Aún no hay perfiles!</strong>
</div>
{/if}
