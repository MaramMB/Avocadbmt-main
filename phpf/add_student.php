
<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
require('mailer/Exception.php');
require('mailer/SMTP.php');
require('mailer/PHPMailer.php');
$mail = new PHPMailer(true);
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
	// $imgs = $_POST['image'];
	$teatcher_id = $_POST['teatcher_id'];
	$Society_Id = $_POST['Society_Id'];


	//for user account
	$email =sha1($_POST['email']);
	$pass = $_POST['password'];
	$kind = $_POST['kind'] ?? 'student';
	$active = $_POST['active'] ?? 'active';

	//for parent table
	$father_job = $_POST['father_job'];
	$father_dob = $_POST['father_dob'];
	$mother_name = $_POST['mother_name'];


	$select = mysqli_query($db, "SELECT * FROM `usersacounts` WHERE `Email`= '$email'");

	if(mysqli_num_rows($select)) {
		echo json_encode("email");
		exit();
	}

	$insert_user="INSERT INTO `usersacounts`(`Id_Num`,`Email`, `Passward`, `Kind`, `active`) VALUES ($student_id,'$email', '$pass', '$kind', '$active');";
	$query_user = mysqli_query($db,$insert_user);


		$insert="INSERT INTO `students`(`Id`, `firstname`, `secname`, `thirdname`, `familyname`, `Students_Id`, `phone`, `DOB`, `Gender`, `Address`, `tid`, `ptype`,`socid`) VALUES (Null,'$name','$father_name','$thirdname','$familyname',$student_id,$phone,'$dob','$gender','$address',$teatcher_id,'$ptype',$Society_Id)";
		$query = mysqli_query($db,$insert);
		$parent_query = "INSERT INTO `parent`(`idnum`, `name`, `work`, `dob`, `mothername`, `phone`) VALUES ($student_id,'$father_name','$father_job','$father_dob','$mother_name',$phone)";
		$parent_result = mysqli_query($db,$parent_query);
		$initResult1 = "INSERT INTO testsresult Values ($student_id , '1' , '0','0' ,' ')";
	    $query_res1 = mysqli_query($db,$initResult1);

	   $initResult2 = "INSERT INTO testsresult Values ($student_id , '4' , '0','0' ,' ')";
     	$query_res2 = mysqli_query($db,$initResult2);

		$initResult3 = "INSERT INTO testsresult Values ($student_id , '5' , '0','0' ,' ')";
		$query_res3 = mysqli_query($db,$initResult3);

		$initResult4 = "INSERT INTO testsresult Values ($student_id , '6' , '0', '0'  ,' ')";
		$query_res4 = mysqli_query($db,$initResult4);
		$lettersArr = ["أ" ,"ب" ,"ت" ,"ث" ,"ج" ,"ح", "خ", "د", "ذ", "ر" ,"ز", "س" ,"ش", "ص" ,"ض" ,"ط", "ظ", "ع" ,"غ" ,"ف" ,"ق" ,"ك" ,"ل" ,"م" ,"ن" ,"ه" ,"و","ي"];

		foreach ($lettersArr as $key => $value) {
			$res = "INSERT INTO spelling_result Values ($key+1,'$student_id','$value','false',0)";
			$query_spell = mysqli_query($db,$res);
		}

		if ($query_user) {
		 try {
			echo ($email);
                            $mail->SMTPOptions = array(
                                'ssl' => array(
                                    'verify_peer' => false,
                                    'verify_peer_name' => false,
                                    'allow_self_signed' => true
								)
                            );
                            //Server settings
                            $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
                            $mail->isSMTP();                                            //Send using SMTP
                            $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
                            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
                            $mail->Username   = 'nabraa.ps@gmail.com';                     //SMTP username
                            $mail->Password   = 'sdmigowhdciuiijl';                               //SMTP password
                            $mail->SMTPSecure = 'tls';
                            $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
                            $mail->CharSet = 'UTF-8';

                            //Recipients
                            $mail->setFrom('nabraa.ps@gmail.com', 'Nabra');
                            $mail->addAddress($email);     //Add a recipient

                            //Content
                            $mail->isHTML(true);                                  //Set email format to HTML
                            $mail->Subject = 'نبرة - انشاء حساب جديد';
                            $mail->Body    = "مرحباً\n : تم انشاء حساب جديد خاص بك يمكنك تسجيل الدخول عبر البريد الالكتروني الخاص بك ".$email." وكلمة المرور هي : ".$pass."";
                            $mail->AltBody = '';

                            $mail->send();
                            echo 'Message has been sent';
                        } catch (Exception $e) {
                            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                        }
			echo json_encode("Success");

	}



?>