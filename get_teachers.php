<?php 

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','avocado');

	if($db){

       
        $sql ="select * from teachers";
        
    $result =mysqli_query($db , $sql);
    if($result){
        $i=0;
        while ($row=mysqli_fetch_assoc($result)){
            $response[$i]["id"]=$row["id"];
            $response[$i]["email"]=$row["email"];
            $response[$i]["name"]=$row["name"];
            $response[$i]["accountnumber"]=$row["accountnumber"];
            $response[$i]["gender"]=$row["gender"];
            $response[$i]["spec"]=$row["spec"];
            $response[$i]["phone"]=$row["phone"];
            $response[$i]["teachers_id"]=$row["teachers_id"];
            $i++;
        }
        echo json_encode($response , JSON_PRETTY_PRINT);
    }
    }
    else {
        echo "error";
    }
    

?>