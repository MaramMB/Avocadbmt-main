<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
require('mailer/Exception.php');
require('mailer/SMTP.php');
require('mailer/PHPMailer.php');
include('localConnection.php');
$mail = new PHPMailer(true);
$id = $_GET['Id_Num'];
$Email = $_GET['Email'];
$query = $link->query("SELECT * FROM usersacounts WHERE Id_Num = '".$id."' AND Email = '".$Email."'");
$count = mysqli_num_rows($query);
$newpw = rand(11111111,99999999);
if ($count==1)
{
    $update = $link->query("UPDATE usersacounts SET Passward = '".$newpw."' WHERE Id_Num = '".$id."' AND Email = '".$Email."'");
    if($update)
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
                    $mail->Username   = 'bara1brh@gmail.com';                     //SMTP username
                    $mail->Password   = 'nyfhxclfhgaokpdz';                               //SMTP password
                    $mail->SMTPSecure = 'tls';
                    $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
                    $mail->CharSet = 'UTF-8';

                    //Recipients
                    $mail->setFrom('bara1brh@gmail.com', 'Nabra');
                    $mail->addAddress($Email);     //Add a recipient
                   
                    //Content
                    $mail->isHTML(true);                                  //Set email format to HTML
                    $mail->Subject = 'نبرة - إستعادة كلمة المرور';
                    $mail->Body    = "مرحباً\n لقد تم تنفيذ طلبك لتغيير كلمة المرور ، كلمة المرور الجديدة هي : ".$newpw."";
                    $mail->AltBody = '';
                
                    $mail->send();
                    echo 'Message has been sent';
                } catch (Exception $e) {
                    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                }

        echo json_encode($newpw);
    }
}
?>