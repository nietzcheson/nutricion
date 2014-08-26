
<div id="wrap-table">

<table class="table table-bordered" id="id_sesion" id_sesion="{$id_perfil}">
      <thead>
        <tr>
          <th># Sesion</th>
          <th>Peso</th>
          <th>Cintura</th>
          <th>Porcentaje de grasa</th>
          <th>Ausentismo</th>
          <th>Cuántas veces ausente</th>
          <th>Explicación de ausentismo</th>
          <th>Accidentes laborales</th>
          <th>Explicación accidentes laborales</th>
          <th>Satisfacción laboral</th>
          <th>Índice de masa</th>
          <th>Horas de sueño</th>
          <th>Café</th>
          <th>Azucar</th>
          <th>Refrescos</th>
          <th>Lácteos</th>
        </tr>
      </thead>
      <tbody>
        {assign var=contador value="0"}
        {foreach item=sesion from=$sesiones}
        {assign var=contador value= $contador + 1}
        <tr>
          <td>Sesion {$contador}</td>
          <td>{$sesion.peso}</td>
          <td>{$sesion.cintura}</td>
          <td>{$sesion.porcentaje_grasa}</td>
          <td>

            {if $sesion.ausentismo==1}
              Sí
            {else}
              No
            {/if}
          </td>
          <td>
            {if $sesion.ausentismo==1}
              {$sesion.cuantas_veces}
            {else}
              --
            {/if}

          </td>
          <td>
            {if $sesion.ausentismo==1}
              {$sesion.explique_ausentismo}
            {else}
              --
            {/if}
          </td>
          <td>
            {if $sesion.accidentes_laborales==1}
              Sí
            {else}
              No
            {/if}
          </td>
          <td>
            {if $sesion.accidentes_laborales==1}
              {$sesion.explique_accidentes}
            {else}
              --
            {/if}

          </td>
          <td>{$sesion.satisfaccion_laboral}</td>
          <td>{$sesion.indice_de_masa}</td>
          <td>{$sesion.horas_sueno}</td>
          <td>{$sesion.cafe}</td>
          <td>{$sesion.azucar}</td>
          <td>{$sesion.refrescos}</td>
          <td>{$sesion.lacteos}</td>
        </tr>
        {/foreach}
      </tbody>
    </table>

</div>

<div class="panel panel-default" id="panel">
  <div class="panel-heading">
    <div class="page-header">
      <h1><img src="{$_layoutParams.root}public/img/peso.png" />
 Peso <small></small></h1>
    </div>
  </div>
  <div class="panel-body">
    <div style="overflow:auto">
          <div>
            <canvas id="peso" height="250"></canvas>
          </div>
        </div>
  </div>
</div>

<div class="panel panel-default" id="panel">
  <div class="panel-heading">
    <div class="page-header">
      <h1><img src="{$_layoutParams.root}public/img/cintura.png" />Cintura <small></small></h1>
    </div>
  </div>
  <div class="panel-body">
    <div style="overflow:auto">
          <div>
            <canvas id="cintura" height="250"></canvas>
          </div>
        </div>
  </div>
</div>
<div class="panel panel-default" id="panel">
  <div class="panel-heading">
    <div class="page-header">
      <h1><img src="{$_layoutParams.root}public/img/p_grasa.png" />Porcentaje de grasa <small></small></h1>
    </div>
  </div>
  <div class="panel-body">
    <div style="overflow:auto">
          <div>
            <canvas id="porcentaje_grasa" height="250"></canvas>
          </div>
        </div>
  </div>
</div>

<div class="panel panel-default" id="panel">
  <div class="panel-heading">
    <div class="page-header">
      <h1><img src="{$_layoutParams.root}public/img/i_masa.png" />Índice de masa <small></small></h1>
    </div>
  </div>
  <div class="panel-body">
    <div style="overflow:auto">
          <div>
            <canvas id="indice_de_masa" height="250"></canvas>
          </div>
        </div>
  </div>
</div>

<div class="panel panel-default" id="panel">
  <div class="panel-heading">
    <div class="page-header">
      <h1><img src="{$_layoutParams.root}public/img/sueno.png" />Horas de sueño <small></small></h1>
    </div>
  </div>
  <div class="panel-body">
    <div style="overflow:auto">
          <div>
            <canvas id="horas_sueno" height="250"></canvas>
          </div>
        </div>
  </div>
</div>

<div class="panel panel-default" id="panel">
  <div class="panel-heading">
    <div class="page-header">
      <h1><img src="{$_layoutParams.root}public/img/cafe.png" /> Café <small></small></h1>
    </div>
  </div>
  <div class="panel-body">
    <div style="overflow:auto">
          <div>
            <canvas id="cafe" height="250"></canvas>
          </div>
        </div>
  </div>
</div>

<div class="panel panel-default" id="panel">
  <div class="panel-heading">
    <div class="page-header">
      <h1><img src="{$_layoutParams.root}public/img/azucar.png" /> Azúcar <small></small></h1>
    </div>
  </div>
  <div class="panel-body">
    <div style="overflow:auto">
          <div>
            <canvas id="azucar" height="250"></canvas>
          </div>
        </div>
  </div>
</div>

<div class="panel panel-default" id="panel">
  <div class="panel-heading">
    <div class="page-header">
      <h1><img src="{$_layoutParams.root}public/img/refresco.png" />Refrescos <small></small></h1>
    </div>
  </div>
  <div class="panel-body">
    <div style="overflow:auto">
          <div>
            <canvas id="refrescos" height="250"></canvas>
          </div>
        </div>
  </div>
</div>

<div class="panel panel-default" id="panel">
  <div class="panel-heading">
    <div class="page-header">
      <h1><img src="{$_layoutParams.root}public/img/lacteos.png" /> Lácteos <small></small></h1>
    </div>
  </div>
  <div class="panel-body">
    <div style="overflow:auto">
          <div>
            <canvas id="lacteos" height="250"></canvas>
          </div>
        </div>
  </div>
</div>
