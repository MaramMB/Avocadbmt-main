<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
// header('Content-Type: applcation/json; charset = utf-8');
	$db = mysqli_connect('localhost','root','','bdmtproject');
	$sql="SELECT * FROM teachers";
	$result=$db->query($sql);
	while($row=$result->fetch_assoc()){
	$data[]=$row;
	}
	echo json_encode($data);
?>