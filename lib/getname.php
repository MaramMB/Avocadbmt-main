<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','bdmtproject');
	$id=$_GET['Id'];
    $sql="SELECT * FROM teachers where id='$id'";
	$result=$db->query($sql);

    if($result){
        echo "success";

    }
    else {
        echo "error";
    }


?>