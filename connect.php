<?php
$host="localhost";
$user="root";
$pass="";
$dbname="bdmtproject";
$con=mysqli_connect($host,$user,$pass,$dbname);
if($con){
echo "Connect";
}
?>