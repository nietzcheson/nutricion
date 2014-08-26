
{if isset($empresas) && count($empresas)}
<div class="table-responsive">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>#</th>
        <th>Nombre Empresa</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      {foreach item=empresa from=$empresas}
      <tr id="{$empresa.id}">
        <td>{$empresa.id}</td>
        <td>{$empresa.empresa}</td>
        <td class="text-right">
          <div class="btn-group">
              <a class="btn btn-default" href="{$_layoutParams.root}admin/empresas/perfil/{$empresa.id}">
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
  <strong>¡Aún no hay empresas!</strong>
</div>
{/if}
