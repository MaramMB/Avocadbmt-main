
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
	$teatcher_id = $_POST['teatcher_id'];
	$Society_Id = $_POST['Society_Id'];


	//for user account
	$email = $_POST['email'];
	$pass = $_POST['password'];
	$kind = $_POST['kind'] ?? 'student';
	$active = $_POST['active'] ?? 'active';

	$select = mysqli_query($db, "SELECT * FROM `usersacounts` WHERE `Email`= '$email'");

	if(mysqli_num_rows($select)) {
		echo json_encode("email");
		exit();
	}

	$insert_user="INSERT INTO `usersacounts`(`Id_Num`,`Email`, `Passward`, `Kind`, `active`) VALUES ($student_id,'$email', '$pass', '$kind', '$active');";
	$query_user = mysqli_query($db,$insert_user);

	if($query_user){
		$insert="INSERT INTO `students`(`Id`, `firstname`, `secname`, `thirdname`, `familyname`, `Students_Id`, `phone`, `DOB`, `Gender`, `Address`, `tid`, `ptype`, `image`,`socid`) VALUES (Null,'$name','$father_name','$thirdname','$familyname',$student_id,'$phone','$dob','$gender','$address',$teatcher_id,'$ptype','$imgs',$Society_Id)";
		$query = mysqli_query($db,$insert);
		$initResult1 = "INSERT INTO testsresult Values ($student_id , '1' , '0' ,' ')";
	    $query_res1 = mysqli_query($db,$initResult1);

	   $initResult2 = "INSERT INTO testsresult Values ($student_id , '4' , '0' ,' ')";
     	$query_res2 = mysqli_query($db,$initResult2);

		$initResult3 = "INSERT INTO testsresult Values ($student_id , '5' , '0' ,' ')";
		$query_res3 = mysqli_query($db,$initResult3);

		$initResult4 = "INSERT INTO testsresult Values ($student_id , '6' , '0' ,' ')";
		$query_res4 = mysqli_query($db,$initResult4);


		if ($query && $query_user && $query_res1 && $query_res2 && $query_res3 && $query_res4 ) {
			echo json_encode("Success");
		}
	}



?>