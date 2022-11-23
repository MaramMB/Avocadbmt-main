
<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

$db = mysqli_connect('localhost','root','','bdmtproject');
if (!$db) {
    echo "Database connection faild";
}
$email = $_POST['email'];
$pass = $_POST['password'];
$kind = $_POST['kind'] ?? 'manager';
$active = $_POST['active'] ?? 'active';

// $currDate = $_POST['currentDate'];



$insert_user="INSERT INTO `usersacounts`(`Id_Num`,`Email`, `Passward`, `Kind`, `active`) VALUES (100,'$email', '$pass', '$kind', '$active');";
$query_user = mysqli_query($db,$insert_user);

if ($query_user) {
    echo json_encode("Success");
}


?>