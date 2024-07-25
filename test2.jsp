<%@ page import="java.util.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz</title>
</head>
<body>
    <h1>Quiz</h1>
    <form action="" method="post">
        <h3>Question 1: Which of the following is a stack operation?</h3>
        <label><input type="radio" name="stack" value="push"> a) Push</label><br>
        <label><input type="radio" name="stack" value="pop"> b) Pop</label><br>
        <label><input type="radio" name="stack" value="enqueue"> c) Enqueue</label><br>

        <h3>Question 2: Which of the following is a queue operation?</h3>
        <label><input type="radio" name="queue" value="push"> a) Push</label><br>
        <label><input type="radio" name="queue" value="pop"> b) Pop</label><br>
        <label><input type="radio" name="queue" value="enqueue"> c) Enqueue</label><br>

        <h3>Question 3: Which HTML tag is used to define an unordered list?</h3>
        <label><input type="radio" name="html" value="ul"> a) &lt;ul&gt;</label><br>
        <label><input type="radio" name="html" value="ol"> b) &lt;ol&gt;</label><br>
        <label><input type="radio" name="html" value="li"> c) &lt;li&gt;</label><br>

        <h3>Question 4: Which CSS property is used to change the background color of an element?</h3>
        <label><input type="radio" name="css" value="background-color"> a) background-color</label><br>
        <label><input type="radio" name="css" value="color"> b) color</label><br>
        <label><input type="radio" name="css" value="font-size"> c) font-size</label><br>

        <h3>Question 5: Which HTML tag is used to create a hyperlink?</h3>
        <label><input type="radio" name="html_hyperlink" value="a"> a) &lt;a&gt;</label><br>
        <label><input type="radio" name="html_hyperlink" value="link"> b) &lt;link&gt;</label><br>
        <label><input type="radio" name="html_hyperlink" value="href"> c) &lt;href&gt;</label><br>

        <input type="submit" value="Submit">
    </form>

    <%
        int score = 0;

        // Checking answers
        String stackAnswer = request.getParameter("stack");
        String queueAnswer = request.getParameter("queue");
        String htmlAnswer = request.getParameter("html");
        String cssAnswer = request.getParameter("css");
        String htmlHyperlinkAnswer = request.getParameter("html_hyperlink");

        // Checking stack and queue operations
        if ("push".equals(stackAnswer)) {
            score += 1;
        }

        if ("enqueue".equals(queueAnswer)) {
            score += 1;
        }

        // Checking HTML and CSS tags
        if ("ul".equals(htmlAnswer)) {
            score += 1;
        }

        if ("background-color".equals(cssAnswer)) {
            score += 1;
        }

        // Checking additional HTML tag question
        if ("a".equals(htmlHyperlinkAnswer)) {
            score += 1;
        }

        // Displaying score
        out.println("<p>Your score is: " + score + "</p>");
    %>

    <!-- Button to go back to certification.html -->
    <form action="certification.html">
        <input type="submit" value="Go back">
    </form>

    <!-- Button to take the test for Test 2 -->
   

    <!-- Script to display the score -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var scoreInput = document.getElementById('score');
            if (scoreInput) {
                var score = scoreInput.value;
                if (score) {
                    var test2Status = document.getElementById('test-2-status');
                    test1Status.innerHTML = "Score: " + score;
                }
            }
        });
    </script>
</body>
</html>
