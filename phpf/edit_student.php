<?php
require 'connection copy.php';

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

$json = file_get_contents('php://input');
$data = json_decode($json, true);

    $id = $data["id"];
    $email = $data["email"];
    $phone = $data["phone"];

	$query_std = "UPDATE students SET phone = '$phone' WHERE Id_Num = $id";

	$query_user ="UPDATE usersacounts SET Email = '$email' WHERE Id_Num = $id";


	$result_std = mysqli_query($conn,$query_std);
	$result_user = mysqli_query($conn,$query_user);

	if ($result_std && $result_user) {
		echo json_encode("Success");
	}



?>