$(document).ready(function(){


$("#ausentismo").change(function(){
  ausentismo = $(this).val();

  if(ausentismo==1){
    $("#cuantas_veces").attr("disabled",false);
    $("#por_que").fadeIn(300);
  }else{
    $("#cuantas_veces").attr("disabled",true);
    $("#por_que").fadeOut(100);
  }
});

$("#accidentes_laborales").change(function(){
  accidentes = $(this).val();

  if(accidentes==1){
    $("#explique_accidentes").fadeIn(300);
  }else{
    $("#explique_accidentes").fadeOut(100);
  }
});


});
