<?php
include_once('../clsHoja_verificacion.php');
include_once('../clsAccion.php');
include_once('../clsDetalle_accion.php');
include_once('../clsManipulacion_dilucion.php');
include_once('../clsMantenimiento_limpieza.php');
include_once('../clsControl_indice.php');
include_once('../clsLinea_genetica.php');
include_once('../clsViabilidad_celular.php');



$id_hoja=$_GET['id'];

$hoja_verificacion=New Hoja_verificacion();
$accion= New Accion();
$manipulacion_dilucion=New Manipulacion_dilucion();
$control_indice=New Control_indice();
$linea_genetica=New Linea_genetica();
$viabilidad_celular=New Viabilidad_celular();
$mantenimiento_limpieza=New Mantenimiento_limpieza();

$rpt_hoja=$hoja_verificacion->get_formulario_por_id($id_hoja);
$rpt_accion=$accion->get_formulario_por_id_hoja($id_hoja);
$rpt_manipulacion_dilucion=$manipulacion_dilucion->get_formulario_por_id_hoja($id_hoja);
$rpt_control_indice=$control_indice->get_formulario_por_id_hoja($id_hoja);
$rpt_viabilidad_celular=$viabilidad_celular->get_formulario_por_id_hoja($id_hoja);
$rpt_linea_genetica=$linea_genetica->get_formulario_por_id_hoja($id_hoja);
$rpt_mantenimiento_limpieza=$mantenimiento_limpieza->get_formulario_por_id_hoja($id_hoja);
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>AUDITORIA DE VACUNACION</title>
    

     <style type="text/css">
       #tabla_contenido,#tabla_puntuacion{
        border:1px solid #000; 
        margin: 5px;
        align-content: top;
        background: #d9ffcc;
       }
       #tabla_puntuacion
       {
        width: 350px;
       }
       th, #tr_cabecera{
         background-color: #4CAF50;
        color: white;
         border: 2px solid #000;

       }

        .a1 {width:905px; text-align: left; border: 0px;  position: relative;
        padding-left: 20px; }

        .gordo{

          width: 800px;
        }

        .border-lb {border: 0px 0px 0px 0px; border-width: 0 2px 2px 0px; text-align: left;}
        
        .xmen{width: 912px; border: 0px 0px 0px 0px; border-width: 0 0 2px 2px; text-align: left;}
        
        .foto1 {position: relative; background-color: #025522; left: 500px; top: 200px;    transform: translate(-50%, -50%);
    -webkit-transform: translate(-50%, -50%);}

          .foto2 {position: relative; background-color: #025522; left: 500px; top: 160px;
    transform: translate(-50%, -50%);
    -webkit-transform: translate(-50%, -50%);}

        .volve {height: 30px;}

        .fuu {height: 40px}

       #tr_cabecera>td
       {

        color: black;
       }
       #tabla_contenido tr ,#tabla_contenido tr td, #accion tr td,#manipulacion tr td,#control tr td
       {
        border: 1px solid #000;
        padding-left: 8px;

       }
        #irregularidades tr th
       {
        border: 0px solid #000;
        padding-left: 8px;
        width: 30px;

       }
       #irregularidades tr td
       {
        border: 2px solid #000;
        padding-left: 8px;
        border-bottom: 1px;
        order-left: 1px;
        width: 30px;
       
       }

       #vacunador tr{
        width: 5220px;

       }

       td{
        height: 40px;
     
       }
       div{
        height: 100%;
       }
       table
       {
        border-collapse: collapse;
       
       }
       body{
         font-family: arial;
       }
       #accion
       {
        width: 400px;
       }
       #ire ,#ire_l
       {
        border: 1px solid #000;
        text-align: center;
        padding: 0px;
       }
     </style>



  </head>
  <body>
    <header class="clearfix">
    <TABLE>
      <tr>
        <td>
          <img style="width: 50px; height: 50px" src="imagen/invetsa.png">
         </td>
         <td>
         <h2 align="center">INFORME DE AUDITORÍA DE VACUNACIÓN</h2>
         <h3 align="center">Inversion Veterinaria S.A.</h3>
        </td>
         <td style="text-align: right">
         <span style="margin-left: 50px">Codigo: <?php echo $rpt_sim->codigo;?>R.51 <br>
         Revision: <?php echo $rpt_sim->revision;?> 00<br></span>
        </td>
        </tr>
      <tr>
        <td style="text-align: left;">
         <b>Empresa: </b><?php echo $rpt_hoja->empresa; ?> años<br>
         <b>Granja: </b><?php echo $rpt_hoja->empresa; ?> años<br>
         <b>Unidad: </b><?php echo $rpt_hoja->unidad;?><br>
         <b>Responsable de Invetsa:</b> <?php echo $rpt_hoja->responsable_invetsa;?><br>
      </td>
        

        <td style="text-align: center;" colspan="2">
        <ul style="text-align: left; margin-left: 240px">
        <b> Fecha:</b> <?php echo $rpt_hoja->fecha; ?><br>
        <b>Hora ingreso:<?php echo $rpt_hoja->hora_ingreso; ?> </b> <br>
        <b>Hora salida:</b><?php echo $rpt_hoja->hora_salida; ?><br>
        <b> Responsable Incubadora:</b> <?php echo $rpt_hoja->responsable_incubadora; ?><br>
        </ul></td>
      </tr>

   </TABLE>

    </header>
    <main>
    <h3>1.- INSPECCION VISUAL</h3>
      <table id=tabla_contenido width="1000px">
          <tr id=tr_cabecera>
            
            <th colspan="4" style="background-color: #025522" class="fuu">Linea Genética</th>

            <tr style='background-color:#E7F3EB'>
              <td>Nro de nacimientos / semana</td>
              <td>$VALOR</td>
              <td colspan="4" >Ross - Cobb</td>
            </tr>
           
            <tr >
            <th colspan="4" style="background-color: #025522" class="fuu">Laboratorio de Preparación de Vacuna</th>
            </tr>

            <tr>
              <th class="volve">ESPERADO</th>
              <th>ENCONTRADO</th>
              <th>ESPERADO</th>
              <th>ENCONTRADO</th>
            </tr>
              
          
            <tr style='background-color:#E7F3EB'>
              <td >Temperatura 24 a 27°C</td>
               <td>$VALOR</td>
               <td>Humedad 65% HR</td>
               <td>$VALOR</td>
            </tr>

            <tr style='background-color:#E7F3EB'>
              <td >Ventilación Forzada</td>
              <td >$VALOR</td>
              <td >Presión Positiva</td>
              <td >$VALOR</td>

            </tr>

