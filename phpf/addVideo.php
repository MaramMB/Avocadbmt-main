<?php
include ('localConnection.php');
	$path = $_POST['file'];
	$tid = (int)$_POST['tid'];
	if(isset($_POST['file']) && isset($_POST['tid']))
	{

			$sql="INSERT into facevideo values ('','".$_POST['file']."', $tid)";


		$result=$link->query($sql);
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
