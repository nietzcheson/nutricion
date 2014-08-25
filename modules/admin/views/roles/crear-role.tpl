<form role="form" method="POST" action="">
  <input type="hidden" name="crear" value="1"/>
  <div class="form-group">
    <label for="role">Role</label>
    <input type="text" class="form-control input-lg" id="role" placeholder="Role" name="role" value="{if isset($datos.nombre)}{$datos.nombre}{/if}">
  </div>
  <button type="submit" class="btn btn-success btn-lg">Crear role</button>
</form>
