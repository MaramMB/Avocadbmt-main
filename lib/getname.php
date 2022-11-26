<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','bdmtproject');

	if($db){

       $id = $_GET["id"];
       $sql ="SELECT `first_name` + " " + `last_name` as `whole_name` FROM `teachers`";

        //$sql ="SELECT teachers.*, usersacounts.Email FROM teachers LEFT JOIN usersacounts ON teachers.Id_Num = usersacounts.Id_Num AND teachers.Id_Num = $id";

    $result =mysqli_query($db , $sql);
    if($result){
        $i=0;
        while ($row=mysqli_fetch_assoc($result)){
            $response[$i]["id"]=$row["Id_Num"];
            $response[$i]["name"]=$row["Name"];
            $response[$i]["image"]=$row["image"];
            $i++;
        }
        echo json_encode($response , JSON_PRETTY_PRINT);
    }
    }
    else {
        echo "error";
    }


?>