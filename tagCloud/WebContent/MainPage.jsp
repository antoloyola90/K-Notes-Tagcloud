<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,antosrc.*,java.io.*,java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

// Check, if user is already login, then jump to secured page
if ( (session.getAttribute( "userName" ))==null) {
	 response.sendRedirect("phpLogin.jsp");
}

%>


<html>
<head>
<meta http-equiv="refresh" content="5;url=MainPage1.jsp">
<style type="text/css">

.glidetext{
position: relative;
/*Set initial position of your text. Make it just enough to hide the text from view:*/
left: -500px;
}

</style>

<script type="text/javascript">

//Sequential fly-in text script- by JavaScriptKit.com
//For this script and 400+ more, visit http://www.javascriptkit.com
//This notice must stay intact for use

var pausebetweenmsg=10;//customize pause in miliseconds between each message showing up (3000=3 seconds)
var glidespeed=50; //customize glide speed in pixels per frame.

var curobjindex=0;

function actualstyle(el, cssproperty){
if (el.currentStyle)
return el.currentStyle[cssproperty];
else if (window.getComputedStyle){
var elstyle=window.getComputedStyle(el, "");
return elstyle.getPropertyValue(cssproperty);
}
}

function collectElementbyClass(){
var classname="glidetext";
glidearray=new Array();
var inc=0;
var alltags=document.all? document.all : document.getElementsByTagName("*");
for (i=0; i<alltags.length; i++){
if (alltags[i].className==classname)
glidearray[inc++]=alltags[i];
}
if (glidearray.length>0)
onebyoneglide();
}

function onebyoneglide(){
if (curobjindex<glidearray.length)
glidetimer=setInterval("glideroutine()",50);
}

function glideroutine(){
if (parseInt(actualstyle(glidearray[curobjindex], "left"))<0)
glidearray[curobjindex].style.left=parseInt(actualstyle(glidearray[curobjindex], "left"))+50+"px";
else{
glidearray[curobjindex].style.left=0;
curobjindex++;
clearInterval(glidetimer);
setTimeout("onebyoneglide()", pausebetweenmsg)
}
}

if (window.addEventListener)
window.addEventListener("load", collectElementbyClass, false);
else if (window.attachEvent)
window.attachEvent("onload", collectElementbyClass);
else if (document.getElementById)
window.onload=collectElementbyClass

</script>
<style>
body{font-family:arial;}
a{color:white;text-decoration:none;font:bold}
a:hover{color:#606060}
td.menu{background:gray;}
iframe{background:transparent;}
table.nav
{
background:black;
position:relative;
font: bold 80% arial;
top:0px;
left:-145px;
}
p.panel,p.flip
{
margin:0px;
padding:5px;
text-align:center;
width:400px;
background:#e5eecc;
border:solid 1px #c3c3c3;
}
div.panel
{
width:400px;
height:300px;
display:none;
}
</style>
<script type="text/javascript">
var i=-135;
var intHide;
var speed=10;
function showmenu()
{
clearInterval(intHide);
intShow=setInterval("show()",10);
}
function hidemenu()
{
clearInterval(intShow);
intHide=setInterval("hide()",10);
}
function show()
{
if (i<-8)
	{
	i=i+speed;
	document.getElementById('myMenu').style.left=i;
	}
}
function hide()
{
if (i>-145)
	{
	i=i-speed;
	document.getElementById('myMenu').style.left=i;
	}
}
function getWiki(f)
{
	//document.getElementById("wikiFrame").style.visibility="visible";
	//document.getElementById("wikiFrame").width="300";
	//document.getElementById("wikiFrame").height="350";
	//document.getElementById("wikiFrame").src="wordInfo.jsp?word="+f;

}
function changeInfo(f)
{
	document.getElementById("wikiFrame").style.visibility="visible";
	document.getElementById("wikiFrame").width="300";
	document.getElementById("wikiFrame").height="100";
	document.getElementById('wikiFrame').style.position="absolute";
	document.getElementById('wikiFrame').style.left=event.clientX+10;
	document.getElementById('wikiFrame').style.top=event.clientY;
	document.getElementById("wikiFrame").src="wordInfo.jsp?word="+f;

}
function clear()
{
	document.getElementById('wikiFrame').style.visibility="hidden";
	document.getElementById("wikiFrame").width="0";
	document.getElementById("wikiFrame").height="0";
}


</script>
</head>

<body>
<h1>Hello, <%= session.getAttribute( "userName" )%></h1>

<h3 align="center" style="font-size:40,color:black">Wiki</h3>


<br /><br />
<table border="0" width="100%" cellpadding="3">
<tr>

<td width="5%" >

<table id="myMenu" class="nav" width="150" onmouseover="showmenu()" onmouseout="hidemenu()">
<tr><td rowspan="15" align="center" bgcolor="#FF8080">W<br />I<br />K<br />I</td></tr>

<tr><td class="menu"><a href="MainPage.jsp">Restart</a></td>
<tr><td class="menu"><a href="wordUpdate.jsp">Update</a></td>
<tr><td class="menu"><a href="logout.jsp">Logout</a></td>
<tr><td class="menu"><br />   </td></tr>



<%
	Connection c=antosrc.MySqlConnection.getConnection();
		//System.out.println(c);
	try {
		Statement s=c.createStatement();
		ResultSet r=s.executeQuery("select * from words");
		while (r.next()) {
			File chk=new File("C:/Users/Anto/Documents/tagCloud/"+r.getString(1)+".txt");
			try {
				Statement s1=c.createStatement();
				if(!chk.exists()){
					String url="http://en.wikipedia.org/wiki/"+r.getString(1);
					new XMLReader(r.getString(1));
				}
				s1.close();

			} finally {
					
			}
			
%>

   <tr><td class="menu"><a onmouseover="getWiki('<%=r.getString(1)%>')"><%=r.getString(1)%></a></td></tr>
  
   <%
   	}
		
		r.close();
		s.close();
   
		} finally {
			c.close();
	}%>

</table>
</td>





<td width="90%">


<div style="width:50" onmouseout="clear()">

<h2>Your Tag Cloud is being generated...</h2>

</div>



</tr>
</table>
 
<iframe id="wikiFrame" frameborder="0" style="visibility:hidden">
</iframe>

</body>
</html>
