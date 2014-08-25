$(document).ready(function(){


  if($("#tipoPerfil").val()==2){
    $("#wrapEmpresas").css("display","block");
  }

  wrapEmpresas

  $("#tipoPerfil").change(function(){

    tipoPerfil = $(this).val();

    if(tipoPerfil==2){
      $("#wrapEmpresas").fadeIn(500);
    }else{
      $("#wrapEmpresas").fadeOut(100);
    }

  });

});
