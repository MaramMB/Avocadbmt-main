<?php
include ('localConnection.php');
$id = $_POST['id'];
if(isset($_POST['id']))
{
    $sql="SELECT * From society WHERE Society_Id = $id";
    $result=$link->query($sql);
    while($row=$result->fetch_assoc()){
    $data[]=$row;

    }
    echo json_encode($data,JSON_UNESCAPED_UNICODE);
}
else
echo'error';

?>