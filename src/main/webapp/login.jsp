<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login Page</title>
  <style>  
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      overflow: hidden;
    }
    .container {
      width: 400px;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }
    .logo {
      text-align: center;
      margin-bottom: 15px;
    }
    .logo img {
      max-width: 30%;
      height: auto;
    }
      .logo {
      text-align: center;
      margin-bottom: 15px;
    }
    .logo img {
    
      max-width: 30%;
      height: auto;
    }
    h1 {
  padding-top: 1px;
  text-align: center;
  margin-bottom: 20px;
  margin-top: -20px; /* Add a negative margin-top value */
}
    label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }
    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      border-radius: 3px;
      border: 1px solid #ccc;
      box-sizing: border-box; /* Add this property */
    }
    .button-group {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 20px; /* Add this property */
    }
    button {
      flex: 1;
      padding: 10px;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }
    button[type="reset"] {
      background-color: #e74c3c;
      margin-left: 10px; /* Add this property */
    }
    .register-link{
    text-align: center;
    margin-top : 10px;
    }
  </style>
</head>
<body>

  <div class="container">
    <div class="logo">
      <img src="img/logo_WMroKjH.png" alt="Logo">
    </div>
    <h1>Login</h1>
    <form action="LoginServlet" method="post">
      <label for="username">Email:</label>
      <input type="text" id="email" name="email" placeholder="Enter your Email" required>
      <br><br>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" placeholder="Enter your password" required>

      <div class="button-group">
        <button type="submit">Login</button>
        <button type="reset">Reset</button>
      </div>
      <div class="register-link">
      If not a user? <a href="Register.jsp">Register</a>
    </div>
    </form>
  </div>
</body>
</html>
