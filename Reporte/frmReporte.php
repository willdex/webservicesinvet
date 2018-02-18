<?php
ini_set('display_errors', '1');

include_once("mpdf/mpdf.php");

//sistema integral demonitoreo.
include_once("../clsSistema_integral.php");
include_once("../clsPuntuacion.php");
include_once("../clsDetalle_puntuacion.php");
include_once("../clsPeso.php");

//formulario twin shot,spravac y zootec
include_once ('../clsServicio_matenimiento.php');
include_once ('../clsInspeccion_visual.php');
include_once ('../clsInspeccion_funcionamiento.php');
include_once ('../clsDetalle_inspeccion_visual.php');
include_once ('../clsDetalle_inspeccion_funcionamiento.php');


rpt_sistema_integral("1");

//rpt_formulario_twin_shot("1");




 function rpt_sistema_integral($id_sim)
{
$html='';

$sistema_integral=New Sistema_integral();
$puntuacion= New Puntuacion();
$detalle_puntuacion=New Detalle_puntuacion();
$peso=New Peso();


$id_sistema=$id_sim;

$rpt_sim=$sistema_integral->get_formulario_por_id_sim($id_sistema);
$rpt_puntuacion=$puntuacion->get_formulario_puntuacion_por_id_sim($id_sistema);
$rpt_peso=$peso->get_formulario_peso_por_id_sim($id_sistema);





$html.='
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SISTEMA INTEGRAL DE MONITOREO</title>
     <style type="text/css">
      
      #tabla_contenido,#tabla_puntuacion{
        border:1px solid #000; 
        align-content: top;
        background: #d9ffcc;
        width: 100%;
       
               }
      
      #tabla_puntuacion2{
        border:1px solid #000; 
        align-content: top;
        color: black;
        background: #025522";
        width: 100%;
        text-align:center
        height: 240%;

             }

      #tabla_puntuacion3{
        border:1px solid #000; 
        align-content: top;
        color: white;
        background: #025522";
        width: 100%;
}
             #tabla_puntuacion4{
}


       th{
        background-color: #4CAF50;
        color: white;
        height: 50px;
        text-align: center;
        
       }
       
        #1{
        background-color: #4CAF50;
        color: white;
        height: 75px;
        width: 70px;
        text-align: center;
        font-size: 17px;
        font-family: Times New Roman", Times, serif;

       }

       #2{
        
        text-align: center;
        font-size: 17px;
        font-family: Times New Roman", Times, serif;

       }
       
      #izquierda{
       float: left;
       padding :10px;

     }
       #derecha{
        float: left;
       padding :10px;

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
        font-family: arial;
       }
       img
       {
         border: 0px solid #000;
       }
       h4{
          text-align: center;
          font-size: 20px;
          color: #5c59a0;
          border-color= red;

       }
       
       img.center {
 margin: auto;
    display: block; 


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
         <b >EMPRESA:</b>'.$rpt_sim->empresa.'  <br>
         <b>GRANJA:</b>'. $rpt_sim->granja .'<br>
         <b>EDAD: </b>'. $rpt_sim->edad .' años<br>
         <b >SEXO: </b>'. $rpt_sim->sexo.'<br>
        </td>

         <td style="text-align: center;"><b> ZONA:</b>'. $rpt_sim->zona .' <br>
         <b>GALPON:</b> '. $rpt_sim->codigo_galpon .'<br>
         <b>Nro. de POLLOS:</b> '. $rpt_sim->nro_pollos .'<br>
         <b>FECHA:</b> '. $rpt_sim->fecha .'<br>
        </td>

         <td width="50%" style="text-align: right;">        
         <b>Codigo:</b> R.50<br>
         <b>Revision:</b>00<br>
        </td>
      </tr>
   
             
      


    </TABLE>
     

     
    </header>
    <br>

    <main>
   
      <table  id=tabla_contenido>
          <tr>
            <th  id="1" style="background-color: #025522">Peso Corporal</th>
            <th  id="1" style="background-color: #025522">Peso Bursa</th>
            <th  id="1" style="background-color: #025522">Peso de Brazo </th>
            <th  id="1" style="background-color: #025522">Peso de Timo </th>
            <th  id="1" style="background-color: #025522">Peso de Higado </th>
            <th  id="1" style="background-color: #025522">Indice Bursal </th>
            <th  id="1" style="background-color: #025522">Indice Timico</th>
            <th  id="1" style="background-color: #025522">Indice Hepatico</th>
            <th  id="1" style="background-color: #025522">Bursometro</th>
          </tr>';
         

            if($rpt_peso!="-1"){
            while ($fila=mysqli_fetch_object($rpt_peso)) {
              if($fila->id=="6")
              {
                
               $html.=' <tr style="background:#61579c;">';
                       
              }
              else
              {
                
                $html.='<tr >';
                
              }

            $html.='
                  <td id="2">'.$fila->peso_corporal.'</td>
                  <td id="2">'.$fila->peso_bursa.'</td>
                  <td id="2">'.$fila->peso_brazo.'</td>
                  <td id="2">'.$fila->peso_timo.'</td>
                  <td id="2">'.$fila->peso_higado.'</td>
                  <td id="2">'.$fila->indice_bursal.'</td>
                  <td id="2">'.$fila->indice_timico.'</td>
                  <td id="2">'.$fila->indice_hepatico.'</td>
                  <td id="2">'.$fila->bursometro.'</td>
                  </tr >
                  ';
            }
          }
                 
    $html.='</table><br><table>';



            if($rpt_puntuacion!="-1"){
              
            while ($objeto=mysqli_fetch_object($rpt_puntuacion)) {
               $bajo=$objeto->id % 2;
               if($bajo==1){
                $html.='<br><tr>';
              }
              $html.='<td > <div id=div_tabla><table id="tabla_puntuacion2">';

              $rpt_detalle_puntuacion=$detalle_puntuacion->get_formulario_detalle_puntuacion_por_id_sim_y_puntuacion($id_sistema,$objeto->id);
              $html.='
                <tr>
                <th colspan=2 id="tabla_puntuacion3">'.
                $objeto->id.' '.$objeto->nombre.'
                

                </th>
                </tr>

              ';
              if($rpt_detalle_puntuacion!="-1"){
              while($fila=mysqli_fetch_object($rpt_detalle_puntuacion)){             
            $html.='

                  <tr style="background-color: #E7F3EB" >
                  <td id="tabla_puntuacion4" >'.$fila->nombre.'</td>
                  <td >'.$fila->estado.'</td>
                  </tr>

                  ';
            }
          }
           $html.='</table></div> </td>';
          if($bajo==1){
               $html.='</tr>';
              }
          }
          }
          
              
      $html.='</table><br>';
      $html.='<b>Referencia:</b><br>';
$html.= $rpt_sim->referencia.'<br>';
      $html.='<b>Observaciones:</b><br>';
$html.= $rpt_sim->observaciones.'<br>';
      $html.='<b>Comentarios:</b><br>';
$html.= $rpt_sim->comentarios.'<br>';
 
 if(file_exists("../".$rpt_sim->firma_invetsa))
{
  $src_firma_invetsa="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->firma_invetsa);
}
 if(file_exists("../".$rpt_sim->firma_empresa))
{
  $src_firma_empresa="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->firma_empresa);
}
if(file_exists("../".$rpt_sim->imagen1))
{
  $src_imagen1="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen1);
}
 if(file_exists("../".$rpt_sim->imegen2))
{
  $src_imegen2="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imegen2);
}
if(file_exists("../".$rpt_sim->imagen3))
{
  $src_imagen3="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen3);
}
 if(file_exists("../".$rpt_sim->imegen4))
{
  $src_imegen4="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imegen4);
}
if(file_exists("../".$rpt_sim->imagen5))
{
  $src_imagen5="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen5);
}
if(file_exists("../".$rpt_sim->imagen_jefe))
{
  $src_imagen_jefe="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen_jefe);
}

$html.='<th><h3>IMAGENES</h3></th>';
$html.="<img src='$src_imagen1' width=300px/><br>Imagen #1<br><br>";
$html.="<img src='$src_imagen2' width=300px/><br>Imagen #2<br><br>";
$html.="<img src='$src_imagen3' width=300px/><br>Imagen #3<br><br>";
$html.="<img src='$src_imagen4' width=300px/><br>Imagen #4<br><br>";
$html.="<img src='$src_imagen5' width=300px/><br>Imagen #5<br><br>";

$html.="<table id=tabla_contenido>
<tr>
<th>IMAGEN DE JEFE DE PLANTA</th>
</tr>
<tr>
<td>
<img src='$src_imagen_jefe' width=300px/>
</td>
</tr>
</table>
<br>
<br>
<br>
";

$html.="<table id=tabla_contenido>
<tr>
<th>FIRMA INVETSA</th>
<th>FIRMA EMPRESA</th>
</tr>
<tr>
<td>
<img src='$src_firma_invetsa' width=300px/>
</td>
<td>
<img src='$src_firma_empresa' width=300px/>
</td>
</tr>
</table>
";
   /*
if(file_exists("../".$rpt_sim->firma_invetsa))
{
  $contenido=file_get_contents("../".$rpt_sim->firma_invetsa);

header("Content-Type: image/png");
echo $contenido;
}
else
{
  echo "no existe";
}
?>
*/
$html.='
    <footer>
  
<td> <img src="imagen/pollito1.png" width="20%"></td>

    </footer>
  </body>
 
</html>
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

<form method="POST" action="frmReporte.php">
  <Input type="submit" value="Descargar" name="descargar"/>
</form>