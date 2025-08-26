<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3307/sas?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
            "root",
            "Aneeshreddy6@#$"
        );
    } catch(Exception e) {
        // You can log the error or print it to the JSP output
        out.println("DB Connection Error: " + e.getMessage());
        // It's good practice to halt execution if a critical connection fails
        return;
    }
%>
