<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "bdmtproject";
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) 
        { die("Connection failed: " . $conn->connect_error); }
    $conn-> set_charset("utf8");
?>
