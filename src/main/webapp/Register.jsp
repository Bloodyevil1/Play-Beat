<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>PlayBeat</title>
   <style>

  <%@ include file="css/styles.css" %>
	
    body {
      font-family: Arial, sans-serif;
     	background-color: #f0f0f0;
    }

    .containe {
      max-width: 470px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
      margin-top: 50px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
    }

    .form-group {
      margin-bottom: 20px;
      width: 370px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
    }

    .form-group input[type="text"],
    .form-group input[type="password"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    .form-group button {
      display: block;
      width: 100%;
      padding: 10px;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    .form-group button:hover {
      background-color: #45a049;
    }
     .register-link{
    text-align: center;
    margin-top : 10px;
    }
  </style>
</head>
<body>
	
	<%@ include file="css/nav.jsp" %>
	<div class="containe">
    <h2>Register</h2>

    <form action="RegisterServlets" method="post">
      <div class="form-group">
        <label for="name">User Name</label>
        <input type="text" id="title" name="user_name" placeholder="Enter Title">
      </div>
      <div class="form-group">
        <label for="email">User Email</label>
        <input type="text" id="email" name="user_email" placeholder="Enter Content">
      </div>
      <div class="form-group">
        <label for="password">User Password</label>
        <input type="password" id="password" name="user_password" placeholder="Enter Content">
      </div>
      <div class="form-group">
        <label for="phone">User phone</label>
        <input type="text" id="phone" name="user_phone" placeholder="Enter Content">
      </div>
      <div class="form-group">
        <label for="address">User Address</label>
        <input type="text" id="address" name="user_address" placeholder="Enter Content">
      </div>
      <div class="form-group">
        <button type="submit">Register</button>
      </div>
      <div class="register-link">
      If a user? <a href="login.jsp">Login</a>
    </div>
    </form>
  </div>
	
</body>
</html>
