<?php
ini_set('display_errors', '1');

include_once("mpdf/mpdf.php");

//formulario twin shot,spravac y zootec
include_once ('../clsServicio_matenimiento.php');
include_once ('../clsInspeccion_visual.php');
include_once ('../clsInspeccion_funcionamiento.php');
include_once ('../clsDetalle_inspeccion_visual.php');
include_once ('../clsDetalle_inspeccion_funcionamiento.php');

//rpt_sistema_integral("1");

rpt_servicio_mantenimiento("1");

function rpt_servicio_mantenimiento($id_inspeccion)
{ 
  $html='';


  $servicio_mantenimiento=New Servicio_Mantenimiento();

  $id_servicio_mantenimiento=$id_inspeccion;

  $rpt_inpeccion= $servicio_mantenimiento->get_formulario_por_id_y_maquina($id_servicio_mantenimiento);


  


$html.='
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SISTEMA INTEGRAL DE MONITOREO</title>
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
       th{
         background-color: #4CAF50;
    color: white;
     border: 2px solid #000;
        height: 50px;

       }
       #titutlo tr td{       
         border: 0px solid #000;
         
       }
       #tabla_contenido tr td ,#tabla_puntuacion tr td{
        height: 40px;
         border: 1px solid #000;
         padding-left: 7px;
         padding-right: : 7px;
       }
       

       div{
        height: 100%;
       }
       table
       {
        border-collapse: collapse;
        font-family: arial;
       }
     </style>
  </head>
  <body>
    <header class="clearfix">
    <table width="100%" style="border-bottom: 0px solid #fffff; vertical-align: middle; font-family: serif; font-size: 9pt; color: #5c59a0;"><tr>
<td width="10%"><img style="width: 30%" src="imagen/incuba.jpg"></td>
<td width="80%" align="center" text-shadow: "2px 2px 4px #000000;"> <span style="font-size:25pt;"  color="#5c59a0" >SIM (SISTEMA INTEGRAL DE MONITOREO)</td>
<td width="20%" style="text-align: right;" ><img style="width: 20%"  src="imagen/cabecera.png" ></td></table>
<td width="10%" style="text-align: right;"><span style="font-weight: bold;"><img style="width: 100%" src="imagen/principal.png"></span></td></table>

    <table class="bpmTopnTailC">

      <tr class="headerrow">
        
        <td class="evenrow" >
         <b >COMPAÑIA:</b>'.$rpt_inpeccion->compania.'  <br>
         <b>PLANTA DE INCUBACIÓN:</b>'.$rpt_inpeccion->planta_de_incubacion .'<br>
         <b>DIRECCIÓN: </b>'.$rpt_inpeccion->direccion .' <br>
         <b >JEFE DE PLANTA:</b>'.$rpt_inpeccion->jefe_planta.'  <br>
         <b>ENCARGADO DE MÁQUINAS:</b>'.$rpt_inpeccion->encargado_maquina .'<br>
        </td>

            <td class="evenrow" >
         <b >HORA DE INGRESO:</b>'.$rpt_inpeccion->hora_ingreso.'  <br>
         <b>HORA DE SALIDA:</b>'.$rpt_inpeccion->hora_salidas .'<br>
         <b>CÓDIGO MÁQUINA: </b>'.$rpt_inpeccion->codigo .' <br>
         <b >ULTIMA VISITA:</b>'.$rpt_inpeccion->ultima_visita.'  <br>
        </td>

      </tr>
                 
    </TABLE>';

    $html.='
       <main>
    <h3>1.- INSPECCION VISUAL</h3>
      <table id=tabla_contenido>
          <tr >
            <th>CODIGO</th>
            <th>DESCRIPCION</th>
            <th>BUENO </th>
            <th>MALO</th>
          </tr>
          <?php
          $rpt_inspeccion=mysqli_fetch_object($rpt_inspeccion_visual);
          $id_inspeccion_v=$rpt_inspeccion->id;
         $rpt_detalle_inspeccion_visual=New Detalle_inspeccion_visual();
            $rpt_detalle_inspeccion_visual=$rpt_detalle_inspeccion_visual->get_formulario_por_id_sm_y_id_inspeccion($id_servicio,$id_inspeccion_v);
            if($rpt_detalle_inspeccion_visual!="-1"){
            while ($fila=mysqli_fetch_object($rpt_detalle_inspeccion_visual)) {
             
            echo "<tr>
                  <td>$fila->codigo</td>
                  <td>$fila->descripcion</td>
                  <td>$fila->bueno</td>
                  <td>$fila->malo</td>
                  </tr>
                  ";
            }
          }
          ?>         
      </table>
      <br>

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

