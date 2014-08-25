<?php
class perfilController extends adminController{

  private $_modelo;
  public function __construct(){
    parent::__construct();
    $this->_modelo = $this->loadModel("perfil");
  }

  public function index(){
    $this->redireccionar("admin/perfil/datos");
    exit();
  }

  public function datos($id){
    $this->_view->assign("titulo","Datos personales");
    $this->_view->assign("frecuencias",$this->_modelo->getFrecuencias());
    $this->_view->assign("tipos_perfil",$this->_modelo->getTiposPerfil());
    $this->_view->assign("empresas",$this->_modelo->getEmpresas());
    $this->_view->assign("datos",$this->_modelo->getPerfil($id));
    $this->_view->assign("id",$id);

    $this->_view->setJs(array("perfil"));
    $btnHeader = array(
      array(
        "titulo" => "return",
        "enlace" => "admin/perfiles"
      ),

    );
    $this->_view->assign("btnHeader",$btnHeader);
    $this->_view->assign("perfil",$this->_modelo->getPerfil($id));

    if($this->getInt("actualizar")==1){

      //$this->_view->assign("datos",$_POST);
      $tipoPerfil            = $this->getInt("tipoPerfil");
      $idEmpresa             = "";
      $nombres               = $this->getSql("nombres");
      $apellidos             = $this->getSql("apellidos");
      $direccion             = $this->getSql("direccion");
      $email                 = $this->getSql("email");
      $frecuenciaEmail       = $this->getSql("frecuenciaEmail");
      $telefonoTrabajo       = $this->getInt("telefonoTrabajo");
      $telefonoCasa          = $this->getInt("telefonoCasa");
      $telefonoCelular       = $this->getInt("telefonoCelular");
      $edad                  = $this->getInt("edad");
      $estatura_metros       = $this->getSql("estatura_metros");
      $estatura_centimetros  = $this->getSql("estatura_centimetros");
      $centimetros           = $this->getSql("centimetros");
      $fechaNacimiento       = $this->getSql("fecha_nacimiento");
      $lugarNacimiento       = $this->getSql("lugar_nacimiento");


      $errores="";
        if ($tipoPerfil=="") {
          $errores.="Seleccione el tipo de perfil<br>";
        }

        if($tipoPerfil==2){
          $idEmpresa = $this->getInt("empresa");

          if($idEmpresa==""){
            $errores.="La empresa está vacía<br>";
          }

        }

        if ($nombres=="") {
          $errores.="El nombre está vacío<br>";
        }
        if ($apellidos=="") {
          $errores.="El apellido está vacío<br>";
        }
        if ($direccion=="") {
          $errores.="La dirección está vacía<br>";
        }
        if ($email=="") {
          $errores.="El correo electrónico está vacío<br>";
        }
        if ($telefonoTrabajo=="" || $telefonoCasa=="" || $telefonoCelular=="") {
          $errores.="Se necesita al menos un número teléfonico<br>";
        }
        if ($edad=="") {
          $errores.="Seleccione la edad<br>";
        }
        if ($estatura_metros=="" && $estatura_centimetros=="") {
          $errores.="Seleccione los rangos de estatura (metros y centímetros)<br>";
        }
        if ($fechaNacimiento=="") {
          $errores.="La fecha de nacimiento está vacía<br>";
        }
        if ($lugarNacimiento=="") {
          $errores.="El lugar de nacimiento está vacío<br>";
        }
        if ($errores!=="") {
          $this->_view->assign("_error",$errores);
          $this->_view->renderizar('datos',"perfiles");
          exit;
        }

        $datosEnviar = array(
          "id"                   =>$id,
          "id_tipoperfil"        =>$tipoPerfil,
          "id_empresa"           =>$idEmpresa,
          "nombres"              =>$nombres,
          "apellidos"            =>$apellidos,
          "direccion"            =>$direccion,
          "email"                =>$email,
          "frecuenciaEmail"      =>$frecuenciaEmail,
          "telefono_trabajo"     =>$telefonoTrabajo,
          "telefono_casa"        =>$telefonoCasa,
          "telefono_celular"     =>$telefonoCelular,
          "edad"                 =>$edad,
          "estatura_metros"      =>$estatura_metros,
          "estatura_centimetros" =>$estatura_centimetros,
          "fecha_nacimiento"     =>$fechaNacimiento,
          "lugar_nacimiento"     =>$lugarNacimiento,
          "fecha_creacion"       =>DATE_FORMAT
        );

        $this->_modelo->actualizarPerfil($datosEnviar);
        $this->_view->assign("_mensaje","El Perfil ha sido actualizado");
        $this->_view->assign("datos",$this->_modelo->getPerfil($id));
        $this->_view->renderizar("datos","perfiles");
        exit();
    }



    $this->_view->renderizar("datos","perfiles");
  }

