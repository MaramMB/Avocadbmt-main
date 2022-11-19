<?php
header('Access-Control-Allow-Origin: *');

header('Access-Control-Allow-Methods: GET, POST');

header("Access-Control-Allow-Headers: X-Requested-With");
$db = "bdmtproject";
$dbuser = "root";
$dbpassword = "";
$dbhost = "localhost";
$db = mysqli_connect($dbhost, $dbuser, $dbpassword, $db);
if(!$db){
echo "DB connection field";
}
	$name = $_POST['firstname'];
	$father_name = $_POST['secname'];
	$thirdname = $_POST['thirdname'];
	$familyname = $_POST['familyname'];
	$dob = $_POST['DOB'];
	$gender = $_POST['Gender'];
	$phone = $_POST['phone'];
	// $email = $_POST['email'];
	$address = $_POST['Address'];
	$ptype = $_POST['ptype'];
	$student_id = $_POST['Students_Id'];
	$image = $_POST['image'];
		// $insert = "INSERT INTO `students` (`id`, `name`, `father_name`, `father_number`, `dob`, `gender`, `address`, `email`, `phone`) VALUES ('$id' ,'$name' , '$father_name' , '$father_number' , '$dob' , '$gender' , '$phone' , '$email' , '$address');";
		// $insert="INSERT INTO `students` (`id`, `name`, `father_name`, `father_number`, `dob`, `gender`, `address`, `email`, `phone`) VALUES ('4', '$name', '$father_name', '$father_number', '$dob', 'NULL', '$phone', '$email', '$address');";
		$insert="INSERT INTO `students` (`firstname`, `secname`, `thirdname`, `familyname`, `Students_Id`, `DOB`, `Gender`, `Address`, `phone`, `ptype`) VALUES ('$name', '$father_name', '$thirdname', '$familyname', '$student_id', '$dob', '$gender', '$address', '$phone', '$ptype');";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode("Success");
		}


?>