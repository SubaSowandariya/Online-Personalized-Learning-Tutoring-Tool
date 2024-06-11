<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="" method="post">
    <label for="userName">Enter your name:</label>
    <input type="text" id="userName" name="userName"><br><br>

    <!-- Quiz questions -->
    <h3>Question 1: HTML stands for</h3>
    <label><input type="radio" name="html" value="a"> a) Hyper Text Markup Language</label><br>
    <label><input type="radio" name="html" value="b"> b) High Text Markup Language</label><br>
    <label><input type="radio" name="html" value="c"> c) Hyper Tabular Markup Language</label><br>

    <h3>Question 2: CSS stands for</h3>
    <label><input type="radio" name="css" value="a"> a) Cascading Style Sheet</label><br>
    <label><input type="radio" name="css" value="b"> b) Creative Style Sheet</label><br>
    <label><input type="radio" name="css" value="c"> c) Computer Style Sheet</label><br>

    <h3>Question 3: What is DSA?</h3>
    <label><input type="radio" name="dsa" value="a"> a) Data Structure Algorithm</label><br>
    <label><input type="radio" name="dsa" value="b"> b) Digital System Analysis</label><br>
    <label><input type="radio" name="dsa" value="c"> c) Data Symbol Architecture</label><br>

    <h3>Question 4: HTML and CSS are used together to design web pages (True/False)</h3>
    <label><input type="radio" name="q4" value="true"> True</label>
    <label><input type="radio" name="q4" value="false"> False</label><br>

    <h3>Question 5: DSA is a programming language (True/False)</h3>
    <label><input type="radio" name="q5" value="true"> True</label>
    <label><input type="radio" name="q5" value="false"> False</label><br>

    <input type="submit" value="Submit">
</form>

<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/form";
    String username = "root";
    String password = "Suba@123";

    // Attempt to establish database connection
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);

        // Check if the connection is successful
        if (conn != null) {
            // Check user authentication
            String userName = request.getParameter("userName");
            String query = "SELECT * FROM users WHERE name = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, userName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // User exists, proceed with quiz
                int score = 0;

                // Checking answers
                String htmlAnswer = request.getParameter("html");
                String cssAnswer = request.getParameter("css");
                String dsaAnswer = request.getParameter("dsa");
                String q4Answer = request.getParameter("q4");
                String q5Answer = request.getParameter("q5");

                // Checking HTML, CSS, DSA, and True/False questions
                if ("a".equals(htmlAnswer)) {
                    score += 1;
                }

                if ("a".equals(cssAnswer)) {
                    score += 1;
                }

                if ("a".equals(dsaAnswer)) {
                    score += 1;
                }

                if ("true".equals(q4Answer)) {
                    score += 1;
                }

                if ("false".equals(q5Answer)) {
                    score += 1;
                }

                // Insert score into the database
                String insertQuery = "INSERT INTO scores (name, score_value) VALUES (?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setString(1, userName);
                insertStmt.setInt(2, score);
                insertStmt.executeUpdate();

                // Displaying score
                out.println("<p>Your score is: " + score + "/5</p>");

                // Issue certificate if score is more than 3
                if (score > 3) {
                    out.println("<form action=\"downloadCertificate.jsp\" method=\"get\">");
                    out.println("<input type=\"hidden\" name=\"userName\" value=\"" + userName + "\">");
                    out.println("<input type=\"submit\" value=\"Download Certificate\">");
                    out.println("</form>");
                } else {
                    out.println("<p>Sorry, you didn't pass the quiz. Visit <a href=\"course.html\">Courses</a>.</p>");
                }
            } else {
                // User does not exist, show alert
                out.println("<script>alert('Invalid user');</script>");
            }

            // Close database connection
            conn.close();
        } else {
            out.println("<p>Failed to connect to the database.</p>");
        }
    } catch (Exception e) {
        out.println("<p>An error occurred: " + e.getMessage() + "</p>");
    }
%>


