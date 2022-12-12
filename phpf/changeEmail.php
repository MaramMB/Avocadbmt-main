<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
require('mailer/Exception.php');
require('mailer/SMTP.php');
require('mailer/PHPMailer.php');
include('localConnection.php');
$mail = new PHPMailer(true);
$Email = $_POST['Email'];
$code = rand(111111,999999);
if (true)
{
    if(true)
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
                    $mail->addAddress($Email);     //Add a recipient

                    //Content
                    $mail->isHTML(true);                                  //Set email format to HTML
                    $mail->Subject = 'نبرة - طلب تغيير البريد الالكتروني';
                    $mail->Body    = "مرحباً</br> لقد تم تنفيذ طلبك لتغيير البريد الالكتروني ، رمز التأكيد هو : ".$code."";
                    $mail->AltBody = '';

                    $mail->send();
                    echo 'Message has been sent';
                } catch (Exception $e) {
                    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                }
        ob_end_clean();
        echo $code;

    }
}
?>