<%-- 
    Document   : EditProduct
    Created on : 2018-04-12, 17:19:19
    Author     : Bartek
--%>
<%@page import="src.PolaczenieDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://mdbootstrap.com/previews/docs/latest/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://mdbootstrap.com/previews/docs/latest/css/mdb.min.css" rel="stylesheet">
        <link href="./css/service.css" rel="stylesheet">
        <title>Edycja produktu</title>
    </head>
    <body class="manager-background">
        <jsp:include page="header.jsp"/>
        <div style="width: 900px; margin-left: auto; margin-right: auto; margin-top: 100px;">
            <c:forEach items="${getProductById}" var="p">
                <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif;">Edycja produktu</h1>
                <hr class="featurette-divider" style="margin-left: -10px">
                <form action="edit_product" method="post">
                    <input type="hidden" name="id" value="${p.id}">
                    <label>Nazwa:</label>
                    <input type="text" class="form-control" value="${p.name}" name="name" maxlength="100" style="width: 400px"><br>
                    <label>Data wydania:</label>
                    <input type="date" class="form-control" value="${p.releaseDate}" name="releaseDate" style="width: 400px"><br>
                    <label>Kategoria:</label>
                    <input type="text" class="form-control" value="${p.category}" name="category" maxlength="100" style="width: 400px"><br>
                    <label>Platforma</label>
                    <input type="text" class="form-control" value="${p.platform}" name="platform" maxlength="50" style="width: 400px"><br>
                    <label>Cena:</label>
                    <input type="number" step="0.01" class="form-control" value="${p.price}" name="price"  style="width: 400px"><br>
                    <label>Wydawca:</label>
                    <input type="text" class="form-control" value="${p.publisher}" name="publisher" maxlength="50" style="width: 400px"><br>
                    <label>Opis:</label>
                    <textarea class="form-control" name="description" style="width: 400px; height: 300px">${p.description}</textarea><br>
                    <label>Obraz:</label>
                    <input type="text" class="form-control" value="${p.image}" name="image" style="width: 400px"><br><br>
                    <input class="btn btn-success" type="submit" value="Zapisz zmiany">
                </form>
            </c:forEach>
        </div>
        <footer class="footer">
            <div class="container">
                <span class="text-muted">Copyright &copy; 2018 Artemis.</span>
                <p class="pull-right" style="text-align: center; margin-top: 10px; font-size: 40px;"><a href="#"><span  class="pull-right fa fa-toggle-up text-muted" aria-hidden="true"></span></a></p>
            </div>
        </footer>
    </body>
</html>

