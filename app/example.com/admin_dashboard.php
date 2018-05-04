<?php
include("includes/Partials/Header.php");
require_once("Includes/DB.php");
?>
<?php
if (isset($_GET['id']))
{
    $mysqli->query("DELETE FROM blogposts WHERE id='$_GET[id]'");
}
?>
<?php 
      $sql = $mysqli->query("SELECT * FROM blogposts");

      while($post =  mysqli_fetch_array($sql))
      {
          ?>
            <h1>
                <?php
                    echo $post['title'];
                ?>
            </h1>
             <p>
                <a href="admin_dashboard.php?id=<?php echo $post['id']; ?>">delete</a>
            </p>
            <p> 
                <?php
                    echo $post['post'];
                ?>
            </p>
          <?php
      }
    ?>

<?php
include("includes/Partials/Foter.php");
?>