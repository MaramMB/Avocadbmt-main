<?php

	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Methods: GET, POST');
	header("Access-Control-Allow-Headers: X-Requested-With");

	$db = mysqli_connect('localhost','root','','bdmtproject');

	if (!$db) {
		echo "Database connection faild";
	}

    $id = $_POST["sid"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $name = $_POST["name"];
    $address = $_POST["address"];
    $manager = $_POST["manager"];

	$query_std = "UPDATE society SET Society_Name = '$name', Society_Phone = $phone, Society_Address = '$address', Society_Manager = '$manager' WHERE Society_Id = $id";
	$result_std = mysqli_query($db,$query_std);

	$query_user ="UPDATE usersacounts SET Email = '$email' WHERE Id_Num = $id";
	$result_user = mysqli_query($db,$query_user);

	if ($result_std && $result_user) {
		echo json_encode("Success");
	}


?>