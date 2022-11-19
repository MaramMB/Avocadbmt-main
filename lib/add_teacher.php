<?php
$db = "bdmtproject";
$dbuser = "root";
$dbpassword = "";
$dbhost = "localhost";
$db = mysqli_connect($dbhost, $dbuser, $dbpassword, $db);
if(!$db){
echo "DB connection field";
}

	// $id = $_POST['id'];
	$name = $_POST['Name'];
	$phone = $_POST['Phone_Num'];
	$Id_Num = $_POST['Id_Num'];
	$accountnumber = $_POST['accountnum'];
	$gender = $_POST['gender'];
	$spec = $_POST['specialization'];
	$Society_Id = $_POST['Society_Id'];
		// $insert = "INSERT INTO `students` (`id`, `name`, `father_name`, `father_number`, `dob`, `gender`, `address`, `email`, `phone`) VALUES ('$id' ,'$name' , '$father_name' , '$father_number' , '$dob' , '$gender' , '$phone' , '$email' , '$address');";
		// $insert="INSERT INTO `students` (`id`, `name`, `father_name`, `father_number`, `dob`, `gender`, `address`, `email`, `phone`) VALUES ('4', '$name', '$father_name', '$father_number', '$dob', 'NULL', '$phone', '$email', '$address');";
		$insert="INSERT INTO `teachers` (`Id_Num`, `name`, `Phone_Num`, `accountnum`, `specialization`, `gender`, `Society_Id`) VALUES ('$Id_Num', '$name', '$phone', '$accountnumber', '$spec', '$gender', '$Society_Id');";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode("Success");
		}


?>
