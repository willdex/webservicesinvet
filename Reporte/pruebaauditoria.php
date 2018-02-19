<?php

ini_set('display_errors', '1');

include_once("mpdf/mpdf.php");

include_once('../clsHoja_verificacion.php');
include_once('../clsAccion.php');
include_once('../clsDetalle_accion.php');
include_once('../clsManipulacion_dilucion.php');
include_once('../clsMantenimiento_limpieza.php');
include_once('../clsControl_indice.php');
include_once('../clsLinea_genetica.php');
include_once('../clsViabilidad_celular.php');

rpt_hoja_verificacion("8");

function rpt_hoja_verificacion($id_verificacion)
{ 
    $html='';


$id_hoja=$_GET['id'];

$hoja_verificacion=New Hoja_verificacion();


$accion= New Accion();
$manipulacion_dilucion=New Manipulacion_dilucion();
$control_indice=New Control_indice();
$linea_genetica=New Linea_genetica();
$viabilidad_celular=New Viabilidad_celular();
$mantenimiento_limpieza=New Mantenimiento_limpieza();

$id_hoja=$id_verificacion;


$rpt_hoja=$hoja_verificacion->get_formulario_por_id($id_hoja);




$rpt_accion=$accion->get_formulario_por_id_hoja($id_hoja);
$rpt_manipulacion_dilucion=$manipulacion_dilucion->get_formulario_por_id_hoja($id_hoja);
$rpt_control_indice=$control_indice->get_formulario_por_id_hoja($id_hoja);
$rpt_viabilidad_celular=$viabilidad_celular->get_formulario_por_id_hoja($id_hoja);
$rpt_linea_genetica=$linea_genetica->get_formulario_por_id_hoja($id_hoja);
$rpt_mantenimiento_limpieza=$mantenimiento_limpieza->get_formulario_por_id_hoja($id_hoja);


$html.='<!DOCTYPE html>
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
        width: 50px;
       }
       th, #tr_cabecera{
         background-color: #4CAF50;
          color: white;
         border: 1px solid #000;

       }

       th, #tr_lab{
          border: 0px;

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

       #tr_cabecera
       {
        width: 1200px;
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
         <span style="margin-left: 50px">Codigo: '.$rpt_hoja->revision .'<br>
         Revision: <br>'.$rpt_hoja->revision .'</span>
        </td>
        </tr>
      <tr>
        <td style="text-align: left;">
         <b>Empresa: </b> '.$rpt_hoja->revision .'<br>
         <b>Granja: </b>'.$rpt_hoja->revision .'<br>
         <b>Unidad: </b>'.$rpt_hoja->revision .'<br>
         <b>Responsable de Invetsa:</b> '.$rpt_hoja->revision .'<br>
      </td>
        

        <td style="text-align: center;" colspan="8">
        <ul style="text-align: left; margin-left: 240px">
        <b> Fecha:</b> '.$rpt_hoja->revision .'<br>
        <b>Hora ingreso:'.$rpt_hoja->revision .' </b> <br>
        <b>Hora salida:</b>'.$rpt_hoja->revision .'<br>
        <b> Responsable Incubadora:</b> '.$rpt_hoja->revision .'<br>
        </ul></td>
      </tr>

   </TABLE>

    </header>

<main>
    <h3>1.- INSPECCION VISUAL</h3>
      <table id=tabla_contenido>
          <tr id=tr_cabecera>
            
            <th colspan="150" style="background-color: #025522" class="fuu">Linea Genética</th>

            <tr style=background-color:#E7F3EB >
              <td>Nro de nacimientos / semana</td>
              <td>$VALOR</td>
              <td colspan="20" >Ross - Cobb</td>
            </tr>
           
           <tr id=tr_cabecera>
            <th colspan="150" style="background-color: #025522" class="fuu">Laboratorio de Preparación de Vacuna</th>
            </tr>
            
           <tr style="background-color: #4CAF50" >
              <td style="color: white" align=center>ESPERADO</td>
              <td style="color: white"  align=center>ENCONTRADO</td>
              <td style="color: white"  align=center>ESPERADO</td>
              <td style="color: white" colspan="20" align=center>ENCONTRADO</td>
            </tr>
              
          
            <tr style=background-color:#E7F3EB>
              <td >Temperatura 24 a 27°C</td>
               <td>$VALOR</td>
               <td>Humedad 65% HR</td>
               <td colspan="20">$VALOR</td>
            </tr>

            <tr style=background-color:#E7F3EB>
              <td >Ventilación Forzada</td>
              <td >$VALOR</td>
              <td >Presión Positiva</td>
              <td colspan="20"></td>

            </tr>
                
              <tr style=background-color:#E7F3EB>
              <td>Limpieza después de c/vacunación</td>
              <td>$VALOR</td>
              <td>Desinfección Post Limpieza</td>
              <td colspan="20"></td>            </tr>
          </tr>


<tr>
 <th colspan="12" style="background-color: #025522" class="fuu">Equipo Invetsa-Temp y Otros</th></tr>

            <tr>
              <th>ESPERADO</th>
              <th>ENCONTRADO</th>
              <th>ESPERADO</th>
              <th>ENCONTRADO</th>
            </tr>

            <tr style=background-color:#E7F3EB>
              <td>Guantes y Lentes</td>
               <td>$VALOR</td>
               <td>T°27 a 37°C(Promedio 32°C)</td>
               <td>$VALOR</td>
            </tr>

            <tr style=background-color:#E7F3EB>
              <td>Rompe Ampollas</td>
              <td>$VALOR</td>
              <td>Jeringas 5 y/o 10ml</td>
              <td>$VALOR</td>

            </tr>

 "<tr stylebackground-color:#E7F3EB>
              <td>hhNro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>
            </tr>";?>
          </tr>

           <tr stylebackground-color:#E7F3EB>
              <td>Nro de nacimientos / semana</td>
               <td>2(M y S)</td>
               <td>Ross - Cobb</td>
               <td>Ross - Cobb</td>
            </tr>

            <tr stylebackground-color:#E7F3EB>
              <td>Nro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td> Ross - Cobb</td>

            </tr>

<?php echo "<tr stylebackground-color:#E7F3EB>
              <td>hhNro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>
            </tr>";?>
          </tr>

            <tr stylebackground-color:#E7F3EB>
              <td>Nro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>

            </tr>

<?php echo "<tr stylebackground-color:#E7F3EB>
              <td>hhNro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>
            </tr>";?>
          </tr>




<th colspan="12" style="background-color: #025522" class="fuu">Sala de Vacunación</th>

            <tr class="volve">
              <th>ESPERADO</th>
              <th>ENCONTRADO</th>
              <th>ESPERADO</th>
              <th>ENCONTRADO</th>
            </tr>

            <tr style=background-color:#E7F3EB>
              <td>Nro de nacimientos / semana</td>
               <td>2(M y S)</td>
               <td>Ross - Cobb</td>
               <td>Ross - Cobb</td>
            </tr>

            <tr style=background-color:#E7F3EB>
              <td>Nro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>

            </tr>

<?php echo "<tr style=background-color:#E7F3EB>
              <td>hhNro de nacimientos / semana</td>
              <td>2(M y S)</td>
              <td>Ross - Cobb</td>
              <td>Ross - Cobb</td>
            </tr>";?>
          </tr>

           <tr style=background-color:#E7F3EB>
              <td>Nro de nacimientos / semana</td>
               <td>2(M y S)</td>
               <td>Ross - Cobb</td>
               <td>Ross - Cobb</td>
            </tr>

            
           <tr style=background-color:#E7F3EB>
              <td>Nro de nacimientos / semana</td>
               <td>2(M y S)</td>
               <td>Ross - Cobb</td>
               <td>Ross - Cobb</td>
            </tr>
       

      </table>
      <br>
      
        while ($fila_accion=mysqli_fetch_object($rpt_accion)) {
          echo "<table id=accion> 
          <tr>"
                    <th colspan="12">$fila_accion->nombre</th>
          </tr>";
      
      
        <tr id=tr_cabecera>
          <td><b>ESPERADO</b></td>
          <td><b>ENCONTRADO</b></td>
        </tr>
        
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
      
      echo "</TABLE><br>
       } 



            ';







$mPDF=new mPDF("c","A4");
$mPDF->writeHTML($html);


//$mPDF->Output("reporte.pdf","D");
$mPDF->Output("reporte.pdf","I");
if(isset($_POST['descargar']))
{
  $mPDF->Output("reporte.pdf","D");
}
}

?>

