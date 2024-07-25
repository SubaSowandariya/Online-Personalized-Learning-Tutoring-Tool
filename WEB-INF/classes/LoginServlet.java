import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get input values from the form
        String inputName = request.getParameter("name");
        String inputPassword = request.getParameter("password");

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/form";
        String dbUser = "root";
        String dbPassword = "Suba@123";

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Prepare the SQL query with both name and password conditions
            String sqlQuery = "SELECT * FROM users WHERE name = ? AND password = ?";
            preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, inputName);
            preparedStatement.setString(2, inputPassword);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            // Check if a match is found
            if (resultSet.next()) {
                // Match found, redirect to course.html
                response.sendRedirect("web/course.html");
            } else {
                // No match found, show dialog box for invalid user
                PrintWriter out = response.getWriter();
                out.println("<script>alert('Invalid user'); window.location.href='web/Login.html';</script>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real application
        } finally {
            // Close database resources
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
