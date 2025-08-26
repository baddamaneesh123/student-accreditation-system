<%@include file="DBConn.jsp" %>
<%
String htno=request.getParameter("htno");
PreparedStatement pst=con.prepareStatement("insert into response(studentid,status) values(?,?)");
pst.setString(1,htno);
pst.setInt(2,0);
int i=pst.executeUpdate();

PreparedStatement p=con.prepareStatement("update student_req set status=? where studentid=?");
p.setInt(1,1);
p.setString(2,htno);
int j=p.executeUpdate();
%>
<script>
 alert("Request Forwarded to Exam department");
 window.location="adminhome1.jsp";
</script>