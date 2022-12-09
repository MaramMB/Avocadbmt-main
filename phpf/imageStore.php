<?php
header('Access-Control-Allow-Origin: *');

header('Access-Control-Allow-Methods: GET, POST');

header("Access-Control-Allow-Headers: X-Requested-With");
include ('localConnection.php');
$val = isset($_POST["imageByte"]) && isset($_POST["word"]);
if($val)
{
$word = $_POST["word"];
$img = $_POST["imageByte"];
$type = $_POST["type"];
$tid = $_POST["tid"];
$audio = $_POST["audio"];
$new='1';
if($_POST['isAdd']=='yes'){
    $new='2';
}
else
{
    $audio="audio/$audio";
}


if($return["error"] == false){
    $word = mysqli_real_escape_string($link, $word);
    $img = mysqli_real_escape_string($link, $img);

    //escape inverted comma query conflict from string


    $sql="INSERT into sounds(word,image,imageByte,audio,type,newsound,tid)
    values ('$word','tetest','$img','$audio','$type','$new','$tid')";

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



?>
