<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With");

	$conn = mysqli_connect('localhost','root','','bdmtproject');

	if (!$conn) {
		echo "Database connection faild";
	}
   $Id_Num=$_POST['Id_Num'];
   $Passward=sha1($_POST['Passward']);

	$query_user ="UPDATE usersacounts SET Passward = '$Passward' WHERE Id_Num = '$Id_Num'";
	$result_user = mysqli_query($conn,$query_user);

	if ($result_user) {
		echo json_encode("Success");
	}


?>