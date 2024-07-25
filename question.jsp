<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    int questionNumber = Integer.parseInt(request.getParameter("q"));
    String question = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/examDB", "root", "Suba@123");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM questions WHERE order_number=" + questionNumber);
        if (rs.next()) {
            question = rs.getString("question");
        } else {
            // Redirect to result.jsp if there are no more questions
            response.sendRedirect("result.jsp");
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
    <title>Question <%= questionNumber %></title>
    <script>
        let timeLeft = 60;
        const timer = setInterval(() => {
            document.getElementById('timer').innerText = 'Time left: ' + timeLeft + 's';
            if (timeLeft <= 0) {
                clearInterval(timer);
                document.forms[0].submit();
            }
            timeLeft -= 1;
        }, 1000);
    </script>
</head>
<body>
    <div style="text-align: right;">
        <span id="timer">Time left: 60s</span>
    </div>
    <h3>Question <%= questionNumber %></h3>
    <p><%= question %></p>
    <form action="question.jsp" method="get">
        <input type="hidden" name="q" value="<%= questionNumber + 1 %>">
        <input type="text" name="answer" required>
        <button type="submit">Next</button>
    </form>
</body>
</html>
