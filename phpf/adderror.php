<?php
include ('localConnection.php');

	$id = $_POST['id'];
	$sid = $_POST['stuid'];
// 	$result = $_POST['result'];
	$let = $_POST['letter'];
	$problem = $_POST['problem'];
	$sid = (int)$sid;
	$id = (int)$id;
	if(isset($_POST['id'])  && isset($_POST['stuid']) && isset($_POST['id']))
	{
		$sql2="UPDATE spelling_result Set problem = '$problem' Where stuid = $sid AND id = $id";
		$result=$link->query($sql2);
		if($result){
			echo'sadsaded';
		}else{

			$return["error"] = true;
			$return["message"] = "Database error";
		}
		mysqli_close($link);
	}
	else
	echo 'no values';
?>