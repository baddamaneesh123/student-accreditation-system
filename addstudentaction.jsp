<%@include file="DBConn.jsp" %>
<%
String htno=request.getParameter("htno");
String name=request.getParameter("name");
String branch=request.getParameter("branch");

	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	String mno=request.getParameter("mno");
	String addr=request.getParameter("addr");
	PreparedStatement p=con.prepareStatement("select * from student_details where studentid=?");
	p.setString(1,htno);
	ResultSet rs=p.executeQuery();
	if(rs.next())
	{%>
	           <Script>
			    alert("Hall Ticket Number is already Registered");
				window.location="newuser.html";
             </script>
	<%}
	else{
	PreparedStatement pst=con.prepareStatement("insert into student_details values(?,?,?,?,?,?,?)");
    pst.setString(1,htno);pst.setString(2,name);pst.setString(3,branch);pst.setString(4,email);
	pst.setString(5,pwd);pst.setString(6,mno);pst.setString(7,addr);
	int i=pst.executeUpdate();
%>
<script>
  alert("Registered Successfully,Please Login to Continue");
  window.location="user.html";
</script>
<%
	}
%>