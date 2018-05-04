<?php

$mysqli = new mysqli("localhost", "root", "secret", "example");

if ($mysqli->connect_errno) {
    echo "error";
    die();
}

?>