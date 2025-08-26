<%@include file="DBConn.jsp" %>
<%
String user=request.getParameter("user");
String pwd=request.getParameter("pwd");
PreparedStatement pst=con.prepareStatement("select * from student_details where studentid=? and pwd=?");
pst.setString(1,user);pst.setString(2,pwd);
ResultSet rs=pst.executeQuery();
if(rs.next()){
	session.setAttribute("UserName",user);
	response.sendRedirect("userhome.jsp");
}
else
{
	%>
	<script>
	alert("Invalid UserName/Password,Try Again");
	window.location="user.html";
	</script>
<%}
%>