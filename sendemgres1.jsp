<%@page import="java.sql.*" %>
<%@page import="java.util.*"  %>
<%@page import="javax.mail.*" %> 
<%@page import="javax.mail.internet.*" %>  
<%@page import="javax.activation.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
<%@include file="DBConn.jsp" %>
<%
String htno=request.getParameter("htno");
String m=request.getParameter("message");
PreparedStatement pst=con.prepareStatement("select email from student_details where studentid=?");
pst.setString(1,htno);
ResultSet rs=pst.executeQuery();
rs.next();
String email=rs.getString(1);
PreparedStatement p=con.prepareStatement("update emergency_requests set response=?,status=? where studentid=?");
p.setString(1,m);p.setInt(2,1);p.setString(3,htno);
int k=p.executeUpdate();
%>
<script>
 alert("Message sent to Student");
 window.location="adminhome1.jsp";
</script>
