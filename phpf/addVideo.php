<?php

	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Methods: GET, POST');
	header("Access-Control-Allow-Headers: X-Requested-With");

	$db = mysqli_connect('localhost','root','','bdmtproject');
	if (!$db) {
		echo "Database connection faild";
	}
	$path=$_POST['path'];
    $tid=$_POST['tid'];

	$insert="INSERT into facevideo (`path`, tid) values ($path , $tid)";
	$query = mysqli_query($db,$insert);

	if ($query) {
		echo json_encode("Success");
	}


?>