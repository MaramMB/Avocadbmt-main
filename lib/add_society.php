<?php
	$db = mysqli_connect('localhost','root','','bdmtproject');
	if (!$db) {
		echo "Database connection faild";
	}

	// $id = $_POST['id'];
	$name = $_POST['Society_Name'];
	$Society_Id = $_POST['Society_Id'];
	$Society_Manager = $_POST['Society_Manager'];
	$date = $_POST['Participation_Date'];
	$phone = $_POST['Society_Phone'];
	$address = $_POST['Society_Address'];
		// $insert = "INSERT INTO `students` (`id`, `name`, `father_name`, `father_number`, `dob`, `gender`, `address`, `email`, `phone`) VALUES ('$id' ,'$name' , '$father_name' , '$father_number' , '$dob' , '$gender' , '$phone' , '$email' , '$address');";
		// $insert="INSERT INTO `students` (`id`, `name`, `father_name`, `father_number`, `dob`, `gender`, `address`, `email`, `phone`) VALUES ('4', '$name', '$father_name', '$father_number', '$dob', 'NULL', '$phone', '$email', '$address');";
		$insert="INSERT INTO `society` (`Society_Id`, `Society_Name`, `Participation_Date`, `Society_Phone`, `Society_Address`, `Society_Manager`) VALUES ('1', '$name', '$date', '$phone', '$address', '$Society_Manager');";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode("Success");
		}


?>