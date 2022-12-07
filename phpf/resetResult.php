<?php
include ('localConnection.php');
$sid = $_POST['sid'];
$exid = $_POST['exid'];
$home=$_POST['home'];
if(isset($_POST['sid']) && isset($_POST['exid']))
{
    if($home==0)
    {
     $sql="UPDATE testsresult Set result = '0',note = '' Where stuid = $sid AND testid = $exid";
    }
    else
    $sql="UPDATE testsresult Set homeResult = '0',note = '' Where stuid = $sid AND testid = $exid";
    $result=$link->query($sql);

}
else
echo'error';

?>