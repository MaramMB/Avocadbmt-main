<?php
require 'connection copy.php';
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

$json = file_get_contents('php://input');
$data = json_decode($json, true);

    $id = $data["id"];
    $email = $data["email"];
    $phone = $data["Phone_Num"];

    echo $id . "\t" . $email;
    echo 'ok';

?>