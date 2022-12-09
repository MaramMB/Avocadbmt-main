<?php
include ('localConnection.php');
$tid = $_POST["tid"];
$sql="SELECT * FROM sounds WHERE ( tid = $tid OR newsound = 0) AND type = 'B'";
if ($_POST["type"]=='A')
{
    $sql="SELECT * FROM sounds WHERE ( tid = $tid OR newsound = 0) AND type = 'A'";

}
if ($_POST["type"]=='A1')
{
    $sql="SELECT * FROM sounds WHERE newsound=1 AND type = 'A' AND tid != $tid";

}
else if ($_POST["type"]=='B1')
{
    $sql="SELECT * FROM sounds WHERE newsound=1 AND type = 'B' AND tid != $tid";

}
$result=$link->query($sql);
while($row=$result->fetch_assoc()){
$data[]=$row;
}
echo json_encode($data,JSON_UNESCAPED_UNICODE);

?>