  public function historial($id){
    $this->_view->assign("titulo","Historial clínico");
    $this->_view->setJs(array("perfil"));
    $this->_view->setCss(array("perfil"));

    $exiteHistorial = $this->_modelo->getIdPerfil($id);


    $existe = 1;
    if($exiteHistorial==""){

      $existe = 0;
      $this->_view->assign("existe",$existe);
    }

    $this->_view->assign("datos",$this->_modelo->getIdPerfil($id));
    $this->_view->assign("grupos_sanguineos",$this->_modelo->getGruposSanguineos());
    $this->_view->assign("existe",$existe);

    if($this->getSql("crear")==1){
      $datosEnviar = array(
        "id"                   => null,
        "id_perfil"            => $id
      );

      $this->_modelo->crearHistorial($datosEnviar);
      $this->redireccionar("admin/perfil/historial/".$id);
    }



    /**
      Preguntas
    */

    $preguntas = array(
      array("id" => 1,"label"   => "Peso actual"),
      array("id" => 2,"label"   => "Peso hace 6 meses"),
      array("id" => 3,"label"   => "Peso hace un año"),
      array("id" => 4,"label"   => "¿Le gustaría que su peso fuera diferente?"),
      array("id" => 5,"label"   => "¿Qué tanto?"),
      array("id" => 6,"label"   => "Estado civil"),
      array("id" => 7,"label"   => "¿Hijos?"),
      array("id" => 8,"label"   => "Alguna mascota?"),
      array("id" => 9,"label"  => "Profesión?"),
      array("id" => 10,"label"  => "Horas laborales"),
      array("id" => 11,"label"  => "¿Qué es lo que más le preocupa de su salud?"),
      array("id" => 12,"label"  => "¿En cuál momento de su vida se ha sentido mejor?"),
      array("id" => 13,"label"  => "¿Otras preocupaciones y/o metas?"),
      array("id" => 14,"label"  => "¿Ha tenido alguna enfermedad o lesión grave?¿Ha sido hospitalizado?"),
      array("id" => 15,"label"  => "¿Cómo está su madre de salud?"),
      array("id" => 16,"label"  => "¿Cómo está su padre de salud?"),
      array("id" => 17,"label"  => "¿Cuáles son sus antecedentes étnicos?"),
      array("id" => 18,"label"  => "¿Grupo sanguíneo?"),
      array("id" => 19,"label"  => "¿Duerme bien?"),
      array("id" => 20,"label"  => "¿Cuántas horas?"),
      array("id" => 21,"label"  => "¿Se despierta durante la noche?"),
      array("id" => 22,"label"  => "¿Por qué?"),
      array("id" => 23,"label"  => "¿Tiene dolor, rigidez, hinchazón?"),
      array("id" => 24,"label"  => "¿Extreñimiento, diarrega, gases?"),
      array("id" => 25,"label"  => "¿Tiene alguna alergia o algunas sensibilidades?"),
      array("id" => 26,"label"  => "¿Toma algún suplemento o medicamento?"),
      array("id" => 27,"label"  => "¿Tiene la ayuda de algún curador o ayudante? ¿Recibe algún tipo de terapia o tiene alguna mascota? De ser así, indíquelos"),
      array("id" => 28,"label"  => "¿Qué papel juegan los deportes y el ejercicio en su vida?"),
      array("id" => 29,"label"  => "Desayuno"),
      array("id" => 30,"label"  => "Almuerzo"),
      array("id" => 31,"label"  => "Cena"),
      array("id" => 32,"label"  => "Merienda"),
      array("id" => 33,"label"  => "Líquidos"),
      array("id" => 34,"label"  => "Desayuno"),
      array("id" => 35,"label"  => "Almuerzo"),
      array("id" => 36,"label"  => "Cena"),
      array("id" => 37,"label"  => "Merienda"),
      array("id" => 38,"label"  => "Líquidos"),
      array("id" => 39,"label"  => "¿Recibirá apoyo de su familia y/o de sus amistades con respecto a su deseo de hacer cambios en su manera de comer y/o estilo de vida?"),
      array("id" => 40,"label"  => "¿Qué porcentaje de su comida está hecha en casa?"),
      array("id" => 41,"label"  => "¿Usted cocina?"),
      array("id" => 42,"label"  => "¿Dónde consigue el resto?"),
      array("id" => 43,"label"  => "¿Le dan antojos de azúcar, café, cigarros o tiene alguna adicción fuerte?"),
      array("id" => 44,"label"  => "Los cambios primordiales que tendría que hacer con respecto a mi manera de comer para mejor mi salud serian:"),
      array("id" => 45,"label"  => "¿Alguna observación?"),
    );

    foreach($preguntas as $pregunta){
      $this->_view->assign("id".$pregunta["id"],"id_".$pregunta["id"]);
      $this->_view->assign("label".$pregunta["id"],$pregunta["label"]);
    }



    if($this->getInt("historial")==1){

      $valor_4   = $this->getSql("id_4");
      $valor_5   = $this->getSql("id_5");
      $valor_21  = $this->getSql("id_21");
      $valor_22  = $this->getSql("id_22");

      if($valor_4=="" || $valor_4=="x"){
        $valor_5 = "";
      }

      if($valor_21=="" || $valor_21=="x"){
        $valor_22 = "";
      }

      $datosEnviar = array(
        "id_perfil"   => $id,
        "p1"          => $this->getSql("id_".$preguntas[0]["id"]),
        "p2"          => $this->getSql("id_".$preguntas[1]["id"]),
        "p3"          => $this->getSql("id_".$preguntas[2]["id"]),
        "p4"          => $valor_4,
        "p5"          => $valor_5,
        "p6"          => $this->getSql("id_".$preguntas[5]["id"]),
        "p7"          => $this->getSql("id_".$preguntas[6]["id"]),
        "p8"          => $this->getSql("id_".$preguntas[7]["id"]),
        "p9"          => $this->getSql("id_".$preguntas[8]["id"]),
        "p10"         => $this->getSql("id_".$preguntas[9]["id"]),
        "p11"         => $this->getSql("id_".$preguntas[10]["id"]),
        "p12"         => $this->getSql("id_".$preguntas[11]["id"]),
        "p13"         => $this->getSql("id_".$preguntas[12]["id"]),
        "p14"         => $this->getSql("id_".$preguntas[13]["id"]),
        "p15"         => $this->getSql("id_".$preguntas[14]["id"]),
        "p16"         => $this->getSql("id_".$preguntas[15]["id"]),
        "p17"         => $this->getSql("id_".$preguntas[16]["id"]),
        "p18"         => $this->getSql("id_".$preguntas[17]["id"]),
        "p19"         => $this->getSql("id_".$preguntas[18]["id"]),
        "p20"         => $this->getSql("id_".$preguntas[19]["id"]),
        "p21"         => $valor_21,
        "p22"         => $valor_22,
        "p23"         => $this->getSql("id_".$preguntas[22]["id"]),
        "p24"         => $this->getSql("id_".$preguntas[23]["id"]),
        "p25"         => $this->getSql("id_".$preguntas[24]["id"]),
        "p26"         => $this->getSql("id_".$preguntas[25]["id"]),
        "p27"         => $this->getSql("id_".$preguntas[26]["id"]),
        "p28"         => $this->getSql("id_".$preguntas[27]["id"]),
        "p29"         => $this->getSql("id_".$preguntas[28]["id"]),
        "p30"         => $this->getSql("id_".$preguntas[29]["id"]),
        "p31"         => $this->getSql("id_".$preguntas[30]["id"]),
        "p32"         => $this->getSql("id_".$preguntas[31]["id"]),
        "p33"         => $this->getSql("id_".$preguntas[32]["id"]),
        "p34"         => $this->getSql("id_".$preguntas[33]["id"]),
        "p35"         => $this->getSql("id_".$preguntas[34]["id"]),
        "p36"         => $this->getSql("id_".$preguntas[35]["id"]),
        "p37"         => $this->getSql("id_".$preguntas[36]["id"]),
        "p38"         => $this->getSql("id_".$preguntas[37]["id"]),
        "p39"         => $this->getSql("id_".$preguntas[38]["id"]),
        "p40"         => $this->getSql("id_".$preguntas[39]["id"]),
        "p41"         => $this->getSql("id_".$preguntas[40]["id"]),
        "p42"         => $this->getSql("id_".$preguntas[41]["id"]),
        "p43"         => $this->getSql("id_".$preguntas[42]["id"]),
        "p44"         => $this->getSql("id_".$preguntas[43]["id"]),
        "p45"         => $this->getSql("id_".$preguntas[44]["id"]),
      );

      $this->_modelo->actualizarHistorial($datosEnviar);
      $this->_view->assign("_mensaje","El historial ha sido actualizado");
      $this->_view->assign("datos",$this->_modelo->getIdPerfil($id));
      $this->_view->assign("id",$id);
      $this->_view->renderizar("historial","perfiles");
      exit();
    }


    $this->_view->assign("id",$id);
    $this->_view->setJs(array("empresas"));
    $btnHeader = array(
      array(
        "titulo" => "return",
        "enlace" => "admin/perfiles"
      ),

    );
    $this->_view->assign("btnHeader",$btnHeader);
    //$this->_view->assign("empresas",$this->_modelo->getEmpresas());
    $this->_view->renderizar("historial","perfiles");
  }

