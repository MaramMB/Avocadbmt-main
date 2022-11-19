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
            $res = $result->fetch_assoc();
            if(!empty($res)){
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
            else echo json_encode("No Data Found");
        }
    }
    else {
        echo "error";
    }
    

?>