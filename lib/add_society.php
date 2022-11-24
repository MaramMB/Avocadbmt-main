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
	$sid = $_POST['soid'];
	$Society_Manager = $_POST['Society_Manager'];
	$date = $_POST['Participation_Date'];
	$phone = $_POST['Society_Phone'];
	$address = $_POST['Society_Address'];

	$insert="INSERT INTO `society` (`Society_Id`, `Society_Name`, `Participation_Date`, `Society_Phone`, `Society_Address`, `Society_Manager`) VALUES ('$sid', '$name', '$date', '$phone', '$address', '$Society_Manager');";

	$query = mysqli_query($db,$insert);

	if ($query) {
		echo json_encode("Success");
	}


?>