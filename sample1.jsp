<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Retrieve Data JSP</title>
</head>
<body>
<h2>Retrieve Data</h2>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Connect to the MySQL database
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sample", "root", "Suba@123");

        // Select data from the database
        String sql = "SELECT * FROM users";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>
        <table border="1">
            <tr>
                <th>Name</th>
                <th>Email</th>
            </tr>
<%
        while (rs.next()) {
            String name = rs.getString("name");
            String email = rs.getString("email");
%>
            <tr>
                <td><%= name %></td>
                <td><%= email %></td>
            </tr>
<%
        }
%>
        </table>
<%
    } catch (SQLException se) {
        se.printStackTrace();
%>
        <p>Error occurred while retrieving data!</p>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <p>Error occurred while retrieving data!</p>
<%
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>

</body>
</html>
