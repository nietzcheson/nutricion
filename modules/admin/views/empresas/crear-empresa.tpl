<form role="form" method="POST" action="">
  <input type="hidden" name="crear" value="1"/>
  <div class="form-group">
    <label for="nombreEmpresa">Nombre</label>
    <input type="text" class="form-control input-lg" id="nombreEmpresa" placeholder="Nombre de la empresa" name="nombre" value="{if isset($datos.nombre)}{$datos.nombre}{/if}">
  </div>
  <div class="form-group">
    <label for="emailEmpresa">Email</label>
    <input type="text" class="form-control input-lg" id="emailEmpresa" placeholder="Email de la empresa" name="email" value="{if isset($datos.email)}{$datos.email}{/if}">
  </div>
  <div class="form-group">
    <label for="telefonoEmpresa">Teléfono</label>
    <input type="text" class="form-control input-lg" id="telefonoEmpresa" placeholder="Teléfono de la empresa" name="telefono" value="{if isset($datos.telefono)}{$datos.telefono}{/if}">
  </div>
  <div class="form-group">
    <label for="direccionEmpresa">Dirección</label>
    <input type="text" class="form-control input-lg" id="direccionEmpresa" placeholder="Dirección de la empresa" name="direccion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group">
    <label for="nombreEmpresa">Observación</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <button type="submit" class="btn btn-success btn-lg">Crear empresa</button>
</form>
