<?php 

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','bdmtproject');

	if($db){

       $id = $_GET["id"];
    
       $sql ="SELECT students.*, usersacounts.Email FROM students LEFT JOIN usersacounts ON students.Students_Id = usersacounts.Id_Num WHERE students.Students_Id = $id";
        
    $result =mysqli_query($db , $sql);
    if($result){
        $i=0;
        while ($row=mysqli_fetch_assoc($result)){
            $response[$i]["id"]=$row["Id"];
            $response[$i]["email"]=$row["Email"];
            $response[$i]["name"]=$row["firstname"];
            $response[$i]["dob"]=$row["DOB"];
            $response[$i]["age"]=(date('Y') - date('Y',strtotime($response[$i]["dob"])));
            $response[$i]["gender"]=$row["Gender"];
            $response[$i]["address"]=$row["Address"];
            $response[$i]["phone"]=$row["phone"];
            $response[$i]["father_name"]=$row["secname"];
            $response[$i]["father_phone"]=$row["phone"];
            $response[$i]["ptype"]=$row["ptype"];
            $response[$i]["image"]=$row["image"];
            $response[$i]["student_id"]=$row["Students_Id"];
            $i++;
        }
        echo json_encode($response , JSON_PRETTY_PRINT);
    }
    }
    else {
        echo "error";
    }
    

?>