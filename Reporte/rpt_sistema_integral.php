<?php
include_once("../clsSistema_integral.php");
include_once("../clsPuntuacion.php");
include_once("../clsDetalle_puntuacion.php");
include_once("../clsPeso.php");

$sistema_integral=New Sistema_integral();
$puntuacion= New Puntuacion();
$detalle_puntuacion=New Detalle_puntuacion();
$peso=New Peso();

$id_sistema=$_GET['id'];

$rpt_sim=$sistema_integral->get_formulario_por_id_sim($id_sistema);
$rpt_puntuacion=$puntuacion->get_formulario_puntuacion_por_id_sim($id_sistema);
$rpt_peso=$peso->get_formulario_peso_por_id_sim($id_sistema);
$rpt_detalle_puntuacion=$detalle_puntuacion->get_formulario_detalle_puntuacion_por_id_sim_y_puntuacion($id_sistema,$id_puntuacion);

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet"  href="mPDF/style.css">
    <meta charset="utf-8">
    <title>SISTEMA INTEGRAL DE MONITssOREO</title>
      
       
  </head>
  <body>
    <header class="clearfix">
    <TABLE class="titulo_tabla1">
      <tr>
        <td>
          <img style="width: 50px; height: 50px" src="imagen/invetsa.png">
          <img style="width: 50px; height: 50px" src="imagen/incuba.png">

         </td>
         <td>
         <h2 align="center">SIM (SISTEMA INTEGRAL DE MONITOREO)</h2>
         <h3 align="center">Invetsa Veterinaria S.A.</h3>
        </td>
        <td>
         Codigo: <?php echo $rpt_sim->codigo;?>R.50 <br>
         Revision: <?php echo $rpt_sim->revision;?> 00<br>
        </td>
      </tr>



      <tr class="titulo_espacio">
        <td style="text-align: left;">
         
         EMPRESA:<?php echo  $rpt_sim->id_sistema;?> <br>
         GRANJA:<?php echo $rpt_sim['granja']; ?><br>
         ZONA: <?php echo $rpt_sim->zona; ?> SCZ<br>
         GALPON: <?php echo $rpt_sim->codigo_galpon; ?> 20<br>
      </td>
        <td style="text-align: center;" colspan="2">
         <ul style="text-align: left; margin-left: 240px" >FECHA: <?php echo $rpt_sim->fecha; ?>2018-12-15<br>
         EDAD: <?php echo $rpt_sim->edad; ?> 24<br>
         SEXO: <?php echo $rpt_sim->sexo;?>Macho<br>
         Nro. de POLLOS: <?php echo $rpt_sim->nro_pollos; ?>30<br>
        </ul></td>
        </tr>
    </TABLE>
   </header>


<br>

    <main>
      <table id=tabla_contenido border="0.5" cellpadding="3" bordercolor="#000000">
          <tr >
            <th><font size="3">Peso Corporal</font></th>
            <th><font size="3">Peso Bursa</font> </th>
            <th><font size="3">Peso de Brazo</font> </th>
            <th><font size="3">Peso de Timo</font> </th>
            <th><font size="3">Peso de Higado</font> </th>
            <th><font size="3">Indice Bursal </font></th>
            <th><font size="3">Indice Timico</font></th>
            <th><font size="3">Indice Hepatico</font></th>
            <th><font size="3">Bursometro</font></th>
          </tr>
            
            <tbody>
            <tr><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><tr>
            <tr><tr><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td></tr>
            <tr><tr><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td></tr>
            <tr><tr><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td></tr>
            <tr><tr><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td><td>data</td></tr>
            <!--CUPLA RESULTADO ABAJO-->
            <tr bgcolor="5c59a0"><td><font color="fffff">data</font></td><td><font color="fffff">data</font></td><td><font color="fffff">data</font></td><td><font color="fffff">data</font>
            </td><td><font color="fffff">data</font></td><td><font color="fffff">data</font></td><td><font color="fffff">data</font></td><td><font color="fffff">data</font></td><td><font color="fffff">data</font></td></tr>
            
            </tbody>
          
          <?php

            if($rpt_peso!="-1"){
            while ($fila=mysqli_fetch_object($rpt_peso)) {
              if($fila->id=="6")
              {
                ?>
                <tr style="background:#a56;">
              <?php             
              }
              else
              {
                ?>
                <tr>
                <?php
              }
            echo "
                  <td>$fila->peso_corporal</td>
                  <td>$fila->peso_bursa</td>
                  <td>$fila->peso_brazo</td>
                  <td>$fila->peso_timo</td>
                  <td>$fila->peso_higado</td>
                  <td>$fila->indice_bursal</td>
                  <td>$fila->indice_timico</td>
                  <td>$fila->indice_hepatico</td>
                  <td>$fila->bursometro</td>
                  </tr>
                  ";
            }
          }
          ?>         
      </table>
      <table>
    

 <?php

            if($rpt_peso!="-1"){
              
            while ($objeto=mysqli_fetch_object($rpt_puntuacion)) {
              $bajo=$objeto->id % 2;
             
              if($bajo==1){
                echo "<tr>";
              }
                echo "<td>";
              echo "<div ><table id=tabla_puntuacion >";
              $rpt_detalle_puntuacion=$detalle_puntuacion->get_formulario_detalle_puntuacion_por_id_sim_y_puntuacion($id_sistema,$objeto->id);
              echo "
                <tr>
                <th colspan=2>
                $objeto->id $objeto->nombre
                </th>
                </tr>
              ";
              if($rpt_detalle_puntuacion!="-1"){
              while($fila=mysqli_fetch_object($rpt_detalle_puntuacion)){
            echo "
                  <tr>
                  <td>$fila->nombre</td>
                  <td>$fila->estado</td>
                  </tr>
                  ";
            }
          }
           echo "</table></div>";

          }
          if($bajo==0){
                echo "</tr>";
              }
              echo "</td>";
          }
          ?>     

