<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Error</title>
  <style>
  #{
  	
  
  }
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .error-container {
      text-align: center;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }
    h1 {
      color: #e74c3c;
      font-size: 24px;
      margin-bottom: 10px;
    }
    p {
      color: #333;
      font-size: 18px;
      margin-bottom: 20px;
    }
    .redirect-link {
      color: #3498db;
      text-decoration: none;
    }
  </style>
</head>
<body>
  <div class="error-container">
    <h1>Error: User Not Valid</h1>
    <p>We're sorry, but the provided user is not valid.</p>
    <a class="redirect-link" href="/My_Project/login.jsp">Back To Login</a>
  </div>
</body>
</html>
