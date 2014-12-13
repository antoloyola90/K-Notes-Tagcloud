<?php


// Inialize session

session_start();


// Include database connection settings

include('config.inc');


// Retrieve username and password from database according to user's input


$loginName = mysql_real_escape_string($_POST['username']);

$loginPwd = mysql_real_escape_string($_POST['password']);

$login = mysql_query("SELECT * FROM user WHERE (username = '" . mysql_real_escape_string($_POST['username']) . "') and (password = '" . mysql_real_escape_string($_POST['password']) . "')");

$row = mysql_fetch_array($login);
// Check username and password match
if (mysql_num_rows($login) == 1) 
{
        // Set username session variable
        
if($row['log'] == "false")
{

$_SESSION['username'] = $_POST['username'];
	     
$_SESSION['email'] = $row['email_id'];
	     
$_SESSION['assigns'] = $row['assigns'];
             
$_SESSION['max'] = $row['max'];
	     
$_SESSION['plan'] = $row['plan'];
             
$_SESSION['report'] = $row['report_id'];

$usName=$_POST['username'];
             
mysql_query("update user set log='true' where username= '$usName'; ");


        // Jump to secured page
             
header('Location: securedpage.php');
}
        
        
else{
             header('Location:failed.php');
        }

}
else {
        // Jump to login page
        header('Location: index.php');
}


?>
					