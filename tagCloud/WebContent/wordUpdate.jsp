<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,antosrc.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

// Check, if user is already login, then jump to secured page
if ( (session.getAttribute( "userName" ))==null) {
	 response.sendRedirect("phpLogin.jsp");
}

%>
<html>
<body>
<form action="wordDatabaseUpdate.jsp" method="POST">
<h2> Tag Cloud </h2>
Tag Words: <input type="text" name="pname" size="500" /><br />
<input type="submit" value="Submit" />
<a href="MainPage.jsp"><p style="font-size:20" >Cancel</p></a>
</form>

</body>
</html>