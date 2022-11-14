<?php
include ('localConnection.php');
$sql="SELECT * FROM sounds WHERE type='B'";
$val = isset($_POST["type"]);
if ($_POST["type"]=='A')
{
    $sql="SELECT * FROM sounds WHERE type='A'";

}
$result=$link->query($sql);
while($row=$result->fetch_assoc()){
$data[]=$row;
}
echo json_encode($data,JSON_UNESCAPED_UNICODE);

?>