<?php 

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

$db = mysqli_connect('localhost','root','','bdmtproject');

	if($db){
        $sql ="select * from teachers";

        $result =mysqli_query($db , $sql);
        if($result){
            $i=0;
            while ($row=mysqli_fetch_assoc($result)){
                $response[$i]["id"]=$row["Id"];
                $response[$i]["Id_Num"]=$row["Id_Num"];
                $response[$i]["name"]=$row["Name"];
                $response[$i]["accountnumber"]=$row["accountnum"];
                $response[$i]["gender"]=$row["gender"];
                $response[$i]["spec"]=$row["specialization"];
                $response[$i]["phone"]=$row["Phone_Num"];
                $response[$i]["Society_Id "]=$row["Society_Id"];
                $i++;
            }
            echo json_encode($response , JSON_PRETTY_PRINT);
        }
    }
    else {
        echo "error";
    }


?>