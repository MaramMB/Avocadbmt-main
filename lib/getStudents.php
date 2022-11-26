<?php
include ('localConnection.php');

$sql="SELECT * FROM students";
$result=$link->query($sql);
while($row=$result->fetch_assoc()){
$data[]=$row;

}
echo json_encode($data,JSON_UNESCAPED_UNICODE);
?>