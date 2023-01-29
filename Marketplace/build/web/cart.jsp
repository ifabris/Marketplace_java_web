<%-- 
    Document   : cart
    Created on : 26.01.2022., 17:38:06
    Author     : Ivan
--%>


<%@page import="hr.algebra.model.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="hr.algebra.dal.sql.DataSourceSingleton"%>
<%@page import="hr.algebra.dal.sql.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="hr.algebra.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
User auth = (User) request.getSession().getAttribute("auth");
if (auth == null) {
    response.sendRedirect("LoginUser.html");
    return;
}
     DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
int total = 0;
        DataSource ds = DataSourceSingleton.getInstance();
     Connection con = ds.getConnection();
if (cart_list != null) {
	ProductDao pDao = new ProductDao(con);
	cartProduct = pDao.getCartProducts(cart_list);
        total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
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
        <div class="container mt-5 mb-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-8">
            <div class="p-2">
                <h4>Shopping cart</h4>
            </div>
            <%
                if (cart_list != null) {
                        for (Cart c : cartProduct) {%>
                <div class="d-flex flex-row justify-content-between align-items-center p-2 bg-white mt-4 px-3 rounded">
                <div class="mr-1"><img class="rounded" src="<%=c.getPicture() %>" width="70"></div>
                <div class="d-flex flex-column align-items-center product-details"><span class="font-weight-bold"><%= c.getProductName() %></span>
                    <div class="d-flex flex-row product-desc">
                        <div class="size mr-1"><span class="text-grey"><%=c.getProductDescription() %></span><span class="font-weight-bold"></span></div>
    <!--                    <div class="color"><span class="text-grey"><%=c.getCategoryID() %></span><span class="font-weight-bold"></span></div>!-->
                    </div>
                </div>             
                   <div class="form-group d-flex">
			<a class="btn bnt-sm btn-incre" style="background-color: #008CBA;" href="quantity-inc-dec?action=dec&id=<%=c.getProizvodID()%>"><i>-</i></a>
                        <input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
                        <a class="btn btn-sm btn-decre" style="background-color: #008CBA;" href="quantity-inc-dec?action=inc&id=<%=c.getProizvodID()%>"><i>+</i></a>
		</div>
                <div> 
                    <h5 class="text-grey"><%=c.getPrice() %>$</h5>
                </div>
                <div class="d-flex align-items-center">
                    <td><a href="remove-from-cart?id=<%=c.getProizvodID()%>" class="btn btn-sm btn-danger">Remove</a></td>
                    <i class="fa fa-trash mb-1 text-danger"></i>
                </div>
            </div>           
         
                         <%   }
                    }
            %>
            <div class="d-flex flex-row align-items-center mt-3 p-2 bg-white rounded"><a class="btn btn-primary btn-block btn-lg ml-2 pay-button" href="cart-check-out" type="button">Proceed to Pay</a></div>
                <div class="d-flex py-3"><h3>Total Price: $ <% out.print(total); %> </h3></div>
            </div>
           <div class="form-check">
               <input name = "Q2" class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked value="Cash">
  <label class="form-check-label" for="flexRadioDefault1">
    Cash
  </label>
</div>
<div class="form-check">
    <input name = "Q2" class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="Credit card"  >
  <label class="form-check-label" for="flexRadioDefault2">
    Credit card
  </label>
</div>
    </div>
</div>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </body>
    <style>
body {
    font-family: 'Manrope', sans-serif;
    background: #eee
}

.size span {
    font-size: 11px
}

.color span {
    font-size: 11px
}

.product-deta {
    margin-right: 70px
}

.gift-card:focus {
    box-shadow: none
}

.pay-button {
    color: #fff
}

.pay-button:hover {
    color: #fff
}

.pay-button:focus {
    color: #fff;
    box-shadow: none
}

.text-grey {
    color: #a39f9f
}

.qty i {
    font-size: 11px
}
    </style>

</html>
