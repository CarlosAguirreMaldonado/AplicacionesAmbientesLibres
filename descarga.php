<?php
$idObA=$_POST['id'];
$mysqli = new mysqli('localhost', 'root', '', 'sistemaoa');
$mysqli->set_charset("utf8");
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
if($mysqli->query("UPDATE objetoaprendizaje Set Ndescargas=Ndescargas+1 WHERE idOA=$idObA")===TRUE){
  echo "Record updated successfully";
  } else {
      echo "Error updating record: " . $mysqli->error;
  }

?>
