<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','bdmtproject');
	if(!$db){
        echo "DB connection field";
        }

                       $Id_Num=$_POST['Id_Num'];
                       $Passward=sha1($_POST['Passward']);
                       $userData = array();

        $result = $db->query("SELECT * FROM usersacounts where Id_Num='$Id_Num'");
        $count = mysqli_num_rows($result);
        $sql = "SELECT * FROM usersacounts WHERE Passward='$Passward'";
        $queryresult = mysqli_query($db,$sql);
        $userData = mysqli_fetch_array($queryresult);
        $userData = mysqli_fetch_assoc($result);
            if ($count == 1) {
            echo json_encode($userData);
            }else{
            echo json_encode("Error");
            }

?>