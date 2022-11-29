
<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
	$db = mysqli_connect('localhost','root','','bdmtproject');
	if (!$db) {
		echo "Database connection faild";
	}

	$sid = $_POST['stuid'];
	$result = $_POST['result'];
	$note = $_POST['note'];
	$testid = $_POST['testid'] ?? 1;

	$insert="INSERT INTO `testsresult`(`id`, `stuid`, `testid`, `result`, `note`) VALUES (Null,'$sid','1','$result','$note')";

	$query = mysqli_query($db,$insert);
	if ($query) {
		echo json_encode("Success");
	}



?>