<?php
include('localConnection.php');
header('Access-Control-Allow-Origin: *');

header('Access-Control-Allow-Methods: GET, POST');

header("Access-Control-Allow-Headers: X-Requested-With");


$return["error"] = false;
$return["message"] = "";

$link = mysqli_connect($dbhost, $dbuser, $dbpassword, $db);

$val = isset($_POST["letter"]) && isset($_POST["result"]);

  if($val){
   

       $letter = $_POST["letter"]; //grabing the data from headers
       $result = $_POST["result"];
       //if there is no any error then ready for database write
       if($return["error"] == false){
            $letter = mysqli_real_escape_string($link, $letter);
            $result = mysqli_real_escape_string($link, $result);

            //escape inverted comma query conflict from string
           
            $sql = "UPDATE spelling_result SET result='$result' WHERE letter='$letter'";

            $res = mysqli_query($link, $sql);
            if($res){
                //write success
            }else{
               
                $return["error"] = true;
                $return["message"] = "Database error";
            }
       }
  }else{
      $return["error"] = true;
      $return["message"] = 'Send all parameters.';
  }

  mysqli_close($link); //close mysqli

  // tell browser that its a json data
  echo json_encode($return);
  //converting array to JSON string
?>