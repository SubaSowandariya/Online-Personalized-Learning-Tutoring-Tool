<?php
// Handle form submission
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Retrieve form data
    $name = $_POST["name"];
    $email = $_POST["email"];
    // ... (retrieve other form fields)

    // Perform server-side validation if needed

    // Assume the form data is valid, create a response
    $response = array("name" => $name, "email" => $email);
    
    // Send the response as JSON
    header('Content-Type: application/json');
    echo json_encode($response);
} else {
    // Handle invalid requests
    http_response_code(400);
    echo "Invalid request";
}
?>
