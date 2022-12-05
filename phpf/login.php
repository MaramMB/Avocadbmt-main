<?php
//include('localConnection.php');
header('Access-Control-Allow-Origin: *');

header('Access-Control-Allow-Methods: GET, POST');

header("Access-Control-Allow-Headers: X-Requested-With");
// header("content-type:application/json");
$db = "bdmtproject";
$dbuser = "root";
$dbpassword = "";
$dbhost = "localhost";
$db = mysqli_connect($dbhost, $dbuser, $dbpassword, $db);
if(!$db){
echo "DB connection field";
}
               $email=$_POST['Email'];
               $pass=$_POST['pass'];
               $userData = array();
               $qu="SELECT * FROM usersacounts WHERE Email='$email' and Passward='$pass'";
               $resu=mysqli_query($db,$qu);
//                $userData = mysqli_fetch_assoc($qu);

              if(mysqli_num_rows($resu)==1)
              {
                    echo json_encode("success");
                    $sql = "SELECT * FROM usersacounts WHERE Email='$email'";
                    $queryresult = mysqli_query($db,$sql);
                    $userData = mysqli_fetch_array($queryresult);
//                     echo json_encode($userData);

              } else{
                       echo json_encode("fail");
                       exit();

                   }
                     mysqli_close($db); //close mysqli
?>