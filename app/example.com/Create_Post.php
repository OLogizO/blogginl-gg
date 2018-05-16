<?php
include("Includes/Partials/restriction.php");
include("Includes/Partials/Header.php");
require_once("Includes/DB.php");

if(isset($_POST['submit'])) {
    if(strlen($_POST['title']) > 1 && strlen($_POST['content']) > 1) {
        
        if (getimagesize($_FILES["file"]["tmp_name"]) && $_FILES["file"]["size"] < 2000000)
        {
            $newFileName = time() . basename($_FILES["file"]["name"]);
            $newFileName = preg_replace('/\s+/', '', $newFileName);
            move_uploaded_file($_FILES["file"]["tmp_name"], "bilder/$newFileName");
            $title = $_POST['title'];
            $content = $_POST['content'];


            $sql = "INSERT INTO blogposts (post, title, user_id) 
            VALUES ('$content', '$title', 1)"; 

            $mysqli->query($sql);
            $id = $mysqli->insert_id; 
            $sqlPictuers = "INSERT INTO pictures (blogpost_id, name)
            VALUES ($id, '$newFileName')";
            
            $mysqli->query($sqlPictuers);
            if($mysqli->error) {
                echo $mysqli->error;
            } else {
                header("location: index.php"); 
            }
        }
        else
        {
            echo "ogiltig bild (måste vara mindre än 2 Mb)";
        }
        
    } else {
        echo "title and content can't be empty"; 
    }
}
?>

<form method="post" enctype="multipart/form-data" action="create_Post.php">
<input name="title" placeholder="title" type="text">
<textarea name="content" placeholder="content">
</textarea>
<input name="file" type="file">
<input name="submit" type="submit" value="skicka">
</form>
<?php

include("Includes/Partials/Foter.php"); 
?>




