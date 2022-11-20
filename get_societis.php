<?php 

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','bdmtproject');

	if($db){

       
        $sql ="select * from society";
        
    $result =mysqli_query($db , $sql);
    if($result){
        $i=0;
        while ($row=mysqli_fetch_assoc($result)){
            $response[$i]["id"]=$row["Id"];
            $response[$i]["Society_Id"]=$row["Society_Id"];
            $response[$i]["Society_Name"]=$row["Society_Name"];
            $response[$i]["Participation_Date"]=$row["Participation_Date"];
            $response[$i]["Society_Phone"]=$row["Society_Phone"];
            $response[$i]["Society_Address"]=$row["Society_Address"];
            $response[$i]["Society_Manager"]=$row["Society_Manager"];
            $i++;
        }
        echo json_encode($response , JSON_PRETTY_PRINT);
    }
    }
    else {
        echo "error";
    }
    

?>