<?php echo "<tr style='background-color:#E7F3EB'>
              <td>Limpieza después de c/vacunación</td>
              <td>$VALOR</td>
              <td>Desinfección Post Limpieza</td>
              <td>$VALOR</td>
            </tr>";?>
          </tr>



 <th colspan="4" style="background-color: #025522" class="fuu">Equipo Invetsa-Temp y Otros</th>

            <tr class="volve">
              <th>ESPERADO</th>
              <th>ENCONTRADO</th>
              <th>ESPERADO</th>
              <th>ENCONTRADO</th>
            </tr>

            <tr style='background-color:#E7F3EB'>
              <td>Guantes y Lentes</td>
               <td>$VALOR</td>
               <td>T°27 a 37°C(Promedio 32°C)</td>
               <td>$VALOR</td>
            </tr>

            <tr style='background-color:#E7F3EB'>
              <td>Rompe Ampollas</td>
              <td>$VALOR</td>
              <td>Jeringas 5 y/o 10ml</td>
              <td>$VALOR</td>

            </tr>

<?php echo "<tr style='background-color:#E7F3EB'>
              <td>hhNro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>
            </tr>";?>
          </tr>

           <tr style='background-color:#E7F3EB'>
              <td>Nro de nacimientos / semana</td>
               <td>2(M y S)</td>
               <td>Ross - Cobb</td>
               <td>Ross - Cobb</td>
            </tr>

            <tr style='background-color:#E7F3EB'>
              <td>Nro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td> Ross - Cobb</td>

            </tr>

<?php echo "<tr style='background-color:#E7F3EB'>
              <td>hhNro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>
            </tr>";?>
          </tr>

            <tr style='background-color:#E7F3EB'>
              <td>Nro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>

            </tr>

<?php echo "<tr style='background-color:#E7F3EB'>
              <td>hhNro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>
            </tr>";?>
          </tr>




