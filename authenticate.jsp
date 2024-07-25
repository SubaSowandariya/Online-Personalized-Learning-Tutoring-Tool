<!-- authenticate.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/user_auth";
    String dbUsername = "root";
    String dbPassword = "Suba@123";

    try {
        // Connect to the database
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // Prepare and execute the SQL query
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();

        // Check if the user is authenticated
        if (resultSet.next()) {
            // User is authenticated, display inbox
            String inboxMessage = resultSet.getString("inbox_message");
%>
            <h2>Welcome to your Inbox, <%= username %>!</h2>
            <p><%= inboxMessage %></p>
<%
        } else {
            // Authentication failed, display error message and redirect to login page
%>
            <h2>Login Failed</h2>
            <p>Invalid username or password. Please try again.</p>
            <a href="login.jsp">Go back to login page</a>
<%
        }

        // Close database connection
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>
