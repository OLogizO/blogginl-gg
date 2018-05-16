<h1> login <h1>
<?php
require_once("Includes/DB.php");
if(isset($_POST['submit'])) {
    
    $sqlUserInfo = $mysqli->query("SELECT * FROM users 
    WHERE username = '$_POST[username]'");
    while($userInfo = mysqli_fetch_array($sqlUserInfo))
    {
        if (password_verify($_POST['password'], $userInfo['password'])) {
            echo "hello";
            session_start(); 
            $_SESSION['logged_in'] = 1; 
            $userInformation = mysqli_fetch_assoc($sql);
            $_SESSION['id'] =  $userInformation['id']; 
            header("location: index.php"); 
        } else {
            echo "fel lösenord";
            //header("location: inlogning.php"); 
        }   
    }
}
?>
<form method="post" action="inlogning.php">
<input name="username" placeholder="username" type="text">
<input name="password" placeholder="password"> 
<input name="submit" type="submit" value="skicka">
</form>
