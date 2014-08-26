<form role="form" method="POST" action="">
  <input type="hidden" name="actualizar" value="1"/>
  <div class="form-group col-md-6">
    <label for="nombreEmpresa">Peso</label>
    <select class="form-control input-lg" name="peso">
      <option value="">Seleccione</option>
      {for $peso=0 to 500}
        <option value="{$peso}" {if isset($datos.peso)}{if $datos.peso==$peso}selected{/if}{/if}>{$peso} kilos</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-3">
    <label for="cintura">Cintura</label>
    <select class="form-control input-lg" name="cintura">
      <option>Seleccione</option>
      {for $cintura=0 to 500}
        <option value="{$cintura}" {if isset($datos.cintura)}{if $datos.cintura==$cintura}selected{/if}{/if}>{$cintura} cm</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-3">
    <label for="porcentaje_grasa">Porcentaje de grasa</label>
    <select class="form-control input-lg" name="porcentaje_grasa">
      <option value="">Seleccione</option>
      {for $grasa=0 to 100}
        <option value="{$grasa}" {if isset($datos.porcentaje_grasa)}{if $datos.porcentaje_grasa==$grasa}selected{/if}{/if}>{$grasa} %</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-6">
    <label for="ausentismo">Ausentismo laboral</label>
    <select class="form-control input-lg" name="ausentismo" id="ausentismo">
      <option value="">Seleccione</option>
        <option value="1" {if isset($datos.ausentismo)}{if $datos.ausentismo==1}selected{/if}{/if}>Sí</option>
        <option value="2" {if isset($datos.ausentismo)}{if $datos.ausentismo==2}selected{/if}{/if}>No</option>
    </select>
  </div>
  <div class="form-group col-md-6">
    <label for="cuantas_veces">¿Cuántas veces?</label>
    <select class="form-control input-lg" name="cuantas_veces" {if isset($datos.ausentismo)} {if $datos.ausentismo==1} {else} disabled{/if} {else}disabled{/if} id="cuantas_veces">
      <option value="">Seleccione</option>
        {for $veces=0 to 100}
          <option value="{$veces}" {if isset($datos.cuantas_veces)}{if $datos.cuantas_veces==$veces}selected{/if}{/if}>{$veces}</option>
        {/for}
    </select>
  </div>
  <div class="form-group col-md-12" {if isset($datos.ausentismo)}{if $datos.ausentismo==1} style="display:block"{else} style="display:none" {/if} {else} style="display:none" {/if}  id="por_que">
    <label for="explique_ausentismo">Explique el ausentismo</label>
    <textarea class="form-control input-lg" id="por_que" placeholder="Explique el ausentismo" name="explique_ausentismo">{if isset($datos.explique_ausentismo)}{$datos.explique_ausentismo}{/if}</textarea>
  </div>

  <div class="form-group col-md-6">
    <label for="satisfaccion_laboral">Satisfacción laboral</label>
    <select class="form-control input-lg" name="satisfaccion_laboral">
      <option value="">Seleccione</option>
      <option value="1" {if isset($datos.satisfaccion_laboral)}{if $datos.satisfaccion_laboral==1}selected{/if}{/if}>Contento(a)</option>
      <option value="2" {if isset($datos.satisfaccion_laboral)}{if $datos.satisfaccion_laboral==2}selected{/if}{/if}>Enojado(a)</option>
      <option value="3" {if isset($datos.satisfaccion_laboral)}{if $datos.satisfaccion_laboral==3}selected{/if}{/if}>Decepcionado(a)</option>
      <option value="4" {if isset($datos.satisfaccion_laboral)}{if $datos.satisfaccion_laboral==4}selected{/if}{/if}>Cansado(a)</option>


    </select>
  </div>

  <div class="form-group col-md-6">
    <label for="accidentes_laborales">Accidentes laborales</label>
    <select class="form-control input-lg" name="accidentes_laborales" id="accidentes_laborales">
      <option value="">Seleccione</option>
      <option value="1" {if isset($datos.accidentes_laborales)}{if $datos.accidentes_laborales==1}selected{/if}{/if}>Sí</option>
      <option value="2" {if isset($datos.accidentes_laborales)}{if $datos.accidentes_laborales==2}selected{/if}{/if}>No</option>
    </select>
  </div>

  <div class="form-group col-md-12" {if isset($datos.accidentes_laborales)}{if $datos.accidentes_laborales==1} style="display:block"{else} style="display:none" {/if} {else} style="display:none" {/if} id="explique_accidentes">
    <label for="explique_accidentes">Explique los accidentes laborales</label>
    <textarea class="form-control input-lg" id="por_que" placeholder="Explique los accidentes laborales" name="explique_accidentes">{if isset($datos.explique_accidentes)}{$datos.explique_accidentes}{/if}</textarea>
  </div>



  <div class="form-group col-md-6">
    <label for="indice_de_masa">Índice de masa corporal</label>
    <select class="form-control input-lg" name="indice_de_masa">
      <option value="">Seleccione</option>
      {for $masa=0 to 100}
        <option value="{$masa}" {if isset($datos.indice_de_masa)}{if $datos.indice_de_masa==$masa}selected{/if}{/if}>{$masa} %</option>
      {/for}
    </select>
  </div>

  <div class="form-group col-md-6">
    <label for="horas_sueno">Horas de sueño</label>
    <select class="form-control input-lg" name="horas_sueno">
      <option value="">Seleccione</option>
      {for $horas=0 to 24}
        <option value="{$horas}" {if isset($datos.horas_sueno)}{if $datos.horas_sueno==$horas}selected{/if}{/if}>{$horas}</option>
      {/for}
    </select>
  </div>

  <div class="form-group col-md-6">
    <label for="cafe">Cantidad de café (tazas)</label>
    <select class="form-control input-lg" name="cafe">
      <option value="">Seleccione</option>
      {for $cantidad=0 to 100}
        <option value="{$cantidad}" {if isset($datos.cafe)}{if $datos.cafe==$cantidad}selected{/if}{/if}>{$cantidad}</option>
      {/for}
    </select>
  </div>

  <div class="form-group col-md-6">
    <label for="azucar">Cantidad de azúcar</label>
    <select class="form-control input-lg" name="azucar">
      <option value="">Seleccione</option>
      {for $cantidad=0 to 500}
        <option value="{$cantidad}" {if isset($datos.azucar)}{if $datos.azucar==$cantidad}selected{/if}{/if}>{$cantidad} gramo(s)</option>
      {/for}
    </select>
  </div>

  <div class="form-group col-md-6">
    <label for="refrescos">Cantidad de refresecos</label>
    <select class="form-control input-lg" name="refrescos">
      <option value="">Seleccione</option>
      {for $cantidad=0 to 100}
        <option value="{$cantidad}" {if isset($datos.cafe)}{if $datos.cafe==$cantidad}selected{/if}{/if}>{$cantidad}</option>
      {/for}
    </select>
  </div>

  <div class="form-group col-md-6">
    <label for="lacteos" class="col-md-12">Cantidad de lácteos</label>
    <div class="form-group col-md-6">
      <select class="form-control input-lg" name="tipo_lacteo">
        <option value="x">Seleccione</option>
          <option value="1" {if isset($datos.tipo_lacteo)}{if $datos.tipo_lacteo==1}selected{/if}{/if}>Vaso</option>
          <option value="2" {if isset($datos.tipo_lacteo)}{if $datos.tipo_lacteo==2}selected{/if}{/if}>Porción</option>
          <option value="3" {if isset($datos.tipo_lacteo)}{if $datos.tipo_lacteo==3}selected{/if}{/if}>Ninguno</option>
      </select>
    </div>
    <div class="form-group col-md-6">
      <select class="form-control input-lg" name="cantidad_lacteo">
        <option value="">Seleccione</option>
        {for $cantidad=0 to 100}
          <option value="{$cantidad}" {if isset($datos.cantidad_lacteo)}{if $datos.cantidad_lacteo==$cantidad}selected{/if}{/if}>{$cantidad}</option>
        {/for}
      </select>
  </div>
  <button type="submit" class="btn btn-success btn-lg">Crear sesión</button>
</form>
