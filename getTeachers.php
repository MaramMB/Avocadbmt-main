<?php 

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','new_tasneem');

	if($db){

       $id = $_GET["id"];
    
       $sql ="SELECT teachers.*, usersacounts.Email FROM teachers LEFT JOIN usersacounts ON teachers.Id_Num = usersacounts.Id_Num AND teachers.Id_Num = $id";
        
    $result =mysqli_query($db , $sql);
    if($result){
        $i=0;
        while ($row=mysqli_fetch_assoc($result)){
            $response[$i]["id"]=$row["Id_Num"];
            $response[$i]["email"]=$row["Email"];
            $response[$i]["name"]=$row["Name"];
            $response[$i]["gender"]=$row["gender"];
            $response[$i]["phone"]=$row["Phone_Num"];
            $response[$i]["image"]=$row["image"];
            $response[$i]["accountnum"]=$row["accountnum"];
            $response[$i]["spec"]=$row["specialization"];

            $i++;
        }
        echo json_encode($response , JSON_PRETTY_PRINT);
    }
    }
    else {
        echo "error";
    }
    

?>