<%@include file="DBConn.jsp" %>
<%
String htno=request.getParameter("htno");
String message=request.getParameter("message");
PreparedStatement pst=con.prepareStatement("update response set deptadminres=? where studentid=?");
pst.setString(2,htno);
pst.setString(1,message);
int i=pst.executeUpdate();
%>
<script>
  alert("HTNO<%= htno %> Details Updated");
  window.location="deptadminhome.jsp";
</script>