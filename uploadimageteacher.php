<?php
    require 'connection.php';

    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With");

    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    $id = $data["id"];
    $image = $data["image"];

	$query = "UPDATE teachers SET image = '$image' WHERE Id_Num = $id";

    $result = mysqli_query($conn,$query);
    if ($result) {
		echo json_encode("Success");
	}
?>