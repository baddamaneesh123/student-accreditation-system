<%@ page import="java.sql.*" %>
<%@ include file="DBConn.jsp" %>

<%
String user=request.getParameter("user");
String pwd=request.getParameter("pwd");
if(user.equals("admin") && pwd.equals("admin"))
{
	session.setAttribute("UserName",user);
	response.sendRedirect("adminhome1.jsp");
}
else
{%>
  <script>
  alert("Wrong UserName/Password,Try again");
  window.location="admin.html";
  </script>
<%}
%>