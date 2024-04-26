<?php
// windows settings

$databaseHost = 'localhost';
$databaseUsername = 'root';
$databasePassword = '';
$databaseName = 'cdm-portal';

//linux settings
// $databaseHost = 'localhost';
// $databaseUsername = 'root1';
// $databasePassword = 'password';
// $databaseName = 'cdm-portal';

// Connect to the database
$mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName); 
?>