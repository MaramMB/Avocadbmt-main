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

		$id = $_POST['Id_Num'];
		$active = $_POST['active'];
		$insert="UPDATE `usersacounts` SET `active` = '$active' WHERE `usersacounts`.`Id_Num` = $id;";
		$email = mysqli_query($db,"SELECT (usersacounts.Email) FROM usersacounts  WHERE usersacounts.Id_Num = $id");
		$query = mysqli_query($db,$insert);
		$row =	$email->fetch_array()[0] ?? 'aa';



		if ($row) {

			if ($active =="active")
			{
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
					$mail->Password   = 'sdmigowhdciuiijl';                     //SMTP password
					$mail->SMTPSecure = 'tls';
					$mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
					$mail->CharSet = 'UTF-8';

					//Recipients
					$mail->setFrom('nabraa.ps@gmail.com', 'Nabra Website');
					$mail->addAddress($row);     //Add a recipient

					//Content
					$mail->isHTML(true);                                  //Set email format to HTML
					$mail->Subject = 'نبرة - تغيير على حالة الحساب';
					$mail->Body    = "مرحباً\n  نود إعلامك بأنه تم تفعيل حسابك ويمكنك تسجيل الدخول الان";
					$mail->AltBody = '';

					$mail->send();
					echo 'Message has been sent';
				} catch (Exception $e) {
					echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
				}


			}
			else
			{
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
					$mail->addAddress($row);     //Add a recipient

					//Content
					$mail->isHTML(true);                                  //Set email format to HTML
					$mail->Subject = 'نبرة - تغيير على حالة الحساب';
					$mail->Body    = "مرحباً\n  نود إعلامك بأنه تم الغاء تفعيل حسابك اذا كان هنالك مشكلة في ذلك يمكنك مراجعة الادارة الخاصة بمؤسستك";
					$mail->AltBody = '';

					$mail->send();
					echo 'Message has been sent';
				} catch (Exception $e) {
					echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
				}


			}
			ob_end_clean();
		echo json_encode("Success");
		}


?>
