<%@include file="DBConn.jsp" %>
<%
String htno=request.getParameter("htno");
String name=request.getParameter("name");
String branch=request.getParameter("branch");
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
String mno=request.getParameter("mno");
String addr=request.getParameter("addr");
PreparedStatement pst=con.prepareStatement("update student_details set sname=?,branch=?,email=?,pwd=?,mno=?,addr=? where studentid=?");
pst.setString(1,name);pst.setString(2,branch);
pst.setString(3,email);pst.setString(4,pwd);pst.setString(5,mno);pst.setString(6,addr);
pst.setString(7,htno);
int i=pst.executeUpdate();
%>
<script>
alert("Student details are Updated");
window.location="userhome.jsp"
</script>