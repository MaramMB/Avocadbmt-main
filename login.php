<?php
// include("../connect.php");
Access-Control-Allow-Origin: *
Origin: <origin>
Access-Control-Request-Method: <method>


$host="localhost";
$user="root";
$pass="";
$dbname="bdmtproject";
$con=mysqli_connect($host,$user,$pass,$dbname);
$sql="SELECT * FROM usersacounts ";
$result=$con->query($sql);
while($row=$result->fetch_assoc()){
$data[]=$row;
}
echo json_encode($data);
?>