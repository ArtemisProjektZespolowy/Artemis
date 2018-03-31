<%-- 
    Document   : index
    Created on : 2018-01-13, 13:10:27
    Author     : Iluvris
--%>

<%@page import="src.PolaczenieDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pl">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Artemis</title>

    
         <style>
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 100%;
  }
  </style>


    <body>

    <jsp:include page="header.jsp"/>


  <div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://i.imgur.com/3XYxFR7.png" alt="Los Angeles" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="https://i.imgur.com/3XYxFR7.png" alt="Chicago" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="https://i.imgur.com/3XYxFR7.png" alt="New York" width="1100" height="500">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="fa fa-angle-left"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="fa fa-angle-right"></span>
  </a>
</div>

</body>
    </body>

</html>

 <!-- /.test -->