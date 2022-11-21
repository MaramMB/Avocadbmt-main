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
	$phone = $_POST['Phone_Num'];
	$accountnumber = $_POST['accountnum'];
	$gender = $_POST['gender'];
	$spec = $_POST['specialization'];
	$Society_Id = $_POST['Society_Id'] ?? 100;

	//for user account
	$email = $_POST['email'];
	$pass = $_POST['password'];
	$kind = $_POST['kind'] ?? 'manager';
	$active = $_POST['active'] ?? 'active';



	$insert_user="INSERT INTO `usersacounts`(`Id_Num`,`Email`, `Passward`, `Kind`, `active`) VALUES ($Id_Num,'$email', '$pass', '$kind', '$active');";
	$query_user = mysqli_query($db,$insert_user);

	$insert="INSERT INTO `teachers` (`Id_Num`, `name`, `Phone_Num`, `accountnum`, `specialization`, `gender`, `Society_Id`) VALUES ($Id_Num, '$name', $phone, $accountnumber, '$spec', '$gender', $Society_Id);";
	$query = mysqli_query($db,$insert);


	if ($query && $query_user) {
		echo json_encode("Success");
	}


?>
