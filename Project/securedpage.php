<?php

// Inialize session
session_start();

// Check, if username session is NOT set then this page will jump to login page
if (!isset($_SESSION['username'])) {
        header('Location: index.php');
}

?>
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
  
<title>Welcome</title>
  
<meta content="Evrsoft First Page" name="GENERATOR" />
  
<link media="screen" href="style.css" type="text/css" rel="stylesheet" />

<script src="http://www.webpageScreenshot.info/captureLocal.js" type="text/javascript">
</script>
  
<meta http-equiv="Content-type" content="text/html; charset=us-ascii" />
</head>


<body>
  

<br>Username: <?php echo $_SESSION['username']; ?><br>Email ID: <?php echo $_SESSION['email']; ?>

<br><a href = "logout.php">LOG OUT</a>
</body>
</html>

