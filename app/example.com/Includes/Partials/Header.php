<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>Blog</title>
  <meta name="description" content="Blog">
  <meta name="author" content="Fredrik">

  <link rel="stylesheet" href="style.css">

  <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->

</head>

<body>
<main>
<ul> 
<?php
session_start();
if ($_SESSION['logged_in'] == true)
{
  ?>
  <li>
<a href ="index.php">blog </a>
</li>
<li>
<a href ="Create_Post.php">Create Post </a>
</li>
<li>
<a href ="log_out.php">log out </a>
</li>
<li>
<!--<a href ="admin_dashboard.php">Admin Dashboard </a>-->
</li>
  <?php
}
else
{
  ?>
      <li>
      <a href ="inlogning.php">login </a>
      </li>
      <li>
      <a href ="register.php">register </a>
      </li>
    <!--  <li>
<a href ="admin_dashboard.php">Admin Dashboard </a>
</li>-->
  <?php
}

?>
</ul>
 