<!doctype html>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
<%@include file="css/styles.css"%>
</style>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css/">
<title>PlayBeat</title>

<link rel="icon" type="image/x-icon" href="img/logo_WMroKjH.png">
</head>
<body>
	<%@ include file="css/nav.jsp"%>

	<br>

	<!-- Rest of your webpage content goes here -->
<div class="container-fluid">
<div class="row mx-2 mt-4">
	<%
	
	String cat =request.getParameter("category");
	//out.println(cat);
	ProductDao dao = new ProductDao(FactoryProvider.getFactory());
	List<product> list=null;
	if(cat==null ||cat.trim().equals("all")){
		list= dao.getAllProduct();
		
		
	}else{
		int cid =Integer.parseInt(cat.trim());
		
		list=dao.getAllProductById(cid);
		
	}
	
	CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
	List<category> clist = cdao.getCategories();
	%>
	<div class="col-md-2">
		<div class="list-group ">
			<a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">All Products</a>

			<%
			for (category c : clist) {
			%>
			<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

			<%
			}
			%>
		</div>
	</div>
	<div class="col-md-10">
		<div class="row">
			<%
			for (product p : list) {
			%>
			<div class="col-md-4 mb-4">
				<div class="card">
							<div class="container text-center">
					<img src="img/Products/<%= p.getpPhoto() %>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="...">
							
					</div>
					<div class="card-body">
						<h6 class="card-title"><%=p.getpName()%></h6>
						<p class="card-text">
							<%= Helper.get10Words(p.getpDesc()) %>
						</p>
					</div>
					<div class="card-footer" align="center">
						<button class="btn btn-primary">Add Cart</button>
						<button class="btn btn-outline-primary">&#8377;<%= p.getpPrice()%><span class="text-secondary" >/-<%= p.getpDiscount()+"%" %>off</span></button>
					</div>
				</div>
			</div>
			<%
			}
			if(list.size()==0){
				out.println("<h3>no item in this category</h3>");
			}
			%>
		</div>
	</div>
</div>
</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
		<script src="My_Project/src/main/resources/js/Script.js"></script>
		

</body>
</html>