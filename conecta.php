<?php
// Conectando, seleccionando la base de datos
$link = mysqli_connect('127.0.0.1', 'root', 'qw')
    or die('No se pudo conectar: ' . mysql_error());
echo 'Connected successfully';
$link->select_db('invetsa') or die('No se pudo seleccionar la base de datos');
?>
