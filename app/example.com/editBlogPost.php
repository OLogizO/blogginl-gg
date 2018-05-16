<?php
include("Includes/Partials/restriction.php");
include("Includes/Partials/Header.php");
require_once("Includes/DB.php");

//hämtar id från get. 
//hämtar blogposten från databasen baserat på id.
//

if(isset($_POST['submit'])) {
    if(strlen($_POST['title']) > 1 && strlen($_POST['content']) > 1) {
            $title = $_POST['title'];
            $content = $_POST['content'];

            $queryUpdateBlogpost = $mysqli->query("UPDATE blogposts
            SET post = $content, title = $title 
            WHERE id = '$_POST[id]'"); 
            
            $mysql->query($queryUpdateBlogpost);
        
    } else {
        echo "title and content can't be empty"; 
    }
}
if(isset($_POST['id']))
{
    $queryBlogPosts = $mysqli->query("SELECT * FROM blogposts 
    WHERE id = '$_POST[id]'");
    while($DB_blogpost = mysqli_fetch_array($queryBlogPosts))
    {   
        ?>

        <form method="post" enctype="multipart/form-data" action="editBlogPost.php">
        <input name="title" value="<?php echo $DB_blogpost['title'];?>" type="text">
        <textarea name="content"  value="<?php echo $DB_blogpost['post'];?>" >
        </textarea>
        <input name="id" value="<?php echo $DB_blogpost['id']?>" type="hidden">
        <input name="submit" type="submit" value="skicka">
        </form>
        <?php
    }
}
include("Includes/Partials/Foter.php"); 
?>




