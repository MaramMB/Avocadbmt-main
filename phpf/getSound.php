<?php
include ('localConnection.php');
$tid = $_POST["tid"];
$sql="SELECT * FROM sounds WHERE ( tid = $tid OR newsound = 0) AND type = 'B'";
if ($_POST["type"]=='A')
{
    $sql="SELECT * FROM sounds WHERE ( tid = $tid OR newsound = 0) AND type = 'A'";

}
$result=$link->query($sql);
while($row=$result->fetch_assoc()){
$data[]=$row;
}
echo json_encode($data,JSON_UNESCAPED_UNICODE);

?>