$(document).ready(function(){

  var eliminarEmpresa = function(){


    $.post(_root_+"empresas/eliminar","id="+id,function(datos){
      $("#"+id+"").fadeOut(200);
    },'json');



  }

  $("td .btn").click(function(){
    id = $(this).attr("id");
    confirmar = confirm("¿Estás seguro?");

    if(confirmar){
      eliminarEmpresa();
    }


  });

});
