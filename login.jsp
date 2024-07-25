<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String action = request.getParameter("action");
    if (action == null) {
        action = "";
    }

    if (action.equals("login")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isValidUser = false;

        // Database connection and validation
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/userDB", "root", "Suba@123");
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                isValidUser = true;
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (isValidUser) {
            session.setAttribute("attempts", 0); // Reset attempts on successful login
            response.sendRedirect("home.jsp");
        } else {
            Integer attempts = (Integer) session.getAttribute("attempts");
            if (attempts == null) {
                attempts = 0;
            }
            attempts++;
            session.setAttribute("attempts", attempts);

            if (attempts >= 3) {
                response.sendRedirect("error.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid credentials, attempt " + attempts + " of 3.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="login.jsp?action=login" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <button type="submit">Login</button>
    </form>
    <% if (request.getAttribute("errorMessage") != null) { %>
        <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
    <% } %>
</body>
</html>
