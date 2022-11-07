<?php
include("Connection.php");
/* $host="localhost";
$user="root";
$pass="";
$dbname="bdmtproject";
$con=mysqli_connect($host,$user,$pass,$dbname); */
try{
$connection = new PDO ('mysql:host=localhost,dbname=id19826558_project','id19826558_bara','$PboF/\vyF#34|ul');
$connection ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
echo "yes connection";

}catch(PDOException $exc){
echo $exc ->getMessage();
die ('couldnt connect');

}
$sql="SELECT * FROM usersacounts";
$result=$connection->query($sql);
while($row=$result->fetch_assoc()){
$data[]=$row;
}
echo json_encode($data);
?>