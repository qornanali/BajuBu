<?php

$server = "localhost";
$username = "root";
$password = "";
$database = "db_bajubu";

$connection = mysqli_connect($server, $username, $password, $database);

if (mysqli_connect_errno()){
  die("Failed to connect to Database : " . mysqli_connect_error());
}

?>
