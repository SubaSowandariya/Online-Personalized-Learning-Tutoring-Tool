<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    String greetingMessage = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userDB", "root", "Suba@123");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT message FROM greetings ORDER BY RAND() LIMIT 1");
        if (rs.next()) {
            greetingMessage = rs.getString("message");
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>
    <h2>Home Page</h2>
    <p><%= greetingMessage %></p>
</body>
</html>