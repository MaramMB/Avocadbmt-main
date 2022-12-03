<?php
header('Access-Control-Allow-Origin: *');

header('Access-Control-Allow-Methods: GET, POST');

header("Access-Control-Allow-Headers: X-Requested-With");
$image = $_POST['file'];
$name = $_POST['name'];
$file = base64_decode($image);
file_put_contents($name , $file);
rename($name , "/del/ffff.mp3");
echo 'upload is finished';
?>