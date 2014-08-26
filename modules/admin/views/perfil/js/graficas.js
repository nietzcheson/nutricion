$(document).ready(function(){


  /**
    Peso
  */
  var graficas = function(celda,math_round){
    if(!math_round){
      math_round = 100;
    }

    id = $("#id_sesion").attr("id_sesion");
    ruta = _root_+"admin/perfil/getDatosGraficas";
    variables = "celda="+celda+"&id="+id;

    $.post(ruta,variables,function(datos){
      nombreSesiones = [];
      datosSesion = [];
      posicion = 0;
      contador = datos.length;
      anchura = contador * 100;
      //alert("#"+celda);
      $("#"+celda).attr("width",anchura)

      for(i=0;i<datos.length;i++){
        nombreSesiones[posicion] = "Sesión "+[i+1];
        datosSesion[posicion] = datos[i][celda];
        posicion++;
      }

      sesiones = nombreSesiones;
      datos = datosSesion;

      var randomScalingFactor = function(){ return Math.round(Math.random()*math_round)};
      var lineChartData = {
        labels : sesiones,
        datasets : [
          // {
          //   label: "My First dataset",
          //   fillColor : "rgba(220,220,220,0.2)",
          //   strokeColor : "rgba(220,220,220,1)",
          //   pointColor : "rgba(220,220,220,1)",
          //   pointStrokeColor : "#fff",
          //   pointHighlightFill : "#fff",
          //   pointHighlightStroke : "rgba(220,220,220,1)",
          //   //data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
          //   data: datos
          // },
          {
            label: "My Second dataset",
            fillColor : "rgba(151,187,205,0.2)",
            strokeColor : "rgba(151,187,205,1)",
            pointColor : "rgba(151,187,205,1)",
            pointStrokeColor : "#fff",
            pointHighlightFill : "#fff",
            pointHighlightStroke : "rgba(151,187,205,1)",
            //data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
            data: datos
        },
          // {
          //   label: "My Second dataset",
          //   fillColor : "rgba(151,187,205,0.2)",
          //   strokeColor : "rgba(151,187,205,1)",
          //   pointColor : "rgba(151,187,205,1)",
          //   pointStrokeColor : "#fff",
          //   pointHighlightFill : "#fff",
          //   pointHighlightStroke : "rgba(151,187,205,1)",
          //   data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
          // }
        ]
      }

      var ctx = document.getElementById(celda).getContext("2d");
      window.myLine = new Chart(ctx).Line(lineChartData, {
        //responsive: true
      });

    },'json');


  }

  /*
    [id_tabla,math_round]
  */
  graficas("peso",100);
  graficas("cintura",100);
  graficas("porcentaje_grasa",100);
  graficas("indice_de_masa",100);
  graficas("horas_sueno",100);
  graficas("cafe",100);
  graficas("azucar",100);
  graficas("refrescos",100);
  graficas("cantidad_lacteo",100);

});
