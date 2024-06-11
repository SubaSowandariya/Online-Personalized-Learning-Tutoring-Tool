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
        <h3>Question 1: What is the main operation on a linked list?</h3>
        <label><input type="radio" name="linked_list" value="insert"> a) Insert</label><br>
        <label><input type="radio" name="linked_list" value="delete"> b) Delete</label><br>
        <label><input type="radio" name="linked_list" value="search"> c) Search</label><br>

        <h3>Question 2: Which data structure is used to represent a hierarchical relationship between elements?</h3>
        <label><input type="radio" name="tree" value="tree"> a) Tree</label><br>
        <label><input type="radio" name="tree" value="heap"> b) Heap</label><br>
        <label><input type="radio" name="tree" value="stack"> c) Stack</label><br>

        <h3>Question 3: Which HTML tag is used to create a line break?</h3>
        <label><input type="radio" name="html" value="br"> a) &lt;br&gt;</label><br>
        <label><input type="radio" name="html" value="hr"> b) &lt;hr&gt;</label><br>
        <label><input type="radio" name="html" value="p"> c) &lt;p&gt;</label><br>

        <h3>Question 4: Which CSS property is used to set the text color?</h3>
        <label><input type="radio" name="css" value="color"> a) color</label><br>
        <label><input type="radio" name="css" value="background-color"> b) background-color</label><br>
        <label><input type="radio" name="css" value="font-size"> c) font-size</label><br>

        <h3>Question 5: Which data structure is used to implement priority queues?</h3>
        <label><input type="radio" name="heap" value="heap"> a) Heap</label><br>
        <label><input type="radio" name="heap" value="stack"> b) Stack</label><br>
        <label><input type="radio" name="heap" value="queue"> c) Queue</label><br>

        <input type="submit" value="Submit">
    </form>

    <% 
        int score = 0;

        // Checking answers
        String linkedListAnswer = request.getParameter("linked_list");
        String treeAnswer = request.getParameter("tree");
        String htmlAnswer = request.getParameter("html");
        String cssAnswer = request.getParameter("css");
        String heapAnswer = request.getParameter("heap");

        // Checking linked list and tree operations
        if ("insert".equals(linkedListAnswer)) {
            score += 1;
        }

        if ("tree".equals(treeAnswer)) {
            score += 1;
        }

        // Checking HTML and CSS tags
        if ("br".equals(htmlAnswer)) {
            score += 1;
        }

        if ("color".equals(cssAnswer)) {
            score += 1;
        }

        // Checking heap implementation
        if ("heap".equals(heapAnswer)) {
            score += 1;
        }

        // Displaying score
        out.println("<p>Your score is: " + score + "</p>");
    %>

    <!-- Button to go back to certification.html -->
    <form action="certification.html">
        <input type="submit" value="Go back">
    </form>

    <!-- Script to display the score -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var scoreInput = document.getElementById('score');
            if (scoreInput) {
                var score = scoreInput.value;
                if (score) {
                    var test3Status = document.getElementById('test-3-status');
                    test1Status.innerHTML = "Score: " + score;
                }
            }
        });
    </script>
</body>
</html>
