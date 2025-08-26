<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Database Connection Test</title>
</head>
<body>
<%
try {
    // Load the modern MySQL driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Connect to your "sas" DB on port 3307
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3307/sas?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
        "root",
        "Aneeshreddy6@#$"
    );

    out.println("<h2 style='color:green;'>✅ Database connected successfully!</h2>");
    con.close();
} catch(Exception e) {
    out.println("<h2 style='color:red;'>❌ Database connection error:</h2>");
    out.println("<pre>" + e + "</pre>");
}
%>
</body>
</html>
