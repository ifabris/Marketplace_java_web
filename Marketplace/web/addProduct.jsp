<%-- 
    Document   : addProduct
    Created on : 29.01.2022., 16:38:36
    Author     : Ivan
--%>

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
        <header class="masthead">
        <div class="container h-100">
    <div class="row h-100 align-items-center">
      <div class="row">
          <form action="AddProduct" method="post">              
             <div class="" style="width: 18rem;">                
  <div class="card-body">
       <div class="form-field">
    <label for="poc-fname">Product Name:</label>
    <input type="text" id="poc-fname" name="pName"/>
  </div>
       <div class="form-field">
    <label for="poc-fname">Product Descripiton</label>
    <input type="text" id="poc-fDesc" name="pDesc"/>
  </div>
       <div class="form-field">
    <label for="poc-fname">Product Price</label>
    <input type="text" id="poc-fPrice" name="pPrice""/>
  </div>
       <div class="form-field">
    <label for="poc-fname">Product Amount</label>
    <input type="text" id="poc-fAmount" name="pAmount"/>
  </div>
       <div class="form-field">
    <label for="poc-fname">Product CategoryID</label>
    <input type="text" id="poc-fCatID" name="pCategory"/>
  </div>
       <div class="form-field">
    <label for="poc-fname">Product PictureURL</label>
    <input type="text" id="poc-fPicture" name="pUrl"/>
</div>
<input type="submit" class="fadeIn fourth" value="Add">
</form>
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
