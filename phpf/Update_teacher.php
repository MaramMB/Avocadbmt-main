<?php

	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Methods: GET, POST');
	header("Access-Control-Allow-Headers: X-Requested-With");

	$db = mysqli_connect('localhost','root','','bdmtproject');

	if (!$db) {
		echo "Database connection faild";
	}

	//for teacher
	$Id_Num = $_POST['Id_Num'];
	$name = $_POST['Name'];
	$father_name = $_POST['secname'];
	$thirdname = $_POST['thirdname'];
	$familyname = $_POST['familyname'];
	$phone = $_POST['Phone_Num'];
	$accountnumber = $_POST['accountnum'];
	$gender = $_POST['gender'];
	$spec = $_POST['specialization'];
    $email = $_POST['email'];


	$query_std = "UPDATE teachers SET Name = '$name', secname = '$father_name', thirdname = '$thirdname', familyname = '$familyname', Phone_Num = $phone, accountnum = $accountnumber, gender = '$gender', specialization = '$spec' WHERE Id_Num = $Id_Num";
	$result_std = mysqli_query($db,$query_std);

	$query_user ="UPDATE usersacounts SET Email = '$email' WHERE Id_Num = $Id_Num";
	$result_user = mysqli_query($db,$query_user);

	if ($result_std && $result_user) {
		echo json_encode("Success");
	}


?>