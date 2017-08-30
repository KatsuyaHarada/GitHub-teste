<?php

$HOST = "localhost";

$USER = "root";
$PASSWORD = "root";

$DATABASE = "ControleVeiculosWEB";

$conn = new PDO('mysql:host=' . $HOST . ';dbname=' . $DATABASE, $USER , $PASSWORD);
?>