<?php
header('Access-Control-Allow-Origin: *');

header('Access-Control-Allow-Methods: GET, POST');

header("Access-Control-Allow-Headers: X-Requested-With");
// header("content-type:application/json");
$db = "project";
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

$result = $db->query("SELECT * FROM usersacounts WHERE Email='$email' and Passward='$pass'");

$count = mysqli_num_rows($result);
$userData = mysqli_fetch_assoc($result);

if ($count == 1) {
$sql = "SELECT * FROM usersacounts WHERE Email='$email'";
$queryresult = mysqli_query($db,$sql);
$userData = mysqli_fetch_array($queryresult);

echo json_encode($userData);
}else{
echo json_encode("Error");
}
?>