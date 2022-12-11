<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With");

	$conn = mysqli_connect('localhost','root','','bdmtproject');

	if (!$conn) {
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
    $teatcher_id = $_POST['teatcher_id'];
    $email = $_POST['email'];

    //for parent table
    $father_job = $_POST['father_job'];
    $father_dob = $_POST['father_dob'];
    $mother_name = $_POST['mother_name'];

    $parent = mysqli_query($conn, "SELECT * FROM `parent` WHERE `idnum`= $student_id");

	if(mysqli_num_rows($parent)) {
        $query_parent = "UPDATE parent SET name = '$father_name', work = '$father_job', dob = '$father_dob', mothername = '$mother_name', phone = $phone WHERE idnum = $student_id";
        $result_parent = mysqli_query($conn,$query_parent);
    } else{
        $query_parent = "INSERT INTO `parent`(`idnum`, `name`, `work`, `dob`, `mothername`, `phone`) VALUES ($student_id,'$father_name','$father_job','$father_dob','$mother_name',$phone)";
        $result_parent = mysqli_query($conn,$query_parent);
    }


    $query_std = "UPDATE students SET firstname = '$name', secname = '$father_name', thirdname = '$thirdname', familyname = '$familyname', phone = $phone,DOB = '$dob',Gender = '$gender',Address = '$address', ptype = '$ptype',tid = '$teatcher_id' WHERE Students_Id = $student_id";
    $result_std = mysqli_query($conn,$query_std);    


	$query_user ="UPDATE usersacounts SET Email = '$email' WHERE Id_Num = $student_id";
	$result_user = mysqli_query($conn,$query_user);

	if ($result_parent && $result_user && $result_std) {
		echo json_encode("Success");
	}


?>