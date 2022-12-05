<?php
include ('localConnection.php');
$sid = $_POST['sid'];
$exid = $_POST['exid'];
if(isset($_POST['sid']) && isset($_POST['exid']))
{
    $sql="UPDATE testsresult Set result = '0',note = '' Where stuid = $sid AND testid = $exid";
    $result=$link->query($sql);

}
else
echo'error';

?>