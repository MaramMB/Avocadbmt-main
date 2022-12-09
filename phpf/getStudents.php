<?php
include ('localConnection.php');
$id = $_POST['id'];
if(isset($_POST['id']))
{
    $sql="SELECT students.Id , students.firstname , students.secname,students.thirdname , students.familyname,students.Students_Id,students.phone,students.DOB,students.Gender,
    students.Address,students.ptype,students.tid,students.image,students.socid,usersacounts.Email
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