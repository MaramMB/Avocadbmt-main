<?php

	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Methods: GET, POST');
	header("Access-Control-Allow-Headers: X-Requested-With");

	$db = mysqli_connect('localhost','root','','bdmtproject');
	if (!$db) {
		echo "Database connection faild";
	}
//for society
	$name = $_POST['name'];
	$sid = $_POST['sid'];
	$Society_Manager = $_POST['Society_Manager'];
	$date = $_POST['date'];
	$phone = $_POST['phone'];
	$address = $_POST['address'];

	$email = $_POST['email'];
	$pass = $_POST['pass'];
	$kind = $_POST['kind'] ?? 'manager';
	$active = $_POST['active'] ?? 'active';

	$select = mysqli_query($db, "SELECT * FROM `usersacounts` WHERE `Email`= '$email'");

	if(mysqli_num_rows($select)) {
		echo json_encode("email");
		exit();
	}


	$insert_user="INSERT INTO `usersacounts`(`Id_Num`,`Email`, `Passward`, `Kind`, `active`) VALUES ($sid,'$email', '$pass', '$kind', '$active');";
	$query_user = mysqli_query($db,$insert_user);

	if ($query_user) {
		$insert="INSERT INTO `society` (`Society_Id`, `Society_Name`, `Participation_Date`, `Society_Phone`, `Society_Address`, `Society_Manager`) VALUES ('$sid', '$name', '$date', '$phone', '$address', '$Society_Manager');";

		$query = mysqli_query($db,$insert);

		if ($query) {
			echo json_encode("Success");
		}
	}

?>