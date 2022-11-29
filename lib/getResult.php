<?php
include ('localConnection.php');
$sid = $_POST['sid'];
$exid = $_POST['exid'];
if(isset($_POST['sid']) && isset($_POST['exid']))
{
    $sql="SELECT * FROM testsresult Where stuid = $sid AND testid = $exid";
    $result=$link->query($sql);
    while($row=$result->fetch_assoc()){
    $data[]=$row;

    }
    echo json_encode($data,JSON_UNESCAPED_UNICODE);
}
else
echo'error';

?>