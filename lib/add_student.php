
<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
	$db = mysqli_connect('localhost','root','','bdmtproject');
	if (!$db) {
		echo "Database connection faild";
	}

	$name = $_POST['firstname'];
	$father_name = $_POST['secname'];
	$thirdname = $_POST['thirdname'];
	$familyname = $_POST['familyname'];
	$dob = $_POST['DOB'];
	$gender = $_POST['Gender'];
	$phone = $_POST['phone'];
	$address = $_POST['Address'];
	$ptype = $_POST['ptype'];
	$student_id = $_POST['Students_Id'];
	$imgs = $_POST['img'];

	//for user account
	$email = $_POST['email'];
	$pass = $_POST['password'];
	$kind = $_POST['kind'] ?? 'manager';
	$active = $_POST['active'] ?? 'active';



	$insert_user="INSERT INTO `usersacounts`(`Id_Num`,`Email`, `Passward`, `Kind`, `active`) VALUES ($student_id,'$email', '$pass', '$kind', '$active');";
	$query_user = mysqli_query($db,$insert_user);
	


	$insert="INSERT INTO `students`(`Id`, `firstname`, `secname`, `thirdname`, `familyname`, `Students_Id`, `phone`, `DOB`, `Gender`, `Address`, `ptype`, `image`) VALUES (Null,'$name','$familyname','$thirdname','$familyname',$student_id,'$phone','$dob','$gender','$address','$ptype','$imgs')";

	$query = mysqli_query($db,$insert);
	if ($query && $query_user) {
		echo json_encode("Success");
	}



?>