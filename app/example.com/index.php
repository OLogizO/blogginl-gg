<?php
include("includes/Partials/Header.php");
require_once("Includes/DB.php");

?>
<h1>
hej hej
<?php
if($_SESSION['logged_in'] == 1)
{
    echo "du är inloggad";
}

$blogposts = $mysqli->query("SELECT * FROM blogposts"); 

while ($blogpost = mysqli_fetch_array($blogposts))
{
    ?>
    <h1>
        title: 
        
        <?php 
        echo $blogpost['title']; 
        ?>
        </h1>
        <?php
        $sqlGetPictures = $mysqli->query("SELECT * FROM pictures 
        WHERE blogpost_id = $blogpost[id]");
        while($getPictures = mysqli_fetch_array($sqlGetPictures))
        {
           // print_r($getPictures); 
        ?>
           

        <img src="bilder/<?php echo $getPictures['name'];?>">
        <?php
        }
        ?>
   
    <p>
        content: 
        <?php
        echo $blogpost['post'];
        ?>
    </p>
    <a href="Post.php?id=<?php echo $blogpost['id']; ?>" > Read more </a>
    <?php
}

?>
</h1>
<?php
include("includes/Partials/Foter.php");
?>