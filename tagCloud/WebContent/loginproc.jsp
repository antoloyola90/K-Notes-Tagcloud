<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,antosrc.*,java.io.*"  %>
<html>
<head>
<%

// Include database connection settings

// Retrieve username and password from database according to user's input


String loginName =request.getParameter( "username" ) ;

String password =request.getParameter( "password" ) ;

Connection c=antosrc.MySqlConnection.getConnection();
try {
	Statement s=c.createStatement();
	ResultSet r = s.executeQuery("SELECT count(*) FROM user WHERE (username = '"+loginName+"') and (password = '"+password+"')");
	r.next();
// Check username and password match
if (r.getInt(1) == 1) 
{
        // Set username session variable
  session.setAttribute( "userName", loginName );

        // Jump to secured page

        response.sendRedirect("MainPage1.jsp");

}
        
else {
        // Jump to login page
        response.sendRedirect("phpLogin.jsp");
}
s.close();

} finally {
		
}

%>
</head>
</html>
					