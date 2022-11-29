<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','bdmtproject');

	if($db){

       $id = $_GET["id"];
       $sql ="SELECT * FROM teachers WHERE id=$id";

    $result =mysqli_query($db , $sql);
    if($result){
        echo "success";

    }
    else {
        echo "error";
    }


?>