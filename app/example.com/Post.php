<?php
include("Includes/Partials/restriction.php");
include("Includes/Partials/Header.php");
require_once("Includes/DB.php");

      $sql = $mysqli->query("SELECT * FROM blogposts WHERE id = $_GET[id]");

      while($post =  mysqli_fetch_array($sql))
      {
          ?>

            <h1> 
                <?php
                    echo $post['title'];
                ?>
            </h1>

            <p> 
                <?php
                    echo $post['post'];
                ?>
            </p>



            <h2>
                skriv en kommentar
            </h2>

            <form method="post" action="Post.php?id=<?php echo $post['id']; ?>">
            <textarea name="content" placeholder="kommentar"> </textarea>
            <input name="submit" type="submit" value="skicka">
            </form>
            
            <?php
             if (isset($_POST['submit']))
             {

                $id = $post['id'];
                $content = $_POST['content']; 

                 $sql = "INSERT INTO comments (blogpost_id, content, user_id)
                 VALUES ('$id', '$content', $_SESSION[id])"; 
                 $mysqli->query($sql);
             }

             $sql = $mysqli->query("SELECT * FROM comments 
             WHERE blogpost_id = $post[id]");
             while($post =  mysqli_fetch_array($sql))
             {             
             ?>
                <h1>
                    <?php                  
                        
                        $sqlUsername = $mysqli->query("SELECT * FROM users 
                        WHERE id = $post[user_id]");
                        $userInformation = mysqli_fetch_assoc($sqlUsername);

                        echo $userInformation['username']; 
                    ?>
                </h1>
             <p>
                <?php
                    echo $post['content'];
                ?>
             </p>
             <?php
             }
      }

include("includes/Partials/Foter.php");
?>