</table>

<br>

<div class="seccion1-3">

    <div class="seccion1-3-contenido" >
      <div class="seccion-1-3-contenido2" >
           <h2>1.- Pico (asdasftas)</h2>
  <ul>
    <li style="text-align: left">Comisura<?php echo "<p align='center'>asaas</p>"; ?> </li>
 <li style="text-align: left;">Paladar Duro <input type="hidden" name="type" value="$var1" maxlength="3"></li>
  <li style="text-align: left">Paladar Blando<input type="hidden" name="type" value="$var1" maxlength="3">1</li>
  <li style="text-align: left">Necrosis de Lengua<input type="hidden" name="type" value="$var1" maxlength="3">1</li>
</ul>

</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
    <h2>2.-Petequias</h2>  
  <ul>
   <li style="text-align: left">Pechuga <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li style="text-align: left">Pierna <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li style="text-align: left">Esternon <input type="hidden" name="type" value="$var1" maxlength="3"></li>
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>3.-Tarsos</h2>
  <ul>
  <li style="text-align: left">Fragil <input type="hidden" name="type" value="$var1" maxlength="3">l</li>
              <li style="text-align: left">Flexible <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li style="text-align: left">Duro <input type="hidden" name="type" value="$var1" maxlength="3"></li>
</ul>
</div>
</div>

<div class="seccion1-3">

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
<h2>4.- Relación Morfo métrica Bursa/Bazo</h2>
  <ul>
 <li>A favor de la Bursa <input type="hidden" name="type" value="$var1" maxlength="3"></li> 
              <li>A favor del Bazo <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Relacion 1/1 <input type="hidden" name="type" value="$var1" maxlength="3"></li>
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>5.-Apariencia de los pliegues de la Bursa</h2>
  <ul>
 <li>Normal <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Anormal <input type="hidden" name="type" value="$var1" maxlength="3"></li>
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>6.-Tamaño y apariencia del timo</h2>
  <ul>
 <li>Normal <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Anormal <input type="hidden" name="type" value="$var1" maxlength="3"></li>
</ul>
</div>
</div>


<div class="seccion1-3">

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>7.-Sacos Aereos</h2>
  <ul>
<li>Normales <input type="hidden" name="type" value="$var1" maxlength="3"></li> 
              <li>Aerosaculitis Abdominal <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Aereosaculitis Toracica <input type="hidden" name="type" value="$var1" maxlength="3"></li>
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>8.-Traquea</h2>
  <ul>
   <li>Normal <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Congestionada <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Hemorragica <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Con Mucosidad <input type="hidden" name="type" value="$var1" maxlength="3"></li>
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>9.-Cornetes Nasales</h2>
  <ul>
  <li>Normal <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Congestionada <input type="hidden" name="type" value="$var1" maxlength="3"></
</ul>
</div>
</div>


<div class="seccion1-3">

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>10.-Higados</h2>
  <ul>
  <li>Normal <input align="center" type="" name="type" value="10" maxlength="3"></li> 
              <li>Inflamado <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Pálido y Fiable <input type="hidden" name="type" value="$var1" maxlength="3"></li>
             <li>Moteado<input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Punto de Exudado<input type="hidden" name="type" value="$var1" maxlength="3"></li>
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>11.-Vesicula Biliar</h2>
  <ul>
    <li>Llena <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Vacia <input type="hidden" name="type" value="$var1" maxlength="3"></li>
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>12.-Proventriculo</h2>
  <ul>
 <li>Normal <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Proventriculitis <input type="hidden" name="type" value="$var1" maxlength="3"
