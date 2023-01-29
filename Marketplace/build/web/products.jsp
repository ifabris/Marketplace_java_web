<%-- 
    Document   : products
    Created on : 23.01.2022., 18:54:12
    Author     : Ivan
--%>

<%@page import="hr.algebra.model.User"%>
<%@page import="hr.algebra.model.Cart"%>
<%@page import="hr.algebra.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.AbstractList"%>
<%@page import="hr.algebra.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="hr.algebra.dal.sql.DataSourceSingleton"%>
<%@page import="servlets.LoginServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>

         <%
try {
        String msg=request.getAttribute("errormsg").toString();
        if(!msg.equals(""))
{
         %>  <h5 style="color: red">Item already in the cart, if you wish to change quantity, do so in cart.</h5>  <%
}
    } catch (Exception e) {
    }
      List<Category> categories = new ArrayList<>();
        DataSource ds = DataSourceSingleton.getInstance();
     Connection con = ds.getConnection();
     Statement statement = con.createStatement();
     String queryCat = "Select * from Category";
     ResultSet rs = statement.executeQuery(queryCat);
     while (rs.next()) {             
             categories.add(new Category(rs.getInt("CategoryID"),rs.getString("CategoryName")));
         }
%><%
    DataSource ds2 = DataSourceSingleton.getInstance();
     Connection con2 = ds2.getConnection();
     Statement statement2 = con2.createStatement();
     List<Product> products = new ArrayList<>();     
     String query = "Select * from Proizvod";
     ResultSet rs2 = statement2.executeQuery(query);    
     while (rs2.next()) {
         products.add(new Product(rs2.getInt("ProizvodID"),rs2.getString("ProductName"),rs2.getInt("Price"),rs2.getString("ProductDescription"),rs2.getInt("CategoryID"),rs2.getString("Picture"),rs2.getInt("Amount")));
}%>

        <title>JWP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
  <div class="container">
    <a class="navbar-brand" href="Home.html">JWP</a>
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

    <select id="catSel" name="categorySelect" style="width:200px;" onchange="CategoryChange()">
        <option>All</option>
      <%
          for (Category cat : categories) {%>
          <option value="<% out.print(cat.getCategoryName()); %>"><% out.print(cat.getCategoryName()); %></option> 
              <% } %>   



</select>

 <div class="container h-100">
    <div class="row h-100 align-items-center">
      <div class="row">
          <%
             for (Product product : products) {%>
                
             <div class="card" style="width: 18rem;">
                 <img class="card-img-top" src="<% out.print(product.getPicture()); %>" alt="No picture">
  <div class="card-body">
      <h5 class="card-title"><% out.print(product.getProductName());%></h5>
    <p class="card-text"><% out.print(product.getProductDescription()); %></p>
    <p class="card-text">Amount: <% out.print(product.getAmount()); %></p>
    <p class="card-text">Category: <% 
        for (Category elem : categories) {
                if (product.getCategoryID()==elem.getCategoryID()) {
                        out.print(elem.getCategoryName());
                    }
            }       
        %></p>
  </div>
    <div class="card-footer" style="padding-left: 27%">
      <a href="AddToCart?id=<%= product.getProizvodID() %>" class="btn btn-primary mt-auto" id="btnAdd">Add to cart</a>
    </div>
</div>
             
    <%}%>

      </div>
    </div>
  </div>
</header>
    </body>
    <style>
        .masthead {
  height: 100%;
  min-height: 500px;
  background-image: url('https://source.unsplash.com/BtbjCFUvBXs/1920x1080');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script>
      function CategoryChange(){
           //var x = document.getElementById("catSel").value;
           //alert(x);
     }
    </script>
</html>
