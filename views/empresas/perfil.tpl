<form role="form" method="POST" action="">
  <input type="hidden" name="actualizar" value="1"/>
  <input type="hidden" name="id" value="{if isset($empresa.id)}{$empresa.id}{/if}">
  <div class="form-group">
    <label for="nombreEmpresa">Nombre</label>
    <input type="text" class="form-control input-lg" id="nombreEmpresa" placeholder="Nombre de la empresa" name="nombre" value="{if isset($empresa.nombre)}{$empresa.nombre}{/if}">
  </div>
  <div class="form-group">
    <label for="emailEmpresa">Email</label>
    <input type="text" class="form-control input-lg" id="emailEmpresa" placeholder="Email de la empresa" name="email" value="{if isset($empresa.email)}{$empresa.email}{/if}">
  </div>
  <div class="form-group">
    <label for="telefonoEmpresa">Teléfono</label>
    <input type="text" class="form-control input-lg" id="telefonoEmpresa" placeholder="Teléfono de la empresa" name="telefono" value="{if isset($empresa.telefono)}{$empresa.telefono}{/if}">
  </div>
  <div class="form-group">
    <label for="direccionEmpresa">Dirección</label>
    <input type="text" class="form-control input-lg" id="direccionEmpresa" placeholder="Dirección de la empresa" name="direccion" value="{if isset($empresa.direccion)}{$empresa.direccion}{/if}">
  </div>
  <div class="form-group">
    <label for="nombreEmpresa">Observación</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($empresa.observaciones)}{$empresa.observaciones}{/if}</textarea>
  </div>
  <button type="submit" class="btn btn-success btn-lg">Guardar</button>
</form>
