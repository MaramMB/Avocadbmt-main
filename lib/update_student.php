<?php 
require 'connection.php';


$json = file_get_contents('php://input');
$data = json_decode($json, true);

    $id = $data["id"];
    $email = $data["email"];
    $phone = $data["phone"];

    echo $id . "\t" . $email;
    echo 'ok';

?>