<?php

// Inialize session
session_start();

// Include database connection settings
include('config.inc');

// Retrieve username and password from database according to user's input

$loginName = mysql_real_escape_string($_SESSION['username']);

$login = mysql_query("SELECT * FROM user WHERE (username = '" . mysql_real_escape_string($_SESSION['username']) . "')");
$row = mysql_fetch_array($login);
// Check username and password match

             
$code=$_POST['code'];
             mysql_query("update user set secretWord='$code' where username= '$loginName'; ");

        // Jump to secured page
             
            
                 header('Location: securedpage.php');
            

?>
					