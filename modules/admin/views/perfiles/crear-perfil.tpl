<div class="alert alert-warning">
Los campos marcados con * (asterisco) son obligatorios
</div>
<form role="form" method="POST" action="">
  <input type="hidden" name="crear" value="1"/>
  <div class="form-group col-md-12">
    <label for="frecuenciaEmail">Tipo de perfil</label>
    <select class="form-control input-lg" name="tipoPerfil" id="tipoPerfil">
      <option value="">Seleccione</option>
      {if isset($tipos_perfil) && count($tipos_perfil)}
        {foreach item=tipo from=$tipos_perfil}
        <option value="{$tipo.id}" {if isset($datos.tipoPerfil)}{if $tipo.id== $datos.tipoPerfil}selected{/if}{/if}>{$tipo.tipo}</option>
        {/foreach}
      {/if}
    </select>
  </div>
  <div class="form-group col-md-12" id="wrapEmpresas">
    <label for="frecuenciaEmail">Empresa</label>
    <select class="form-control input-lg" name="empresa" id="empresa">
      <option>Seleccione</option>
      {if isset($empresas) && count($empresas)}
        {foreach item=empresa from=$empresas}
        <option value="{$empresa.id}" {if isset($datos.empresa)}{if $empresa.id== $datos.empresa}selected{/if}{/if}>{$empresa.nombre}</option>
        {/foreach}
      {/if}
    </select>
  </div>
  <div class="form-group col-md-6">
    <label for="nombres">Nombre(s)</label>
    <input type="text" class="form-control input-lg" id="nombres" placeholder="Nombre(s)" name="nombres" value="{if isset($datos.nombres)}{$datos.nombres}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="apellidos">Apellido(s)</label>
    <input type="text" class="form-control input-lg" id="apellidos" placeholder="Apellido(s)" name="apellidos" value="{if isset($datos.apellidos)}{$datos.apellidos}{/if}">
  </div>
  <div class="form-group col-md-12">
    <label for="direccion">Dirección</label>
    <input type="text" class="form-control input-lg" id="direccion" placeholder="Dirección" name="direccion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="email">Correo electrónico</label>
    <input type="text" class="form-control input-lg" id="email" placeholder="Correo electrónico" name="email" value="{if isset($datos.email)}{$datos.email}{/if}">
  </div>
  <div class="form-group col-md-6">

    <label for="frecuenciaEmail">¿Cada cuánto revisa su correo electrónico?</label>
    <select class="form-control input-lg" name="frecuenciaEmail">
      <option value="">Seleccione</option>
      {if isset($frecuencias) && count($frecuencias)}
        {foreach item=frecuencia from=$frecuencias}
        <option value="{$frecuencia.id}" {if isset($datos.frecuenciaEmail)}{if $frecuencia.id== $datos.frecuenciaEmail}selected{/if}{/if}>{$frecuencia.frecuencia}</option>
        {/foreach}
      {/if}
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="telefonoTrabajo">Teléfono trabajo</label>
    <input type="text" class="form-control input-lg" id="telefonoTrabajo" placeholder="Teléfono trabajo" name="telefonoTrabajo" value="{if isset($datos.telefonoTrabajo)}{$datos.telefonoTrabajo}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="telefonoCasa">Teléfono casa</label>
    <input type="text" class="form-control input-lg" id="telefonoCasa" placeholder="Teléfono casa" name="telefonoCasa" value="{if isset($datos.telefonoCasa)}{$datos.telefonoCasa}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="telefonoCelular">Teléfono celular</label>
    <input type="text" class="form-control input-lg" id="telefonoCelular" placeholder="Teléfono celular" name="telefonoCelular" value="{if isset($datos.telefonoCelular)}{$datos.telefonoCelular}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="edad">Edad</label>
    <select class="form-control input-lg" name="edad">
      <option value="">Seleccione</option>
      {for $edad=1 to 120}
        <option value="{$edad}" {if isset($datos.edad)}{if $edad== $datos.edad}selected{/if}{/if}>{$edad} años</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="estatura">Estatura (metros)</label>
    <select class="form-control input-lg" name="estatura_metros">
      <option value="">Seleccione</option>
      {for $metros=1 to 2}
        <option value="{$metros}" {if isset($datos.estatura_metros)}{if $metros== $datos.estatura_metros}selected{/if}{/if}>{$metros} metro(s)</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="estatura">Estatura (centímetros)</label>
    <select class="form-control input-lg" name="estatura_centimetros">
      <option value="">Seleccione</option>
      {for $centimetros=1 to 100}
        <option value="{$centimetros}" {if isset($datos.estatura_centimetros)}{if $centimetros== $datos.estatura_centimetros}selected{/if}{/if}>{$centimetros} centimetro(s)</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-6">
    <label for="fechaNacimiento">Fecha de nacimiento</label>
    <input type="text" class="form-control input-lg datepicker" id="fechaNacimiento" placeholder="Fecha de nacimiento" name="fechaNacimiento" value="{if isset($datos.fechaNacimiento)}{$datos.fechaNacimiento}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="lugar_nacimiento">Lugar de nacimiento</label>
    <input type="text" class="form-control input-lg" id="lugar_nacimiento" placeholder="Lugar de nacimiento" name="lugar_nacimiento" value="{if isset($datos.lugar_nacimiento)}{$datos.lugar_nacimiento}{/if}">
  </div>
  <button type="submit" class="btn btn-success btn-lg">Crear perfil</button>
</form>
