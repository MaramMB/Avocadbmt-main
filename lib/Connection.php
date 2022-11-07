<?php
try{
$connection = new PDO ('mysql:host=localhost,dbname=id19826558_bara','bara','$PboF/\vyF#34|ul');
$connection ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
echo "yes connection";

}catch(PDOException $exc){
echo $exc ->getMessage();
die ('couldnt connect');

}
?>