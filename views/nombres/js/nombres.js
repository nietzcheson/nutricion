$(document).ready(function(){

	var getGeneros = function(){
		$.post("/artesanus/ajax/getNombres","genero="+$('#genero').val(),function(datos){
			$("#nombre").html('');
			for(var i=0; i<datos.length;i++){
				$("#nombre").append("<option value='"+datos[i].id+"'>"+datos[i].ciudad+"</option>");
			}
		},'json');
	}

});