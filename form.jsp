<!DOCTYPE html>
<html>
<head>
    <title>Form Submission Result</title>
</head>
<body>
    <h2>Form Submission Result</h2>
    <p>Name: <%= request.getAttribute("name") %></p>
    <p>Email: <%= request.getAttribute("email") %></p>
</body>
</html>
