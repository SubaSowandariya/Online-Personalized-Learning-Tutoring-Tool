<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Store Data JSP</title>
</head>
<body>
<h2>Store Data</h2>
<form action="" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br><br>
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>
    
    <input type="submit" value="Submit">
</form>

<%
    if (request.getMethod().equals("POST")) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the MySQL database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sample", "root", "Suba@123");

            // Insert data into the database
            String sql = "INSERT INTO users (name, email) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.executeUpdate();
%>
            <p>Data stored successfully!</p>
<%
        } catch (SQLException se) {
            se.printStackTrace();
%>
            <p>Error occurred while storing data!</p>
<%
        } catch (Exception e) {
            e.printStackTrace();
%>
            <p>Error occurred while storing data!</p>
<%
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
%>

<a href="sample1.jsp">Retrieve Data</a>

</body>
</html>
