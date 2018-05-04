<?php
require_once("Includes/DB.php"); 

$title = $_POST[title];
$content = $_POST[content];


$sql = "INSERT INTO blogposts (post, title, user_id) 
VALUES ('$content', '$title', 1)"; 

$mysqli->query($sql);

if($mysqli->error)
{
    echo $mysqli->error;
}
else
{
    header("location: index.php"); 
}


?>