<%@page import="java.sql.*" %>
<%@include file="DBConn.jsp" %>
<%
String htno=request.getParameter("htno");
String m=request.getParameter("message");
PreparedStatement pst=con.prepareStatement("insert into normal_response values(?,?)");
pst.setString(1,htno);
pst.setString(2,m);
int i=pst.executeUpdate();


PreparedStatement pst1=con.prepareStatement("update response set status=1 where studentid=?");
pst1.setString(1,htno);
pst1.executeUpdate();
%>
<script>
alert("Message sent successfully");
window.location="adminhome1.jsp";
</script>