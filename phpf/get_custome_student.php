<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','bdmtproject');

	if($db){

        $id=$_GET['id'];

        $sql ="SELECT * FROM students LEFT JOIN usersacounts ON students.Students_Id = usersacounts.Id_Num Where students.socid = $id";
        
        $result =mysqli_query($db , $sql);
        if($result){
            $i=0;
            while ($row=mysqli_fetch_assoc($result)){
                $response[$i]["name"]=$row["Society_Name"];
                $response[$i]["phone"]=$row["Society_Phone"];
                $response[$i]["address"]=$row["Society_Address"];
                $response[$i]["manager"]=$row["Society_Manager"];
                $response[$i]["email"]=$row["Email"];
                $i++;
            }
            echo json_encode($response , JSON_PRETTY_PRINT);

        }
    }
    else {
        echo "error";
    }
?>