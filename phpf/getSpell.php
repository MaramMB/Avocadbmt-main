<?php
include ('localConnection.php');
$id = $_POST['id'];
$sql="SELECT * FROM spelling_result WHERE stuid = '$id'";
$result=$link->query($sql);
while($row=$result->fetch_assoc()){
$data[]=$row;

}
echo json_encode($data,JSON_UNESCAPED_UNICODE);
?>