
<%@page import="com.sun.org.apache.bcel.internal.generic.GOTO"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,antosrc.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
//Connection c=antosrc.MySqlConnection.getConnection();
//c.setAutoCommit(true);
String pname;
pname=request.getParameter("pname");
String username=session.getAttribute( "userName" ).toString();
BgThread.add(pname,username);
/*
String[] tokens = pname.split(", ");
for(String t : tokens) {
    
	url="http://www.google.com/search?q="+t+"+site:en.wikipedia.org/wiki/&btnI";
	query="insert into words (word,info) values('"+t+"','"+url+"')";
	System.out.println("> "+t);
	try {
		Statement s=c.createStatement();
		s.execute(query);
		
		//c.commit();
	} catch (Exception e) {
		//e.printStackTrace();
		//c.rollback();
	} 
}

	c.close();
*/
response.setStatus(301);
response.setHeader( "Location", "MainPage.jsp" );
response.setHeader( "Connection", "close" );
%>

