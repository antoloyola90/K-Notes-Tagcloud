<%


// Delete certain session
session.invalidate();
// Delete all session variables
// session_destroy();

// Jump to login page
response.sendRedirect("phpLogin.jsp");

%>
