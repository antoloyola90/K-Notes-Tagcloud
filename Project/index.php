<?php

// Inialize session
session_start();

// Check, if user is already login, then jump to secured page
if (isset($_SESSION['username'])) {
        header('Location: securedpage.php');
}

?>

<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title></title>
  <meta content="Evrsoft First Page" name="GENERATOR" />
  <link media="screen" href="style.css" type="text/css" rel="stylesheet" />
<script src="http://www.webpageScreenshot.info/captureLocal.js" type="text/javascript">
</script>
  <meta http-equiv="Content-type" content="text/html; charset=us-ascii" />
</head>

<body>
<table border="0">
<form method="POST" action="loginproc.php">
<tr><td>Username</font></td><td>:</td><td><input type="text" name="username" size="20"></td></tr>
<tr><td>Password</font></td><td>:</td><td><input type="password" name="password" size="20"></td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="button" type="submit" value="Login" /></td></tr>
</form>
</table>
<br><br><br><br><br>
</body>
</html>
	