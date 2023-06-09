<%@page import="com.learn.mycart.entities.category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Modal with Trigger Example</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

.admin .card:hover {
	border: 1px solid #673ab7;
	background: #e2e2e2;
	cursor: pointer;
}

.admin1 .card:hover {
	border: 1px solid #673ab7;
	background: #e2e2e2;
	cursor: pointer;
}
<%@ include file="css/styles.css"%>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="css/nav.jsp"%>
	<div class="container admin">
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card ">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 110px;" src="img/group.png" alt="user.png">
						</div>
						<h1>376276</h1>
						<h1>Users</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 110px;" src="img/category.png"
								alt="user.png">
						</div>
						<h1>25252</h1>
						<h1>Categories</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 110px;" src="img/box.png" alt="user.png">
						</div>
						<h1>8787</h1>
						<h1>Products</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container admin1">
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 110px;" src="img/list.png"
								alt="category.png">
						</div>
						<p class="mt-2">Click here to add category</p>
						<h1>726</h1>
						<h1>Add Category</h1>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 110px;" src="img/menu.png"
								alt="category.png">
						</div>
						<p class="mt-2">Click here to add product</p>
						<h1>726</h1>
						<h1>Add Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<!-- product Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
					<input type="hidden" value="addcategory" name="operation">
						<div class="form-group">		
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter Category Title" required />
						</div>
						<br>
						<div class="form-group">
							<textarea style="height: 300px"
								placeholder="Enter category descrition" name="catDescription"
								class="form-control" required></textarea>
						</div>
						<br>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end modal -->

	<!-- Modal 2 -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
					<input type="hidden" value="addproduct" name="operation">
						<div class="form-group">
							<input type="text" class="form-control" name="pName"
								placeholder="Enter Product Name" required />
						</div>
						<br>
						<div class="form-group">
							<textarea style="height: 150px"
								placeholder="Enter Product Description" name="pDesc"
								class="form-control" required></textarea>
						</div>
						<br>
						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter Product Price" required />
						</div>
						<br>
						<div class="form-group">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter Product Discount" required />
						</div>
						<br>
						<div class="form-group">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter Product Quantity" required />
						</div>
						<br>
						<div><h6>Category :</h6><div>
						<%
						CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
						List<category> list=cdao.getCategories();
						
						%>
						<div class="form-group" >
							<select class="form-control text-center" name="catId">
							<% for(category c:list){
							%>
							<option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
							
							<%} %>
						
						</select>
						</div>
						<br>
						<div class="form-group">
							<input	type="file" name="pPhoto" id="pPhoto" required/>
						
						</div>
						<br>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
						
						
					</form>
				</div>
				
		</div>
	</div>


	<!-- product modal end -->
</body>
</html>