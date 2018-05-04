<h1> register <h1>
<?php
require_once("Includes/DB.php"); 
if(isset($_POST['submit']))
{
$username = $_POST['username'];
$password = $_POST['password']; 

 $sql = "INSERT INTO users(username, password) 
 VALUES ('$username', '$password')";

 $mysqli->query($sql); 

 header("location: inlogning.php"); 
}


?>


<form method="post" action="register.php">
<input name="username" placeholder="chose username" type="text">
<input name="password" placeholder="chose password"> 
<input name="submit" type="submit" value="skicka">
</form>