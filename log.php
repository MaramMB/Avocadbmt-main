<?php
<<<<<<< Updated upstream
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
=======
include'..//DataBaseConfig.php';
$db=mysqli_connect('localhost','root','','bdmtproject');
$email=$_POST['email'];
$email=$_POST['password'];
$sql = "SELECT * FROM usersacounts WHERE Email = '$username'";
$result=mysqli_query($db,$sql);
$count=mysqli_num_rows($result);
if($count==1){
echo json_encode("success");
>>>>>>> Stashed changes
}else{
echo json_encode("invalid");
}
?>
// <?php
//
//   $return["error"] = false;
//   $return["message"] = "";
//   $return["success"] = false;
//
//   $link = mysqli_connect('localhost', 'root', '', 'bdmtproject');
//
//   if(isset($_POST["username"]) && isset($_POST["password"])){
//
//        $username = $_POST["username"];
//        $password = $_POST["password"];
//
//        $username = mysqli_real_escape_string($link, $username);
//
//        $sql = "SELECT * FROM usersacounts WHERE Email = '$username'";
//        //building SQL query
//        $res = mysqli_query($link, $sql);
//        $numrows = mysqli_num_rows($res);
//        //check if there is any row
//        if($numrows > 0){
//            //is there is any data with that username
//            $obj = mysqli_fetch_object($res);
//            //get row as object
//            if(md5($password) == $obj->Passward){
//                $return["success"] = true;
//                $return["uid"] = $obj->id_Num;
//            }else{
//                $return["error"] = true;
//                $return["message"] = "Your Password is Incorrect.";
//            }
//        }else{
//            $return["error"] = true;
//            $return["message"] = 'No username found.';
//        }
//   }else{
//       $return["error"] = true;
//       $return["message"] = 'Send all parameters.';
//   }
//
//   mysqli_close($link);
//
//   header('Content-Type: application/json');
//   // tell browser that its a json data
//   echo json_encode($return);
//   //converting array to JSON string
// ?>
