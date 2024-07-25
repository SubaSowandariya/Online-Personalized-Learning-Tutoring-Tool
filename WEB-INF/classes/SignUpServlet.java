import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        int age = Integer.parseInt(request.getParameter("age"));
        String dob = request.getParameter("dob");
        String role = request.getParameter("role");

        // Database connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/form";
        String dbUser = "root";
        String dbPassword = "Suba@123";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Insert data into the database
            String insertQuery = "INSERT INTO users (name, email, password, phone, age, dob, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, phone);
            preparedStatement.setInt(5, age);
            preparedStatement.setString(6, dob);
            preparedStatement.setString(7, role);

            int rowsAffected = preparedStatement.executeUpdate();

            // Close resources
            preparedStatement.close();
            connection.close();

            if (rowsAffected > 0) {
                // Redirect to the display page
                response.sendRedirect("web/Login.html");
            } else {
                out.println("<h2>Registration failed. Please try again.</h2>");
            }

        } catch (NumberFormatException e) {
            out.println("<h2>Error: Invalid input for age.</h2>");
            e.printStackTrace();
        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
            e.printStackTrace();
        }
    }
}