<th colspan="4" style="background-color: #025522" class="fuu">Sala de Vacunación</th>

            <tr class="volve">
              <th>ESPERADO</th>
              <th>ENCONTRADO</th>
              <th>ESPERADO</th>
              <th>ENCONTRADO</th>
            </tr>

            <tr style='background-color:#E7F3EB'>
              <td>Nro de nacimientos / semana</td>
               <td>2(M y S)</td>
               <td>Ross - Cobb</td>
               <td>Ross - Cobb</td>
            </tr>

            <tr style='background-color:#E7F3EB'>
              <td>Nro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>

            </tr>

<?php echo "<tr style='background-color:#E7F3EB'>
              <td>hhNro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>
            </tr>";?>
          </tr>

           <tr style='background-color:#E7F3EB'>
              <td>Nro de nacimientos / semana</td>
               <td>2(M y S)</td>
               <td>Ross - Cobb</td>
               <td>Ross - Cobb</td>
            </tr>

            
           <tr style='background-color:#E7F3EB'>
              <td>Nro de nacimientos / semana</td>
               <td>2(M y S)</td>
               <td>Ross - Cobb</td>
               <td>Ross - Cobb</td>
            </tr>
       

      </table>
      <br>
      <?php 
        while ($fila_accion=mysqli_fetch_object($rpt_accion)) {
          echo "<table id=accion> 
          <tr>
          <th colspan=2>$fila_accion->nombre</th>
          </tr>";
      ?>
      
        <tr id=tr_cabecera>
          <td><b>ESPERADO</b></td>
          <td><b>ENCONTRADO</b></td>
        </tr>
        <?php
        $id_accion=$fila_accion->id;
        $rpt_detalle_accion=New Detalle_accion();
        $rpt_detalle_accion=$rpt_detalle_accion->get_formulario_por_id_hoja_y_id_accion($id_hoja,$id_accion);
          while ($fila=mysqli_fetch_object($rpt_detalle_accion)) {
          echo "
            <tr>
            <td>$fila->esperado</td>
            <td>$fila->encontrado</td>
            </tr>
          ";
          }
      
      echo "</TABLE><br>";
       } ?>


        <br>
    <hr>
          <table id=manipulacion> 
          <tr>
          <th colspan=4 style="background-color: #025522" class="fuu">MANIPULACION Y DILUCION DE LA VACUNA CONGELADA</th>
          </tr>
    
      
        <tr>
          <td colspan="4" style='background-color:#E7F3EB'><b>Asigna con (x)si el procedimiento estuviese siendo seguido:(Puntaje M&aacute;ximo 2.0) <b>
          <ol >
            <li>Verificación del nivel de nitrógeno en formato (mínimo 6 pulgadas), obligatorio los días de vacunación</li>
            <li>Diluyente usado en buenas condiciones rojo y transparente</li>
            <li>Jeringas descartables individuales para cada tipo de vacuna, colorante y antibiótico (no usan)</li>
            <li>Tiempo mínimo para añadir antibiótico y colorante antes de preparar la vacuna  15 minutos</li>
            <li>Uso de colorante y dosis de 0.5 ml para bolsas 200 y 400 ml , 1 ml para 800 ml y 1.5 ml para 1200 y 1600 ml</li>
            <li>Jeringa cargada con 2 ml de diluyente para extraer la vacuna ya descongelada</li>
            <li>Uso de guantes y protector ocular para manipulación de vacunas congeladas al retirar la vacuna del tanque</li>
            <li>Buenas condiciones de funcionamiento del Invetsa-temp de 27 a 37 º C (promedio 32º C)</li>
            <li>Número de ampollas retiradas por vez para descongelación, máximo 2 ampollas</li>
            <li>Tiempo máximo para descongelamiento de la ampolla de 1 minuto y reconstitución en diluyente 30 segundos</li>
            <li>Uso de pajilla de aluminio para descongelamiento de las ampollas en el agua, evita introducir la mano en el agua</li>
            <li>Favorecer el descongelamiento de la ampolla en forma suave (movimiento circulares y verticales)</li>
            <li>Secar las ampollas con papel toalla y usar el rompe ampollas</li>
            <li>Uso del soporte de ampollas, absorción y reconstitución de la vacuna en el diluyente suave y sin presión en Jeringa</li>
            <li>Uso de aguja adecuada para la extracción de la vacuna, 18 G x 1 ½” (color rosado)</li>
            <li>Realización de enjuague de ampollas (incluye cuerpo y tapa de la ampolla</li>
            <li>Secuencia correcta de preparación de la vacuna (antibiótico, colorante y 15 minutos después vacunas congeladas)</li>
            <li>Tiempo de consumo de la solución vacunal preparada máximo 45 minutos y homogenizar la vacuna cada 10 minutos</li>
            <li>Perfecta distribución de las mangueras que conducen la vacuna (levemente estiradas, evitando el 'efecto hamaca')</li>
            <li>Conteo celular - % de Viabilidad mayor a 86 %</li>
          </ol>
          </td>

            </tr>

          
          <td><b>PUNTAJE</b></td>
        </tr>
        <?php
          while ($fila=mysqli_fetch_object($rpt_manipulacion_dilucion)) {
          echo "
            <tr>
            <td>$fila->id</td>
            <td>$fila->descripcion</td>
            <td>$fila->puntaje</td>
            </tr>
          ";
          }
          echo "<tr id=tr_cabecera>
            <td></td>
            <td ><b>SUMATORIA</b></td>
            <td><b>$rpt_hoja->sumatoria_manipulacion_vacuna</b></td>
          </tr>";
        ?>
      </TABLE><br>
      <hr>

<h3>MANTENIMIENTO Y LIMPIEZA DE LAS VACUNADORAS ACCUVAC</h3>
     Asignar con una (x) kas irregularidades encontradas: (Puntaje Máximo Promedio 1.5)<br><br><br>  
          <table id=manteminimiento> 
          <t>
          <th style="background-color: #025522" colspan="10 ">Nombre del Vacunador</th>
          <th style="background-color: #025522" colspan="4">Nº de Maquina</th>
          <th colspan="15">
          <table id="irregularidades" >
          <th style="background-color: #025522" colspan="15" class="fuu">IRREGULARIDADES</th>
          <tr style="background-color: #025522" colspan="15" class="fuu">
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
            <td>10</td>
            <td>11</td>
            <td>12</td>
            <td>13</td>
            <td>14</td>
            <td>15</td>
            </tr></table>
          </th>
          </tr>

          <tr  >
          <th style="background-color:#E7F3EB" colspan="10"><font color="black">Caleft</font></th>
          <th style="background-color:#E7F3EB" colspan="4"><font color="black">Nº de Maquina</th>
          <th  style="background-color:#E7F3EB" colspan="15"><font color="black">
          <table id="irregularidades">
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
            <td>10</td>
            <td>11</td>
            <td>12</td>
            <td>13</td>
            <td>14</td>
            <td>15</td>
            </table>
          </th>
          </tr>

           <tr>
          <th style="background-color:#E7F3EB" colspan="10"><font color="black">Caleft</th>
          <th style="background-color:#E7F3EB" colspan="10"><font color="black">Nº de Maquina</th>
          <th style="background-color:#E7F3EB" colspan="15"><font color="black">
          <table id="irregularidades">
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
            <td>10</td>
            <td>11</td>
            <td>12</td>
            <td>13</td>
            <td>14</td>
            <td>15</td>
            </table>
          </th>
          </tr>

           <tr>
          <th style="background-color:#E7F3EB" colspan="10"><font color="black">Caleft</th>
          <th style="background-color:#E7F3EB" colspan="10"><font color="black">Nº de Maquina</th>
          <th style="background-color:#E7F3EB" colspan="15"><font color="black">
          <table id="irregularidades">
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
            <td>10</td>
            <td>11</td>
            <td>12</td>
            <td>13</td>
            <td>14</td>
            <td>15</td>
            </table>
          </th>
          </tr>

        </table>

        <br>
   
Promedio: 97<br>  
     
        <?php
          while ($fila=mysqli_fetch_object($rpt_mantenimiento_limpieza)) {
          echo "
            <tr>
            <td id=ire_l >$fila->vacunador</td>
            <td id=ire_l >$fila->nro_maquina</td>
            <td id=ire >$fila->irregularidad1</td>
            <td id=ire >$fila->irregularidad2</td>
            <td id=ire >$fila->irregularidad3</td>
            <td id=ire >$fila->irregularidad4</td>
            <td id=ire >$fila->irregularidad5</td>
            <td id=ire >$fila->irregularidad6</td>
            <td id=ire >$fila->irregularidad7</td>
            <td id=ire >$fila->irregularidad8</td>
            <td id=ire >$fila->irregularidad9</td>
            <td id=ire >$fila->irregularidad10</td>
            <td id=ire >$fila->irregularidad11</td>
            <td id=ire >$fila->irregularidad12</td>
            <td id=ire >$fila->irregularidad13</td>
            <td id=ire >$fila->irregularidad14</td>
            <td id=ire >$fila->irregularidad15</td>
             <td></td>
            </tr>
          ";
          }
         
        ?>
      
        
       
      </TABLE><br>



      <h3>IRREGULARIDADES</h3>
      1.-Acumulo de suciedad o puntos en sucios en la placa de sensores Twin Touch<br>
      2.-Falta de uno o mas tornillos visibles.<br>
      3.-Presi&oacute;n de aire comprimido fuera de rango recomendado(65-75 psi para Twin Shot/Zootec)<br>
      4.-Colocación incorrecta de la aguja (bisel hacia arriba)<br>
      5.-Inadecuada regulación de la salida de la aguja o agujas, que provoca que vacuna quede en la parte interna de la maquina.<br> 
6.-Colocación inadecuada de las jeringas y/o mangueras descartables.<br>
7.-Falta de calibración de la dosis 0.2 ml en Marek y 0.1 ml en Oleosas.<br> 
8.-No verificar la calibración de la dosis de la maquina cada 2,000 pollos vacunados.<br>
9.-No cumplen con el cambio de agujas de la maquina cada 2,000 pollos vacunados.<br>
10.-No tienen asperjadores con alcohol para la limpieza de la maquina cada 500 pollos vacunados.<br>
11.-No se lavan las manos y desinfectan antes de  realizar el cambio de agujas de las maquinas.<br>
12.-Acumulo de suciedad entre el modulo inyector y el modulo inferior de la maquina.<br>
13.-Desarmado incorrecto y lavado inadecuado de las maquinas, uso de detergente y material abrasivos.<br>
14.-Inadecuada esterilización de la válvula de control, debe ser a 121° C, a 15 psi de presión por 20 minutos envuelto en papel craf.<br>
15.-Otras irregularidades. Especificar : <b><?php echo $rpt_hoja->irregularidad_15;?></b><br>
      

<hr>

    
 <h3>CONTROL DE INDICE DE EFICIENCIA DE VACUNACIONY PRODUCTIVIDAD</h3>
     (Puntaje Máximo Índice de Eficiencia  5.5)     
          <table id=control> 
          <tr width="200" >
          <th width="150" style='background-color:#025522' >Nombre del Vacunador</th>
          <th width="150" style='background-color:#025522'>Nº Pollos Vacunados/Hora</th>
          <th width="150" style='background-color:#025522'>Puntaje</th>
          <th width="150" style='background-color:#025522'>Nº Pollos controlados</th>
          <th width="150" style='background-color:#025522'>Nº Pollos no vacunado</th>
          <th width="150" style='background-color:#025522'>Heridos</th>
          <th width="150" style='background-color:#025522'>Mojados</th>
          <th width="150" style='background-color:#025522'>Mala posición</th>
          <th width="150" style='background-color:#025522'>Nº Pollos vacunad correctame</th>
          <th width="150" style='background-color:#025522'>% de Eficiencia</th>
          </tr>

      <tr>
        <td style="background-color:#E7F3EB">Promedio</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
      </tr>
    
       <tr>
        <td style="background-color:#E7F3EB">Sumatoria</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
        <td style="background-color:#E7F3EB">0</td>
      </tr>
      

        
        <?php
          while ($fila=mysqli_fetch_object($rpt_control_indice)) {
          echo "
            <tr>
            <td>$fila->vacunador</td>
            <td>$fila->nro_pollos_vacunado</td>
            <td>$fila->puntaje</td>
            <td>$fila->nro_pollos_controlados</td>
            <td>$fila->nro_pollos_no_vacunados</td>
            <td>$fila->nro_heridos</td>
            <td>$fila->nro_mojados</td>
            <td>$fila->nro_mala_posicion</td>
            <td>$fila->nro_pollos_vacunados_correctamente</td>
             <td></td>
            </tr>
          ";
          }
         
        ?>
    
      </TABLE>
          
          <br>
          PUNTAJE:0  

<?php
echo "
<br>
<hr>
<br>

<table id=control>
<tr>
  <th colspan='2' style='background-color:#025522' class='fuu'> PUNTAJE TOTAL OBTENIDO</th>
</tr>
<tr>
  <td style='background-color:#E7F3EB'>MANIPULACION Y DILUCION DE LA VACUNA CONGELADA</td>
  <td style='background-color:#E7F3EB'> 0</td>
</tr>
<tr>
  <td style='background-color:#E7F3EB'>MANTENIMIENTO Y LIMPIEZA DE LAS VACUNADORAS ACCUVAC</td>
  <td style='background-color:#E7F3EB'> $rpt_hoja->promedio_mantenimiento</td>
</tr>
<tr>
  <td style='background-color:#E7F3EB'>INDICE DE EFICIENCIA DE VACUNACION</td>
  <td style='background-color:#E7F3EB'>$rpt_hoja->puntaje_control_indice</td>
</tr>
<tr>
  <td style='background-color:#E7F3EB'>PRODUCTIVIDAD</td>
  <td style='background-color:#E7F3EB'>$rpt_hoja->productividad</td>
</tr>
<tr>
  <td style='background-color:#E7F3EB'>PUNTAJE TOTAL </td>
  <td style='background-color:#E7F3EB'>$rpt_hoja->puntaje_total</td>
</tr>
</table>

<br>
<hr>
<h3>VIABILIDAD CELULAR</h3>
<table id=control>
<tr class='fuu'>
  <th style='background-color:#025522' width=250px>ANTIBIOTICO</th>
  <th style='background-color:#025522' width=250px>DOSIS</th>
  <th style='background-color:#025522' width=250px>TIEMPO (min)</th>
  <th style='background-color:#025522' width=250px>VC % </th>
</tr>

 <tr>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  </tr>

   <tr>
    <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  </tr>


   <tr>
    <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  </tr>

   <tr>
    <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  <th style='background-color:#E7F3EB'><p style=color:black;>0</th>
  </tr>


<table>
    <th class='xmen' style='background-color:#E7F3EB'><p style=color:black;>VC:Viabilidad Celular</th>
    <th class='border-lb' style='background-color:#E7F3EB' width=10%><p style=color:black;>100</th>
  </table>

  ";



while ($fila=mysqli_fetch_object($rpt_viabilidad_celular)) {
  echo "<tr>
      <td>$fila->id</td>
      <td>$fila->dosis</td>
      <td>$fila->tiempo</td>
      <td>$fila->vc</td>
    </tr>
  ";
}
echo"</table><br>

<hr>
<h3>RECOMENDACIONES</h3>
$rpt_hoja->recomendaciones
<br>

<hr>";





$src_imagen_jefe="";
$src_firma_invetsa="";
$src_firma_empresa="";
 if(file_exists("../".$rpt_hoja->firma_invetsa))
{
  $src_firma_invetsa="data:image/jpeg;base64,".file_get_contents("../".$rpt_hoja->firma_invetsa);
}
 if(file_exists("../".$rpt_hoja->firma_empresa))
{
  $src_firma_empresa="data:image/jpeg;base64,".file_get_contents("../".$rpt_hoja->firma_empresa);
}
if(file_exists("../".$rpt_hoja->imagen_jefe))
{
  $src_imagen_jefe="data:image/jpeg;base64,".file_get_contents("../".$rpt_hoja->imagen_jefe);
}

echo "<table id=tabla_contenido class='foto1'>
<tr>
<th>IMAGEN DEL RESPONSABLE</th>
</tr>
<tr>
<td>
<img src='imagen/invetsa.png' width=300px/>
</td>
</tr>
</table>
<br>
<br>
<br>
";

echo "<table id=tabla_contenido class='foto2'>
<tr>
<th>JEFE DE PLANTA DE INCUBACIÓN</th>
<th>FIRMA INVETSA</th>
</tr>
<tr>
<td>
<img src='imagen/invetsa.png' width=300px/>
</td>
<td>
<img src='imagen/invetsa.png' width=300px/>
</td>
</tr>
</table>
";
?>
    </main>
    
  </body>
 
</html>