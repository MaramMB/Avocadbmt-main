<?php
header('Access-Control-Allow-Origin: *');

header('Access-Control-Allow-Methods: GET, POST');

header("Access-Control-Allow-Headers: X-Requested-With");
$audio = $_POST['file'];
$name = $_POST['name'];
$user = get_current_user();
$file = base64_decode($audio);
file_put_contents($name, $file);
//C:/Users/sami/AndroidStudioProjects/Avocadbmt-main/audio/$name
//C:/Users/$user/Documents/GitHub/Avocadbmt-main/audio/$name
rename ($name,"C:/Users/sami/AndroidStudioProjects/Avocadbmt-main/audio/$name");
echo 'upload is finished';
?>