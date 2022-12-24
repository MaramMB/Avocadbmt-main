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
//for society
	$name = $_POST['name'];
	$sid = $_POST['sid'];
	$Society_Manager = $_POST['Society_Manager'];
	$date = $_POST['date'];
	$phone = $_POST['phone'];
	$address = $_POST['address'];

	$email = $_POST['email'];
	$pass =$_POST['pass'];
	$kind = $_POST['kind'] ?? 'manager';
	$active = $_POST['active'] ?? 'active';
	$hashpass=sha1($pass);

	$select = mysqli_query($db, "SELECT * FROM `usersacounts` WHERE `Email`= '$email'");

	if(mysqli_num_rows($select)) {
		echo json_encode("email");
		exit();
	}


	$insert_user="INSERT INTO `usersacounts`(`Id_Num`,`Email`, `Passward`, `Kind`, `active`) VALUES ($sid,'$email', '$hashpass', '$kind', '$active');";
	$query_user = mysqli_query($db,$insert_user);

	if ($query_user) {
		$insert="INSERT INTO `society` (`Society_Id`, `Society_Name`, `Participation_Date`, `Society_Phone`, `Society_Address`, `Society_Manager`) VALUES ('$sid', '$name', '$date', '$phone', '$address', '$Society_Manager');";

		$query = mysqli_query($db,$insert);

		if ($query) {
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
								ob_end_clean();
								echo json_encode("Success");
		}
	}

?>