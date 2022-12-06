<?php
include ('localConnection.php');

$id = $_POST['id'];

if(isset($_POST['id']))
{
    
    $sql="DELETE FROM sounds where sound_id = $id";
   
    $result=$link->query($sql);

}
else
echo'error';

?>