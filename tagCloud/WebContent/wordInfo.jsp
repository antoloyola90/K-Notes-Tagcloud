<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,antosrc.*,java.io.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.mysql.jdbc.Driver"%><html>
<head>
<style>
body{font-family:serif;color:white;background:black;font-size:small;}
#content-wrapper
{
	display:none;	
}
 
</style>

<script type="text/javascript">

window.onload=function()
{
    document.body.removeChild(document.getElementById('pb'));
};
</script>

</head>
<body>

<p>
<%
Connection c=antosrc.MySqlConnection.getConnection();
System.out.println(c);
	String word=request.getParameter("word");
	try {
		Statement s=c.createStatement();
		
		ResultSet r1=s.executeQuery("select * from words where word='"+word+"'");
		String url="";
		
		InputStream inp = new FileInputStream("C:/Users/Anto/Documents/tagCloud/"+word+".txt");
		Reader rd = new InputStreamReader(inp);
		   int chr;
		   while((chr=rd.read())!=-1){out.print((char)chr);
		   }

		   
	r1.close();
	s.close();

	} finally {
		c.close();
}%>
</p>

</body>
</html>