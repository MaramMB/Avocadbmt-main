<?php
// include("../connect.php");
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