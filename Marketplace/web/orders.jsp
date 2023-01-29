<%-- 
    Document   : orders
    Created on : 30.01.2022., 17:17:44
    Author     : Ivan
--%>

<%@page import="hr.algebra.model.Product"%>
<%@page import="hr.algebra.dal.sql.ProductDao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="hr.algebra.dal.sql.DataSourceSingleton"%>
<%@page import="java.sql.Connection"%>
<%@page import="hr.algebra.dal.sql.OrderDao"%>
<%@page import="java.util.List"%>
<%@page import="hr.algebra.model.Order"%>
<%@page import="hr.algebra.model.User"%>
<%@page import="java.text.DecimalFormat"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
User auth = (User) request.getSession().getAttribute("auth");
    if (auth == null) {
            response.sendRedirect("LoginUser.html");
            return;
        }
	request.setAttribute("dcf", dcf);
        DataSource ds = DataSourceSingleton.getInstance();
        Connection con = ds.getConnection();
	List<Order> orders = null;
        ProductDao pDao = new ProductDao(con);
        Product p = new Product();
	if (auth != null) {	    
	    OrderDao orderDao  = new OrderDao(con);
		orders = orderDao.userOrders(auth.getId());
                if (auth.getId()==1) {
                        orders = orderDao.getAllOrders();
                    }
	}else{
		response.sendRedirect("LoginUser.html");
                return;
	}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          <table id="myTable" class="table table-striped table-hover">
				<thead>
					<tr>

						<th>ID</th>
						<th>UserID</th>
						<th>Product</th>
						<th>Date</th>
						<th>Quantity</th>
						<th>Paymenth</th>
                                                
					</tr>
				</thead>
				<tbody>
                                    <% 
                                        if (!orders.isEmpty()) {
                                                for (Order o : orders) { 
                                                p = pDao.getSingleProduct(o.getProductID());
                                    %>
					<tr>

						<td><%=o.getOrderID()%></td>
						<td><%=o.getPersonID()%></td>
						<td><%=p.getProductName()%></td>
						<td><%=o.getOrderDate()%></td>
						<td><%=o.getQuantity()%></td>
						<td><%=o.getPaymenth()%></td>
					</tr>
                                        <%} }%>
				</tbody>
			</table>
                                      <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for id..">
                                       <input type="text" id="myInputDate" onkeyup="myFunctionDate()" placeholder="Search for date..">
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
        <script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}

function myFunctionDate() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInputDate");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
</script>
        
 </html>
