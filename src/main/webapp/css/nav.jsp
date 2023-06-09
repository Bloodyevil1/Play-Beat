<%@page import="com.learn.mycart.entities.User"%>
<%
	User user1 = (User)session.getAttribute("current-user");
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
	<nav>
    <div class="navbar">
      <a href="index.jsp" class="logo">PlayBeat</a>
      <ul class="nav-links">
        <li><a href="index.jsp" >Home</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-btn">Categories</a>
          <div class="dropdown-content">
            <a href="#">Electronics</a>
            <a href="#">Clothing</a>
            <a href="#">Home &amp; Kitchen</a>
            <!-- Add more categories here -->
          </div>
        </li>
        <%
        	if(user1==null){
        %>
        		<li><a href="login.jsp">Login</a></li>
                <li><a href="Register.jsp">Register</a></li>
        <%	}
       
        	else{
        %>
                
        		<li><a href="LogOutServlet">Logout</a></li>
                <li><a href="#"><%= user1.getUserName()%></a></li>
        	<%
        	}
        	%>

      		</ul>
    </div>
  </nav>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  
</body>
</html>