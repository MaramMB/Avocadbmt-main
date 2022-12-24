
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
$db = mysqli_connect('localhost','root','','bdmtproject');
	if (!$db) {
		echo "Database connection faild";
	}

	$mail = new PHPMailer(true);
//for teacher

	$Id_Num = $_POST['Id_Num'];
	$father_name = $_POST['secname'];
	$thirdname = $_POST['thirdname'];
	$familyname = $_POST['familyname'];
	$name = $_POST['Name'];
	$phone = $_POST['Phone_Num'];
	$accountnumber = $_POST['accountnum'];
	$gender = $_POST['gender'];
	$spec = $_POST['specialization'];
	$Society_Id = $_POST['Society_Id'] ?? 100;

	//for user account
	$email = $_POST['email'];
	$pass =$_POST['password'];
	$kind = $_POST['kind'] ?? 'teacher';
	$active = $_POST['active'] ?? 'active';
	$hashpass=sha1($pass);
	$select = mysqli_query($db, "SELECT * FROM `usersacounts` WHERE `Email`= '$email'");

	if(mysqli_num_rows($select)) {
		echo json_encode("email");
		exit();
	}

	$insert_user="INSERT INTO `usersacounts`(`Id_Num`,`Email`, `Passward`, `Kind`, `active`) VALUES ($Id_Num,'$email', '$hashpass', '$kind', '$active');";
	$query_user = mysqli_query($db,$insert_user);

	$insert="INSERT INTO `teachers` (`Id_Num`, `name`, `secname`, `thirdname`, `familyname`, `Phone_Num`, `accountnum`, `specialization`, `gender`, `Society_Id`) VALUES ($Id_Num, '$name','$father_name','$thirdname','$familyname', $phone, $accountnumber, '$spec', '$gender', $Society_Id);";
	$query = mysqli_query($db,$insert);


	if ($query && $query_user ) {
		try {
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
			$mail->setFrom('nabraa.ps@gmail.com', 'Nabra Website');
			$mail->addAddress($email);     //Add a recipient

			//Content
			$mail->isHTML(true);                                  //Set email format to HTML
			$mail->Subject = 'نبرة - انشاء حساب جديد';
			$mail->Body    = "مرحباً\n  : تم انشاء حساب جديد خاص بك يمكنك تسجيل الدخول عبر البريد الالكتروني الخاص بك ".$email." وكلمة المرور هي : ".$pass."";
			$mail->AltBody = '';

			$mail->send();
			echo 'Message has been sent';
		} catch (Exception $e) {
			echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
		}
	}
	// $mail->Subject = 'نبرة - انشاء حساب جديد';
//$mail->Body    = "مرحباً\n تم انشاء حساب جديد خاص بك يمكنك تسجيل الدخول عبر البريد الالكتروني الخاص بك ".$email." وكلمة المرور هي : ".$pass."";

?>