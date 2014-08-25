<div class="jumbotron">
  <h1>{$titulo}</h1>
  <small>Usuario: {$datos.usuario} | Role: {$datos.role}</small>
</div>

<div class="bloque">
  <form method="POST" action="" name="usuario">
    <input type="hidden" name="guardar" value="1"/>
    {if isset($permisos) && count($permisos)}
    <table class="table table-bordered">
          <thead>
            <tr>
                <th>Permiso</th>
                <th class="text-center">Permiso</th>
            </tr>
          </thead>
          <tbody>
            {foreach item=permiso from=$permisos}
              {if $role.$permiso.valor == 1}
                {assign var = "v" value="habilitado"}
              {else}
                {assign var = "v" value="denegado"}
              {/if}
            <tr >
                <td>{$usuario.$permiso.permiso}</td>
                <td class="text-center">
                  <select name="perm_{$usuario.$permiso.id}">
                    <option value="x" {if $usuario.$permiso.heredado}selected='selected'{/if}>Heredado ({$v})</option>
                    <option value="1" {if $usuario.$permiso.valor == 1 && $usuario.$permiso.heredado == ''}selected='selected'{/if}>Habilitado</option>
                    <option value="" {if $usuario.$permiso.valor == '' && $usuario.$permiso.heredado == ''}selected='selected'{/if}>Denegado</option>
                  </select>
                </td>
            </tr>
            {/foreach}
          </tbody>
      </table>
    {/if}

    <input class="btn btn-success" type="submit" value="Guardar"/>

  </form>

</div>