<ul class="nav nav-tabs">
  <li class="active"><a href="{$_layoutParams.root}admin/perfil/datos">Datos personales</a></li>
  <li><a href="{$_layoutParams.root}admin/perfil/historial">Historial clínico</a></li>
  <li><a href="{$_layoutParams.root}admin/perfil/sesiones">Sessiones</a></li>
</ul>


<div class="page-header">
  <h3><small>Historia médica confidencial</small></h3>
</div>



<div class="alert alert-danger">
Los campos marcados con * (asterisco) son obligatorios
</div>
<form role="form" method="POST" action="">
  <input type="hidden" name="crear" value="1"/>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">Nombre</label>
    <input type="text" class="form-control input-lg" id="nombreEmpresa" placeholder="Nombre" name="nombre" value="{if isset($datos.nombre)}{$datos.nombre}{/if}">
  </div>
  <div class="form-group col-md-12">
    <label for="direccion">Dirección</label>
    <input type="text" class="form-control input-lg" id="direccion" placeholder="Dirección" name="direccion" value="{if isset($datos.nombre)}{$datos.nombre}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="email">Correo electrónico</label>
    <input type="text" class="form-control input-lg" id="email" placeholder="Correo electrónico" name="email" value="{if isset($datos.email)}{$datos.email}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="frecuenciaEmail">¿Cada cuanto revisa su correo electrónico?</label>
    <input type="text" class="form-control input-lg" id="frecuenciaEmail" placeholder="¿Con cuánta frecuencia revisa su correo electrónico?" name="frecuenciaEmail" value="{if isset($datos.email)}{$datos.email}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="telefonoTrabajo">Teléfono trabajo</label>
    <input type="text" class="form-control input-lg" id="telefonoTrabajo" placeholder="Teléfono trabajo" name="telefonoTrabajo" value="{if isset($datos.telefono)}{$datos.telefono}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="telefonoCasa">Teléfono casa</label>
    <input type="text" class="form-control input-lg" id="telefonoCasa" placeholder="Teléfono casa" name="telefonoCasa" value="{if isset($datos.telefono)}{$datos.telefono}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="telefonoCelular">Teléfono celular</label>
    <input type="text" class="form-control input-lg" id="telefonoCelular" placeholder="Teléfono celular" name="telefonoCelular" value="{if isset($datos.telefono)}{$datos.telefono}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="edad">Edad</label>
    <input type="text" class="form-control input-lg" id="edad" placeholder="Edad" name="edad" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="estatura">Estatura</label>
    <input type="text" class="form-control input-lg" id="estatura" placeholder="Estatura" name="estatura" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="fechaNacimiento">Fecha de nacimiento</label>
    <input type="text" class="form-control input-lg" id="fechaNacimiento" placeholder="Fecha de nacimiento" name="fechaNacimiento" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="lugarNacimiento">Lugar de nacimiento</label>
    <input type="text" class="form-control input-lg" id="lugarNacimiento" placeholder="Lugar de nacimiento" name="lugarNacimiento" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="pesoActual">Peso actual</label>
    <input type="text" class="form-control input-lg" id="pesoActual" placeholder="Peso actual" name="pesoActual" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="peso6Meses">Peso hace 6 meses</label>
    <input type="text" class="form-control input-lg" id="peso6Meses" placeholder="Peso hace 6 meses" name="peso6Meses" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="pesoHaceUnAno">Peso hace un año</label>
    <input type="text" class="form-control input-lg" id="pesoHaceUnAno" placeholder="Peso hace un año" name="pesoHaceUnAno" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6 text-center">
    <label for="pesoDiferente">Le gustaría que su peso fuera diferente</label>
    <div class="btn-group" data-toggle="buttons">
      <label class="btn btn-default btn-lg">
        <input type="radio" name="options" id="option1"> Sí
      </label>
      <label class="btn btn-default btn-lg">
        <input type="radio" name="options" id="option2"> No
      </label>
    </div>
  </div>
  <div class="form-group col-md-6">
    <label for="pesoHaceUnAno">Qué tanto</label>
    <input type="text" class="form-control input-lg" id="pesoHaceUnAno" placeholder="Peso hace un año" name="pesoHaceUnAno" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="estadoCivil">Estado civil</label>
    <select class="form-control input-lg">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="pesoHaceUnAno">¿Hijos?</label>
    <input type="text" class="form-control input-lg" id="pesoHaceUnAno" placeholder="Peso hace un año" name="pesoHaceUnAno" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-4">
    <label for="pesoHaceUnAno">¿Alguna mascota?</label>
    <input type="text" class="form-control input-lg" id="pesoHaceUnAno" placeholder="Peso hace un año" name="pesoHaceUnAno" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="profesion">Profesión</label>
    <input type="text" class="form-control input-lg" id="profesion" placeholder="Profesión" name="profesion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="horasLaborales">Horas laborales</label>
    <input type="text" class="form-control input-lg" id="horasLaborales" placeholder="Profesión" name="profesion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-12">
    <label for="queLePreocupa">¿Qué es lo que más le preocupa de su salud?</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿En cuál momento de su vida se ha sentido mejor?</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">Otras preocupaciones y o metas</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Ha tenido alguna enfermedad o lesión grave/¿Ha sido hospitalizada?</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Cómo está su madre de salud?</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Cómo está su padre de salud?</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-6">
    <label for="nombreEmpresa">¿Cuáles son sus antecedentes étnicos?</label>
    <input type="text" class="form-control input-lg" id="horasLaborales" placeholder="Profesión" name="profesion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="nombreEmpresa">¿Cuál es su grupo sanguíneo?</label>
    <input type="text" class="form-control input-lg" id="horasLaborales" placeholder="Profesión" name="profesion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="nombreEmpresa">¿Duerme bien?</label>
    <input type="text" class="form-control input-lg" id="horasLaborales" placeholder="Profesión" name="profesion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="nombreEmpresa">Cuántas horas?</label>
    <input type="text" class="form-control input-lg" id="horasLaborales" placeholder="Profesión" name="profesion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="nombreEmpresa">¿Se despierta durante la noche?</label>
    <input type="text" class="form-control input-lg" id="horasLaborales" placeholder="Profesión" name="profesion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="nombreEmpresa">¿Por qué?</label>
    <input type="text" class="form-control input-lg" id="horasLaborales" placeholder="Profesión" name="profesion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Tiene dolor, rigidez, hinchazón?[Sí/No]</label>
    <input type="text" class="form-control input-lg" id="horasLaborales" placeholder="Profesión" name="profesion" value="{if isset($datos.direccion)}{$datos.direccion}{/if}">
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Extreñimiento, diarrega, gases?</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Tiene alguna alergia o algunas sensibilidades?</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Toma algún suplemento o medicamento? ¿Cuáles?:</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Toma algún suplemento o medicamento? ¿Cuáles?:</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Tiene la ayuda de algún curador o ayudante? ¿Recibe algún tipo de terapia o tiene alguna mascota? De ser así, indíquelos:</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Qué papel juegan los deportes y el ejercicio en su vida?</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Qué alimentos comía con frecuencia de joven?</label><br>
    <label for="nombreEmpresa">Desayuno</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
    <label for="nombreEmpresa">Almuerzo</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
    <label for="nombreEmpresa">Cena</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
    <label for="nombreEmpresa">Merienda</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
    <label for="nombreEmpresa">Liquidos</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>

  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Qué tipo de alimentos come hoy en día?</label><br>
    <label for="nombreEmpresa">Desayuno</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
    <label for="nombreEmpresa">Almuerzo</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
    <label for="nombreEmpresa">Cena</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
    <label for="nombreEmpresa">Merienda</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
    <label for="nombreEmpresa">Liquidos</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>

  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Recibirá apoyo de su familia y/o de sus amistades con respecto a su deseo de hacer cambios en su manera de comer y/o estilo de vida? </label><br>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Qué porcentaje de su comida está hecha en casa?</label><br>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Usted cocina?</label><br>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">Dónde consigue el resto?</label><br>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">¿Le dan antojos de azúcar, café, cigarros o tiene alguna adicción fuerte?</label><br>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">Los cambios primordiales que tendría que hacer con respecto a mi manera de comer para mejor mi salud serian:</label><br>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="nombreEmpresa">Observación</label>
    <textarea class="form-control input-lg" id="nombreEmpresa" placeholder="¿Alguna observación?" name="observaciones">{if isset($datos.observaciones)}{$datos.observaciones}{/if}</textarea>
  </div>
  <button type="submit" class="btn btn-success btn-lg">Crear perfil</button>
</form>
