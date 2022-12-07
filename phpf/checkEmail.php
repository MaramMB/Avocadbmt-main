<?php
include('localConnection.php');
$Email=$_POST['Email'];
$query = $link->query("SELECT * FROM usersacounts WHERE Email = '".$Email."'");
$count = mysqli_num_rows($query);
$data = mysqli_fetch_assoc($query);

if ($count == 1)
{
     $idData=$data['Id_Num'];
$userData =$data['Email'];
    $url='http://'.$_SERVER['SERVER_NAME'].'/changepw.php?Id_Num='.$idData.'&Email='.$userData;
    echo json_encode($url);
}
else{
    echo json_encode("Invalid");
}


?>