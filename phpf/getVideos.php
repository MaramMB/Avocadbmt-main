<?php
include ('localConnection.php');
$tid = $_POST["tid"];
$sql="SELECT * FROM facevideo WHERE tid = $tid OR tid = 0";
$result=$link->query($sql);
while($row=$result->fetch_assoc()){
$data[]=$row;
}
echo json_encode($data,JSON_UNESCAPED_UNICODE);

?>