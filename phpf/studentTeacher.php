<?php
include ('localConnection.php');
$id = $_POST['id'];
$kind = $_POST['kind'];
if(isset($_POST['id']))
{
    if ($kind == 'manager'){
        $sql="SELECT teachers.* , usersacounts.Email FROM teachers INNER JOIN usersacounts ON teachers.Id_Num=usersacounts.Id_Num AND teachers.Society_Id =$id";
        $result=$link->query($sql);
        while($row=$result->fetch_assoc()){
        $data[]=$row;}
        echo json_encode($data,JSON_UNESCAPED_UNICODE);
    }
    else
    {
        $sql="SELECT teachers.* , usersacounts.Email FROM teachers INNER JOIN usersacounts ON teachers.Id_Num=usersacounts.Id_Num AND teachers.Id_Num=$id";
    $result=$link->query($sql);
    while($row=$result->fetch_assoc()){
    $data[]=$row;}
    echo json_encode($data,JSON_UNESCAPED_UNICODE);
    }

}
else
echo'error';

?>