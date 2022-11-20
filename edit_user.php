<?php
	$db = mysqli_connect('localhost','root','','bdmtproject');
	if (!$db) {
		echo "Database connection faild";
	}

	$id = $_POST['Id_Num'];
	$active = $_POST['active'];
		$insert="UPDATE `usersacounts` SET `active` = '$active' WHERE `usersacounts`.`Id_Num` = $id;";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode("Success");
		}


?>