  public function sesiones($id){
    $this->_view->assign("titulo","Sesiones");
    $this->_view->assign("id",$id);

    $this->_view->assign("sesiones",$this->_modelo->getSesiones($id));

    $this->_view->setJs(array("empresas"));
    $btnHeader = array(
      array(
        "titulo" => "return",
        "enlace" => "admin/perfiles"
      ),

    );
    $this->_view->assign("btnHeader",$btnHeader);
    //$this->_view->assign("empresas",$this->_modelo->getEmpresas());
    $this->_view->renderizar("sesiones","perfiles");
  }

  public function crear_sesion($id){
    $this->_view->assign("titulo","Crear sesión");
    $this->_view->setJs(array("sesiones"));
    $this->_view->assign("id",$id);
    $btnHeader = array(
      array(
        "titulo" => "return",
        "enlace" => "admin/perfil/sesiones/".$id
      ),

    );
    $this->_view->assign("btnHeader",$btnHeader);

    if($this->getInt("crear")==1){
    $this->_view->assign("datos",$_POST);

    $peso                 = $this->getInt("peso");
    $cintura              = $this->getInt("cintura");
    $porcentaje_grasa     = $this->getSql("porcentaje_grasa");
    $ausentismo           = $this->getSql("ausentismo");
    $cuantas_veces        = $this->getSql("cuantas_veces");
    $explique_ausentismo  = $this->getSql("explique_ausentismo");
    $satisfaccion_laboral = $this->getSql("satisfaccion_laboral");
    $accidentes_laborales = $this->getSql("accidentes_laborales");
    $explique_accidentes  = $this->getSql("explique_accidentes");
    $indice_de_masa          = $this->getSql("indice_de_masa");
    $horas_sueno          = $this->getInt("horas_sueno");
    $cafe                 = $this->getInt("cafe");
    $azucar               = $this->getInt("azucar");
    $refrescos            = $this->getInt("refrescos");
    $lacteos              = $this->getInt("lacteos");


    $errores="";
      if ($peso=="") {
        $errores.="Seleccione el peso<br>";
      }
      if ($cintura=="") {
        $errores.="Seleccione la medida de la cintura<br>";
      }
      if ($porcentaje_grasa=="") {
        $errores.="Seleccione el porcentaje de grasa<br>";
      }
      if ($ausentismo=="") {
        $errores.="Seleccione el ausentismo laboral<br>";
      }

      if($ausentismo==1){
        if($cuantas_veces==""){
          $errores.="Seleccione cuántas veces<br>";
        }
        if($explique_ausentismo==""){
          $errores.="Explique por qué el ausentismo laboral<br>";
        }
      }else{
        $cuantas_veces = "";
        $explique_ausentismo = "";
      }

      if ($satisfaccion_laboral=="") {
        $errores.="Seleccione satisfacción laboral<br>";
      }

      if ($accidentes_laborales=="") {
        $errores.="Seleccione accidentes laborales<br>";
      }

      if($accidentes_laborales==1){
        if($explique_accidentes==""){
          $errores.="Explicar los accidentes laborales no puede quedar vacío<br>";
        }
      }else{
        $explique_accidentes = "";
      }


      if ($indice_de_masa=="") {
        $errores.="Seleccione el índice de masa<br>";
      }
      if ($horas_sueno=="") {
        $errores.="Seleccione las horas de sueño<br>";
      }
      if ($cafe=="") {
        $errores.="Seleccione la cantidad de cafe<br>";
      }
      if ($azucar=="") {
        $errores.="Seleccione la cantidad de azucar<br>";
      }
      if ($refrescos=="") {
        $errores.="Seleccione la cantidad de refrescos<br>";
      }
      if ($lacteos=="") {
        $errores.="Seleccione la cantidad de lácteos<br>";
      }
      if ($errores!=="") {
        $this->_view->assign("_error",$errores);
        $this->_view->renderizar('crear_sesion',"perfiles");
        exit;
      }


      $datosEnviar = array(
        "id"                   =>null,
        "id_perfil"            =>$id,
        "peso"                 =>$peso,
        "cintura"              =>$cintura,
        "porcentaje_grasa"     =>$porcentaje_grasa,
        "ausentismo"           =>$ausentismo,
        "cuantas_veces"        =>$cuantas_veces,
        "explique_ausentismo"  =>$explique_ausentismo,
        "accidentes_laborales" =>$accidentes_laborales,
        "explique_accidentes"  =>$explique_accidentes,
        "satisfaccion_laboral" =>$satisfaccion_laboral,
        "indice_de_masa"       =>$indice_de_masa,
        "horas_sueno"          =>$horas_sueno,
        "cafe"                 =>$cafe,
        "azucar"               =>$azucar,
        "refrescos"             =>$refrescos,
        "lacteos"              =>$lacteos,
        "fecha_creacion"       =>DATE_FORMAT
      );

      $this->_modelo->crearSesion($datosEnviar);
      $this->_view->assign("_mensaje","La sesión ha sido creada");
      $this->_view->assign("datos","");
      $this->_view->renderizar("crear_sesion","perfiles");
      exit();
    }
    $this->_view->renderizar("crear_sesion","perfiles");
  }

