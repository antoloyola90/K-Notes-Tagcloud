<?php

// Inialize session
session_start();

// Include database connection settings
include('config.inc');

// Retrieve username and password from database according to user's input


$login = mysql_query("SELECT * FROM user WHERE (username = '" . mysql_real_escape_string($_POST['username']) . "') and (password = '" . mysql_real_escape_string($_POST['password']) . "') and (secretWord = '" . mysql_real_escape_string($_POST['code']) . "')");
$row = mysql_fetch_array($login);
// Check username and password match
if (mysql_num_rows($login) == 1) {
        // Set username session variable
        
$usName=$_POST['username'];

             mysql_query("update user set log='false' where username= '$usName'; ");
// mysql_query("update user set log='true' where username= 'anto'");
        // Jump to secured page
             header('Location: index.php');
        
}
else {
        // Jump to login page
        header('Location: index.php');
}

?>
		