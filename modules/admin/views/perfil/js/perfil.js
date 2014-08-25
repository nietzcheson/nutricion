$(document).ready(function(){

  $("#id_4").change(function(){
    valor = $(this).val();
    if(valor==1){
      $("#wrapPeso").fadeIn(300);
    }else{
      $("#wrapPeso").fadeOut(300);
    }
  });

  $("#id_21").change(function(){
    valor = $(this).val();
    if(valor==1){
      $("#wrapDespierta").fadeIn(300);
    }else{
      $("#wrapDespierta").fadeOut(300);
    }
  });


  if($("#tipoPerfil").val()==2){
    $("#wrapEmpresas").css("display","block");
  }

  $("#tipoPerfil").change(function(){

    tipoPerfil = $(this).val();

    if(tipoPerfil==2){
      $("#wrapEmpresas").fadeIn(500);
    }else{
      $("#wrapEmpresas").fadeOut(100);
    }

  });




});