  public function sesion($perfil, $sesion){
    $this->_view->assign("titulo","Sesión");
    $this->_view->setJs(array("sesiones"));
    $btnHeader = array(
      array(
        "titulo" => "return",
        "enlace" => "admin/perfil/sesiones/".$perfil
      ),

    );
    $this->_view->assign("btnHeader",$btnHeader);
    $this->_view->assign("id",$perfil);
    $this->_view->assign("datos",$this->_modelo->getSesion($sesion));


    if($this->getInt("actualizar")==1){
    //$this->_view->assign("datos",$_POST);

    $peso                 = $this->getInt("peso");
    $cintura              = $this->getInt("cintura");
    $porcentaje_grasa     = $this->getSql("porcentaje_grasa");
    $ausentismo           = $this->getSql("ausentismo");
    $cuantas_veces        = $this->getSql("cuantas_veces");
    $explique_ausentismo  = $this->getSql("explique_ausentismo");
    $satisfaccion_laboral = $this->getSql("satisfaccion_laboral");
    $accidentes_laborales = $this->getSql("accidentes_laborales");
    $explique_accidentes  = $this->getSql("explique_accidentes");
    $indice_de_masa       = $this->getSql("indice_de_masa");
    $horas_sueno          = $this->getInt("horas_sueno");
    $cafe                 = $this->getInt("cafe");
    $azucar               = $this->getInt("azucar");
    $refrescos            = $this->getInt("refrescos");
    $lacteos              = $this->getInt("lacteos");


    $errores="";
      if ($peso=="") {
        $errores.="Seleccione el peso<br>";
      }
      if ($cintura=="") {
        $errores.="Seleccione la medida de la cintura<br>";
      }
      if ($porcentaje_grasa=="") {
        $errores.="Seleccione el porcentaje de grasa<br>";
      }
      if ($ausentismo=="") {
        $errores.="Seleccione el ausentismo laboral<br>";
      }

      if($ausentismo==1){
        if($cuantas_veces==""){
          $errores.="Seleccione cuántas veces<br>";
        }
        if($explique_ausentismo==""){
          $errores.="Explique por qué el ausentismo laboral<br>";
        }
      }else{
        $cuantas_veces = "";
        $explique_ausentismo = "";
      }

      if ($satisfaccion_laboral=="") {
        $errores.="Seleccione satisfacción laboral<br>";
      }

      if ($accidentes_laborales=="") {
        $errores.="Seleccione accidentes laborales<br>";
      }

      if($accidentes_laborales==1){
        if($explique_accidentes==""){
          $errores.="Explicar los accidentes laborales no puede quedar vacío<br>";
        }
      }else{
        $explique_accidentes = "";
      }


      if ($indice_de_masa=="") {
        $errores.="Seleccione el índice de masa<br>";
      }
      if ($horas_sueno=="") {
        $errores.="Seleccione las horas de sueño<br>";
      }
      if ($cafe=="") {
        $errores.="Seleccione la cantidad de cafe<br>";
      }
      if ($azucar=="") {
        $errores.="Seleccione la cantidad de azucar<br>";
      }
      if ($refrescos=="") {
        $errores.="Seleccione la cantidad de refrescos<br>";
      }
      if ($lacteos=="") {
        $errores.="Seleccione la cantidad de lácteos<br>";
      }
      if ($errores!=="") {
        $this->_view->assign("_error",$errores);
        $this->_view->renderizar('crear_sesion',"perfiles");
        exit;
      }



      $datosEnviar = array(
        "id"                   =>$sesion,
        "peso"                 =>$peso,
        "cintura"              =>$cintura,
        "porcentaje_grasa"     =>$porcentaje_grasa,
        "ausentismo"           =>$ausentismo,
        "cuantas_veces"        =>$cuantas_veces,
        "explique_ausentismo"  =>$explique_ausentismo,
        "accidentes_laborales" =>$accidentes_laborales,
        "explique_accidentes"  =>$explique_accidentes,
        "satisfaccion_laboral" =>$satisfaccion_laboral,
        "indice_de_masa"       =>$indice_de_masa,
        "horas_sueno"          =>$horas_sueno,
        "cafe"                 =>$cafe,
        "azucar"               =>$azucar,
        "refrescos"             =>$refrescos,
        "lacteos"              =>$lacteos,
      );

      $this->_modelo->actualizarSesion($datosEnviar);
      $this->_view->assign("_mensaje","La sesión se ha actualizado");
      $this->_view->assign("datos",$this->_modelo->getSesion($sesion));
      $this->_view->renderizar("sesion","perfiles");
      exit();
    }

    $this->_view->renderizar("sesion","perfiles");
  }

  public function graficas($perfil){
    $this->_view->assign("titulo","Tabas y gráficas");
    $this->_view->setCss(array("graficas"));
    $this->_view->setJs(array("graficas"));
    $this->_view->assign("id_perfil",$perfil);
    $this->_view->assign("sesiones",$this->_modelo->getSesiones($perfil));
    $this->_view->renderizar("graficas","perfiles");
  }

  public function getDatosGraficas(){
    $id_perfil = $this->getSql("id");
    $celda     = $this->getSql("celda");
    $datos = $this->_modelo->getDatosGraficas($id_perfil,$celda);
    echo json_encode($datos);
  }

}
