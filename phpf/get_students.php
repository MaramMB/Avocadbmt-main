<?php 

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','bdmtproject');

	if($db){

        $id=$_GET['id'];

        $sql ="SELECT * FROM students LEFT JOIN usersacounts ON students.Students_Id = usersacounts.Id_Num LEFT JOIN parent ON parent.idnum = students.Students_Id Where students.socid = $id";
        
    $result =mysqli_query($db , $sql);
    if($result){
        $i=0;
        while ($row=mysqli_fetch_assoc($result)){
            $response[$i]["id"]=$row["Id"];
            $response[$i]["name"]=$row["firstname"];
            $response[$i]["dob"]=$row["DOB"];
            $response[$i]["address"]=$row["Address"];
            $response[$i]["phone"]=$row["phone"];
            $response[$i]["father_name"]=$row["secname"];
            $response[$i]["student_id"]=$row["Students_Id"];
            $response[$i]["active"]=$row["active"];
            $response[$i]["Email"]=$row["Email"];
            $response[$i]["Password"]=$row["Passward"];
            $response[$i]["familyname"]=$row["familyname"];
            $response[$i]["thirdname"]=$row["thirdname"];
            $response[$i]["tid"]=$row["tid"];
            $response[$i]["Gender"]=$row["Gender"];
            $response[$i]["ptype"]=$row["ptype"];
            $response[$i]["work"]=$row["work"];
            $response[$i]["fatherDob"]=$row["dob"];
            $response[$i]["mothername"]=$row["mothername"];
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