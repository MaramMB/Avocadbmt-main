<?php
include ('localConnection.php');
$id = $_POST['Id_Num'];
if(isset($_POST['Id_Num']))
{
    $sql="SELECT * FROM teachers Where Id_Num = $id";
    $result=$link->query($sql);
    while($row=$result->fetch_assoc()){
    $data[]=$row;

    }
    echo json_encode($data,JSON_UNESCAPED_UNICODE);
}
else
echo'error';

?>