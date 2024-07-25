<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display User Data</title>
</head>
<body>
    <h2>User Data</h2>
    <%
        // Database connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/form";
        String dbUser = "root";
        String dbPassword = "Suba@123";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Retrieve user data from the database
            String selectQuery = "SELECT * FROM users";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(selectQuery);

            // Display user data
            out.println("<table border='1'>");
            out.println("<tr><th>Name</th><th>Email</th><th>Phone</th><th>Age</th><th>Date of Birth</th><th>Role</th></tr>");
            while (resultSet.next()) {
                out.println("<tr>");
                out.println("<td>" + resultSet.getString("name") + "</td>");
                out.println("<td>" + resultSet.getString("email") + "</td>");
                out.println("<td>" + resultSet.getString("phone") + "</td>");
                out.println("<td>" + resultSet.getInt("age") + "</td>");
                out.println("<td>" + resultSet.getString("dob") + "</td>");
                out.println("<td>" + resultSet.getString("role") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
            e.printStackTrace();
        }
    %>
</body>
</html>
