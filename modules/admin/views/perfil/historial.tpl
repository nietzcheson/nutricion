<ul class="nav nav-tabs">
  <li><a href="{$_layoutParams.root}admin/perfil/datos/{$id}">Datos personales</a></li>
  <li class="active"><a href="{$_layoutParams.root}admin/perfil/historial/{$id}">Historial clínico</a></li>
  <li><a href="{$_layoutParams.root}admin/perfil/sesiones/{$id}">Sesiones</a></li>
</ul>

{if $existe==0}
<div class="page-header">
  <form role="form" method="POST" action="">
    <input type="hidden" name="crear" value="1"/>
    <button type="submit" class="btn btn-success">Crear historial</button>
  </form>
</div>
{else}
<div class="page-header">
</div>
<form role="form" method="POST" action="">
  <input type="hidden" name="historial" value="1"/>
  <div class="form-group col-md-4">
    <label for="{$id1}">{$label1}</label>
    <select class="form-control input-lg" name="{$id1}" id="{$id1}">
      <option>Seleccione</option>
      {for $peso=0 to 500}
        <option value="{$peso}" {if $datos.p1==$peso}selected{/if}>{$peso} kilos</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="{$id2}">{$label2}</label>
    <select class="form-control input-lg" name="{$id2}" id="{$id2}">
      <option>Seleccione</option>
      {for $peso=0 to 500}
        <option value="{$peso}" {if $datos.p2==$peso}selected{/if}>{$peso} kilos</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="{$id3}">{$label3}</label>
    <select class="form-control input-lg" name="{$id3}" id="{$id3}">
      <option>Seleccione</option>
      {for $peso=0 to 500}
        <option value="{$peso}" {if $datos.p3==$peso}selected{/if}>{$peso} kilos</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id4}">{$label4}</label>
    <select class="form-control input-lg" name="{$id4}" id="{$id4}">
      <option>Seleccione</option>
      <option value="1" {if $datos.p4==1}selected{/if}>Sí</option>
      <option value="x" {if $datos.p4=="x"}selected{/if}>No</option>
    </select>
  </div>
  <div class="form-group col-md-12" id="wrapPeso" {if $datos.p4==1}style="display:block"{/if}>
    <label for="{$id5}">{$label5}</label>
    <textarea class="form-control input-lg" id="{$id5}" placeholder="{$label5}" name="{$id5}">{$datos.p5}</textarea>
  </div>
  <div class="form-group col-md-4">
    <label for="{$id6}">{$label6}</label>
    <select class="form-control input-lg" name="{$id6}">
      <option value="0">Seleccione</option>
      <option value="1" {if $datos.p6==1}selected{/if}>Casado(a)</option>
      <option value="2" {if $datos.p6==2}selected{/if}>Soltero(a)</option>
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="{$id7}">{$label7}</label>
    <select class="form-control input-lg" name="{$id7}">
      <option>Seleccione</option>
      <option value="1" {if $datos.p7==1}selected{/if}>Sí</option>
      <option value="x" {if $datos.p7==x}selected{/if}>No</option>
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="{$id8}">{$label8}</label>
    <select class="form-control input-lg" name="{$id8}">
      <option>Seleccione</option>
      <option value="1" {if $datos.p8==1}selected{/if}>Sí</option>
      <option value="x" {if $datos.p8==x}selected{/if}>No</option>
    </select>
  </div>
  <div class="form-group col-md-6">
    <label for="{$id9}">{$label9}</label>
    <input type="text" class="form-control input-lg" id="{$id9}" placeholder="{$label9}" name="{$id9}" value="{if isset($datos.p9)}{$datos.p9}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="{$id10}">{$label10}</label>
    <select class="form-control input-lg" name="{$id10}">
      <option>Seleccione</option>
      {for $horas=0 to 24}
      <option value="{$horas}" {if $datos.p10==$horas}selected{/if}>{$horas} horas</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id11}">{$label11}</label>
    <textarea class="form-control input-lg" id="{$id11}" placeholder="{$label11}" name="{$id11}">{if isset($datos.p11)}{$datos.p11}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id12}">{$label12}</label>
    <textarea class="form-control input-lg" id="{$id12}" placeholder="{$label12}" name="{$id12}">{if isset($datos.p12)}{$datos.p12}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id13}">{$label13}</label>
    <textarea class="form-control input-lg" id="{$id13}" placeholder="{$label13}" name="{$id13}">{if isset($datos.p13)}{$datos.p13}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id14}">{$label14}</label>
    <textarea class="form-control input-lg" id="{$id14}" placeholder="{$label14}" name="{$id14}">{if isset($datos.p14)}{$datos.p14}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id15}">{$label15}</label>
    <textarea class="form-control input-lg" id="{$id15}" placeholder="{$label15}" name="{$id15}">{if isset($datos.p15)}{$datos.p15}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id16}">{$label16}</label>
    <textarea class="form-control input-lg" id="{$id16}" placeholder="{$label16}" name="{$id16}">{if isset($datos.p16)}{$datos.p16}{/if}</textarea>
  </div>
  <div class="form-group col-md-6">
    <label for="{$id17}">{$label17}</label>
    <input type="text" class="form-control input-lg" id="{$id17}" placeholder="{$label17}" name="{$id17}" value="{if isset($datos.p17)}{$datos.p17}{/if}">
  </div>
  <div class="form-group col-md-6">
    <label for="{$id18}">{$label18}</label>
    <select class="form-control input-lg" name="{$id18}" id="{$id18}">
      <option value="">Seleccione</option>
      {if isset($grupos_sanguineos) && count($grupos_sanguineos)}
        {foreach item=grupo from=$grupos_sanguineos}
          <option value="{$grupo.id}" {if $datos.p18==$grupo.id}selected{/if}>{$grupo.grupo_sanguineo}</option>
        {/foreach}
      {/if}
    </select>
  </div>
  <div class="form-group col-md-6">
    <label for="{$id19}">{$label19}</label>
    <select class="form-control input-lg" name="{$id19}">
      <option>Seleccione</option>
      <option value="1" {if $datos.p19==1}selected{/if}>Sí</option>
      <option value="x" {if $datos.p19==x}selected{/if}>No</option>
    </select>
  </div>
  <div class="form-group col-md-6">
    <label for="{$id20}">{$label20}</label>
    <select class="form-control input-lg" name="{$id20}">
      <option>Seleccione</option>
      {for $horas=0 to 24}
      <option value="{$horas}" {if $datos.p20==$horas}selected{/if}>{$horas} horas</option>
      {/for}
    </select>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id21}">{$label21}</label>
    <select class="form-control input-lg" name="{$id21}" id="{$id21}">
      <option>Seleccione</option>
      <option value="1" {if $datos.p21==1}selected{/if}>Sí</option>
      <option value="x" {if $datos.p21==x}selected{/if}>No</option>
    </select>
  </div>
  <div class="form-group col-md-12" id="wrapDespierta" {if $datos.p21==1}style="display:block"{/if}>
    <label for="{$id22}">{$label22}</label>
    <textarea class="form-control input-lg" id="{$id22}" placeholder="{$label22}" name="{$id22}">{if isset($datos.p22)}{$datos.p22}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id23}">{$label23}</label>
    <input type="text" class="form-control input-lg" id="{$id23}" placeholder="{$label23}" name="{$id23}" value="{if isset($datos.p23)}{$datos.p23}{/if}">
  </div>
  <div class="form-group col-md-12">
    <label for="{$id24}">{$label24}</label>
    <textarea class="form-control input-lg" id="{$id24}" placeholder="{$label24}" name="{$id24}">{if isset($datos.p24)}{$datos.p24}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id25}">{$label25}</label>
    <textarea class="form-control input-lg" id="{$id25}" placeholder="{$label25}" name="{$id25}">{if isset($datos.p25)}{$datos.p25}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id26}">{$label26}</label>
    <textarea class="form-control input-lg" id="{$id26}" placeholder="{$label26}" name="{$id26}">{if isset($datos.p26)}{$datos.p26}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id27}">{$label27}</label>
    <textarea class="form-control input-lg" id="{$id27}" placeholder="{$label27}" name="{$id27}">{if isset($datos.p27)}{$datos.p27}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id28}">{$label28}</label>
    <textarea class="form-control input-lg" id="{$id28}" placeholder="{$label28}" name="{$id28}">{if isset($datos.p28)}{$datos.p28}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="page-header">
          <h3>¿Qué alimentos comía con frecuencia de joven?</h3>
        </div>
        <label for="{$id29}">{$label29}</label>
        <textarea class="form-control input-lg" id="{$id29}" placeholder="{$label29}" name="{$id29}">{if isset($datos.p29)}{$datos.p29}{/if}</textarea>
        <label for="{$id30}">{$label30}</label>
        <textarea class="form-control input-lg" id="{$id30}" placeholder="{$label30}" name="{$id30}">{if isset($datos.p30)}{$datos.p30}{/if}</textarea>
        <label for="{$id31}">{$label31}</label>
        <textarea class="form-control input-lg" id="{$id31}" placeholder="{$label31}" name="{$id31}">{if isset($datos.p31)}{$datos.p31}{/if}</textarea>
        <label for="{$id32}">{$label32}</label>
        <textarea class="form-control input-lg" id="{$id32}" placeholder="{$label32}" name="{$id32}">{if isset($datos.p32)}{$datos.p32}{/if}</textarea>
        <label for="{$id33}">{$label33}</label>
        <textarea class="form-control input-lg" id="{$id33}" placeholder="{$label33}" name="{$id33}">{if isset($datos.p33)}{$datos.p33}{/if}</textarea>
      </div>
    </div>
  </div>
  <div class="form-group col-md-12">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="page-header">
          <h3>¿Qué tipo de alimentos come hoy en día?</h3>
        </div>
        <label for="{$id34}">{$label34}</label>
        <textarea class="form-control input-lg" id="{$id34}" placeholder="{$label34}" name="{$id34}">{if isset($datos.p34)}{$datos.p34}{/if}</textarea>
        <label for="{$id35}">{$label35}</label>
        <textarea class="form-control input-lg" id="{$id35}" placeholder="{$label35}" name="{$id35}">{if isset($datos.p35)}{$datos.p35}{/if}</textarea>
        <label for="{$id36}">{$label36}</label>
        <textarea class="form-control input-lg" id="{$id36}" placeholder="{$label36}" name="{$id36}">{if isset($datos.p36)}{$datos.p36}{/if}</textarea>
        <label for="{$id37}">{$label37}</label>
        <textarea class="form-control input-lg" id="{$id37}" placeholder="{$label37}" name="{$id37}">{if isset($datos.p37)}{$datos.p37}{/if}</textarea>
        <label for="{$id38}">{$label38}</label>
        <textarea class="form-control input-lg" id="{$id38}" placeholder="{$label38}" name="{$id38}">{if isset($datos.p38)}{$datos.p38}{/if}</textarea>
      </div>
    </div>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id39}">{$label39}</label><br>
    <textarea class="form-control input-lg" id="{$id39}" placeholder="{$label39}" name="{$id39}">{if isset($datos.p39)}{$datos.p39}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id40}">{$label40}</label><br>
    <textarea class="form-control input-lg" id="{$id40}" placeholder="{$label40}" name="{$id40}">{if isset($datos.p40)}{$datos.p40}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id41}">{$label41}</label><br>
    <textarea class="form-control input-lg" id="{$id41}" placeholder="{$label41}" name="{$id41}">{if isset($datos.p41)}{$datos.p41}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id42}">{$label42}</label><br>
    <textarea class="form-control input-lg" id="{$id42}" placeholder="{$label42}" name="{$id42}">{if isset($datos.p42)}{$datos.p42}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id43}">{$label43}</label><br>
    <textarea class="form-control input-lg" id="{$id43}" placeholder="{$label43}" name="{$id43}">{if isset($datos.p43)}{$datos.p43}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id44}">{$label44}</label><br>
    <textarea class="form-control input-lg" id="{$id44}" placeholder="{$label44}" name="{$id44}">{if isset($datos.p44)}{$datos.p44}{/if}</textarea>
  </div>
  <div class="form-group col-md-12">
    <label for="{$id45}">{$label45}</label>
    <textarea class="form-control input-lg" id="{$id45}" placeholder="{$label45}" name="{$id45}">{if isset($datos.p45)}{$datos.p45}{/if}</textarea>
  </div>
  <button type="submit" class="btn btn-success btn-lg">Guardar</button>
</form>
{/if}
