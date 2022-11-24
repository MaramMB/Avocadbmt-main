<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','bdmtproject');

	if($db){

       $id = $_GET["id"];

       $sql ="SELECT students.*, usersacounts.Email FROM students LEFT JOIN usersacounts ON students.Id = usersacounts.Id_Num AND students.id = $id";

    $result =mysqli_query($db , $sql);
    if($result){
        $i=0;
        while ($row=mysqli_fetch_assoc($result)){
            $response[$i]["id"]=$row["Students_Id"];
            $response[$i]["name"]=$row["firstname"];
            $response[$i]["family_name"]=$row["secname"];
//             $response[$i]["image"]=$row["image"];
            $i++;
        }
        echo json_encode($response , JSON_PRETTY_PRINT);
    }
    }
    else {
        echo "error";
    }


?>