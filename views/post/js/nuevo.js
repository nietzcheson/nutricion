$(document).ready(function(){

	$("#form1").validate({
		rules:{
			titulo:{
				required: true
			},
			cuerpo:{
				required: true
			}
		},
		messages:{
			titulo:{
				required: "Debe poner el título"
			},
			cuerpo:{
				required: "Debe poner el cuerpo"
			}
		}
	});

});