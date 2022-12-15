<?php
include ('localConnection.php');

	$sid = $_POST['stuid'];
	$result = $_POST['result'];
	$note = $_POST['note'];
	$testid = $_POST['testid'];
	$home = $_POST['home'];
	$sid = (int)$sid;
	$result = (int)$result;
	$testid = (int)$testid;
	if(isset($_POST['stuid']) && isset($_POST['result']) && isset($_POST['note']) && isset($_POST['testid']))
	{
		if(isset($_POST['home'])&&$home = 1)
		{
			$sql="UPDATE testsresult SET homeResult = $result Where stuid = $sid AND testid = $testid";
			$sql2="UPDATE testsresult SET note = '$note' Where stuid = $sid AND testid = $testid";


		}
		else
		{
			$sql="UPDATE testsresult SET result = $result Where stuid = $sid AND testid = $testid";
			$sql2="UPDATE testsresult SET note = '$note' Where stuid = $sid AND testid = $testid";

		}

		$result=$link->query($sql);
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