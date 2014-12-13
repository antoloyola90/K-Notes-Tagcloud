<?php

// Inialize session
session_start();

include('config.inc');

$usName=$_SESSION['username'];
mysql_query("update user set log='false' where username= '$usName'; ");
// Delete certain session
unset($_SESSION['username']);
// Delete all session variables
// session_destroy();

// Jump to login page
header('Location: index.php');

?>
