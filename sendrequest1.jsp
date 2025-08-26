<%@ page import="java.sql.*" %>
<%@ include file="DBConn.jsp" %>
<%
String htno = request.getParameter("htno");
String message = request.getParameter("message");

PreparedStatement p = null;
PreparedStatement pst = null;
ResultSet rs = null;

try {
    // Corrected SELECT query using 'HallticketNumber'
    p = con.prepareStatement("select status from student_req where HallticketNumber=?");
    p.setString(1, htno);
    rs = p.executeQuery();

    if(rs.next()) {
        int status = rs.getInt(1);
        if(status < 4) {
            %>
            <script>
            alert("Your Previous Request is in Process, Please wait");
            window.location="userhome.jsp";
            </script>
            <%
        }
    } else {
        // Corrected INSERT query specifying columns
        pst = con.prepareStatement("insert into student_req(HallticketNumber, Message, status) values(?,?,?)");
        pst.setString(1, htno);
        pst.setString(2, message);
        pst.setInt(3, 0);
        pst.executeUpdate();
        %>
        <script>
        alert("Request sent to Admin");
        window.location="userhome.jsp";
        </script>
        <%
    }
} catch (SQLException e) {
    // Log the error for debugging
    e.printStackTrace();
    // Display a user-friendly error message
    out.println("<p>Database error occurred: " + e.getMessage() + "</p>");
} finally {
    // Close resources in a finally block
    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
    if (p != null) try { p.close(); } catch (SQLException ignore) {}
    if (pst != null) try { pst.close(); } catch (SQLException ignore) {}
    if (con != null) try { con.close(); } catch (SQLException ignore) {}
}
%>
