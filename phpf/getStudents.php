<?php
include ('localConnection.php');
$id = $_POST['id'];
if(isset($_POST['id']))
{
    $sql="SELECT students.*,usersacounts.Email
      FROM students INNER JOIN usersacounts ON students.Students_Id=usersacounts.Id_Num WHERE tid=$id";
    $result=$link->query($sql);
    while($row=$result->fetch_assoc()){
    $data[]=$row;

    }
    echo json_encode($data,JSON_UNESCAPED_UNICODE);
}
else
echo'error';

?>