</ul>
</div>
</div>

<div class="seccion1-3">

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>13.-Ulceracion de Mollejas</h2>
  <ul>
              <li>Grado <input type="hidden" name="type" maxlength="3" align="center">Cantidad</li> 
              <li>0 <input type="" name="type" value="8" maxlength="3" align="center">0</li> 
              <li>1 <input type="hidden" name="type" value="$var1" maxlength="3">0</li>
              <li>2<input type="hidden" name="type" value="$var1" maxlength="3">0</li>
              <li>3<input type="hidden" name="type" value="$var1" maxlength="3">0</li>
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>14.-Intestinos</h2>
  <ul>
   <li>Normal <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Enteritis(yeyuno) <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Equimosis <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Desp. Mucosa <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Enteritis Mucoide <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Transito Rapido <input type="hidden" name="type" value="$var1" maxlength="3"></li>
              <li>Gas/Espuma <input type="hidden" name="type" value="$var1" maxlength="3"></li
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>15.-Coccida</h2>
  <ul>
<li>Acervulina <input type="" name="type" value="8" maxlength="3" align="center"></li> 
              <li>Maxima <input type="" name="type" value="8" maxlength="3" align="center"></li> 
              <li>Tenella <input type="" name="type" value="8" maxlength="3" align="center"></li> 
              <li>Necratix <input type="" name="type" value="8" maxlength="3" align="center"></li> 
</div>
</div>


<div class="seccion1-3">

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>16.-Ciegos(contenido)</h2>
  <ul>
<li>Normales <input type="hidden" name="type" value="$var1" maxlength="3"></li> 
             <li>Normal<input type="" name="type" value="8" maxlength="3" align="center"></li> 
              <li>Tiflitis erosiva <input type="" name="type" value="8" maxlength="3" align="center"></li> 
              <li>Placas Diftericas <input type="" name="type" value="8" maxlength="3" align="center"></li> 
              <li>Gaseosos (cont)<input type="" name="type" value="8" maxlength="3" align="center"></li> 
              <li>Sangre (cont)<input type="" name="type" value="8" maxlength="3" align="center"></li> 
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>17.-Tonsillas lleocecales</h2>
  <ul>
  <li>Reactiva <input type="" name="type" value="8" maxlength="3" align="center"></li> 
              <li>No Reactiva <input type="" name="type" value="8" maxlength="3" align="center"></li> 
</ul>
</div>
</div>

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>18.-Placas de peyer</h2>
  <ul>
<li>Reactiva <input type="" name="type" value="8" maxlength="3" align="center"></li> 
              <li>No Reactiva <input type="" name="type" value="8" maxlength="3" align="center"></li> 
</div>
</div>


<div class="seccion1-3">

    <div class="seccion1-3-contenido">
      <div class="seccion-1-3-contenido2">
              <h2>19.-Necrosis cabeza de femur</h2>
  <ul>
<li>Presencia<input type="" name="type" value="8" maxlength="3" align="center"></li> 
              <li>Ausencia <input type="" name="type" value="8" maxlength="3" align="center"></li> 
</ul>
</div>
</div>


   



</div>
<ul>
<b>Observaciones:</b><br>
<?php echo $rpt_sim->observaciones;?>
<br>
<br>
<b>Comentarios:</b><br>
<?php echo $rpt_sim->observaciones;?>
<br>
<br>
</ul>


<?php
if(file_exists("../".$rpt_sim->firma_invetsa))
{
  $contenido="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->firma_invetsa);


  
echo "<img src='$contenido'>";
}
else
{
  echo "no existe";
}
?>
   </main>

<div class="seccion1-3">
<ul class="galeria"><h3 align="center">Reporte de Imagenes</h3>
</ul>
  
  <ul class="galeria">
    <li><a href="#img1"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
    <li><a href="#img2"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
    <li><a href="#img3"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
    <li><a href="#img4"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
    <li><a href="#img5"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
    
  </ul>

  <ul class="galeria">
    <li><a href="#img6"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
    <li><a href="#img7"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
    <li><a href="#img8"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
    <li><a href="#img9"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
    <li><a href="#img10"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
    

  </ul>

</div>


<div class="seccion1-3">
<ul class="galeria"><h3 align="center">Imagen del Responsabe</h3>
  
  <ul class="galeria">
    <li><a href="#img1"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
  </ul>
</div>

<div class="seccion1-3">
  <ul class="galeria">


        <li><a href="#img1"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>
        <li><a href="#img1"><img src="http://neo-deco.es/wp-content/uploads/2013/01/Paisaje-de-monta%C3%B1a.jpg"></a></li>

  </ul>
</div>

    <footer>
  
      Invoice was created on a computer and is valid without the signature and seal.
    </footer>
  </body>
 
</html>