<?php

	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Methods: GET, POST');
	header("Access-Control-Allow-Headers: X-Requested-With");

	$db = mysqli_connect('localhost','root','','bdmtproject');
	if (!$db) {
		echo "Database connection faild";
	}
	$studid = $_POST['sid'];
	$note = $_POST['note'];
	$res = $_POST['res'];

	$insert_test="INSERT INTO `testsresult`(`Id`,`stuid`,`testid`, `result`, `note`) VALUES (null,'$studid',1, '$res', '$note');";
	$query_test = mysqli_query($db,$insert_test);

	if ($query_test) {
		echo json_encode("Success");
	}


?>