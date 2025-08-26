<%@include file="DBConn.jsp" %>
<%
String htno=request.getParameter("htno");
String purpose=request.getParameter("purpose");
int status=0,st=0;
PreparedStatement pst=con.prepareStatement("select status from response where studentid=?");
pst.setString(1,htno);
ResultSet rs=pst.executeQuery();
if(rs.next())
  st=rs.getInt(1);
if(st == 1)
{
    	PreparedStatement p=con.prepareStatement("insert into emergency_requests(studentid,purose,status) values(?,?,?)");
	p.setString(1,htno);p.setString(2,purpose);p.setInt(3,0);
	int k=p.executeUpdate();
	%>
	<Script>
	alert("Request sent to admin");
	window.location="userhome.jsp";
	</script>
<%
	}
else
{%>
	<script>alert("Your Previous request is in pending,Please wait for admin confirmation");
	window.location="userhome.jsp";
	</script>
<%}
%>