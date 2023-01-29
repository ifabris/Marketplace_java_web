<%-- 
    Document   : editProducts
    Created on : 28.01.2022., 18:06:58
    Author     : Ivan
--%>

<%@page import="hr.algebra.model.User"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hr.algebra.model.Product"%>
<%@page import="hr.algebra.model.Product"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="hr.algebra.dal.sql.DataSourceSingleton"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    User auth = (User) request.getSession().getAttribute("auth");
if (auth == null) {
    response.sendRedirect("LoginUser.html");
    return;
}
if (auth.getId() != 1) {
        response.sendRedirect("Home.html");
    }
    
       DataSource ds = DataSourceSingleton.getInstance();
     Connection con = ds.getConnection();
     Statement statement = con.createStatement();
     List<Product> products = new ArrayList<>();     
     String query = "Select * from Proizvod";
     ResultSet rs2 = statement.executeQuery(query);    
     while (rs2.next()) {
         products.add(new Product(rs2.getInt("ProizvodID"),rs2.getString("ProductName"),rs2.getInt("Price"),rs2.getString("ProductDescription"),rs2.getInt("CategoryID"),rs2.getString("Picture"),rs2.getInt("Amount")));
     }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">JWP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
     <ul class="navbar-nav ms-auto">
        <li class="nav-item active">
          <a class="nav-link" href="Home.html">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="products.jsp">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="orders.jsp">Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="LoginUser.html">Logout</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="editProducts.jsp">Edit products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="editCategories.jsp">Edit categories</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="loginUserData.jsp">Login info</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cart.jsp">Cart</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Full Page Image Header with Vertically Centered Content -->
<header class="masthead">
  <div class="container h-100">
    <div class="row h-100 align-items-center">
      <div class="col-12 text-center">
<table class="table table-striped table-hover">
				<thead>
					<tr>

						<th>ID</th>
						<th>Name</th>
						<th>Price</th>
						<th>Description</th>
						<th>Picture URL</th>
						<th>Amount</th>
						<th>CategoryID</th>
						<th>Actions</th>
                                                
					</tr>
				</thead>
				<tbody>
                                    <% 
                                        for (Product p : products) {   
                                    %>
					<tr>

						<td><%=p.getProizvodID()%></td>
						<td><%=p.getProductName()%></td>
						<td><%=p.getPrice()%></td>
						<td><%=p.getProductDescription()%></td>
						<td><%=p.getPicture()%></td>
						<td><%=p.getAmount()%></td>
						<td><%=p.getCategoryID()%></td>
						<td>
							<a href="editSingleProduct.jsp?id=<%=p.getProizvodID()%>" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">Edit</i></a>
                                                        <a href="DeleteProduct?id=<%= p.getProizvodID() %>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete" style="color: red">Delete</i></a>
						</td>
					</tr>
                                        <%} %>
				</tbody>
			</table>
                                <a href="addProduct.jsp" type="button" class="btn btn-dark">Add product</a>
      </div>
    </div>
  </div>
                                
</header>
                                
    </body>

    <style>
        .masthead {
  height: 100vh;
  min-height: 500px;
  background-image: url('https://source.unsplash.com/BtbjCFUvBXs/1920x1080');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</html>
