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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Edytuj produkt</title>
    </head>
    <body>
        <h1>Edytuj produkt</h1>
        <div style="width: 900px; margin-left: auto; margin-right: auto">
            <c:forEach items="${getProductById}" var="p">
                <form action="edit_product" method="post">
                    <input type="hidden" name="id" value="${p.id}">
                    Nazwa:<br>
                    <input type="text" value="${p.name}" name="name" style="width: 200px"><br>
                    Data wydania:<br>
                    <input type="date" value="${p.releaseDate}" name="releaseDate" style="width: 200px"><br>
                    Kategoria:<br>
                    <input type="text" value="${p.category}" name="category" style="width: 200px"><br>
                    Platforma<br>
                    <input type="text" value="${p.platform}" name="platform" style="width: 200px"><br>
                    Cena:<br>
                    <input type="number" value="${p.price}" name="price" style="width: 200px"><br>
                    Wydawca:<br>
                    <input type="text" value="${p.publisher}" name="publisher" style="width: 200px"><br>
                    Opis:<br>
                    <textarea name="description" style="width: 400px; height: 200px">${p.description}</textarea><br>
                    Obraz:<br>
                    <input type="text" value="${p.image}" name="image" style="width: 200px"><br><br>
                    <input class="btn btn-success" type="submit" value="Zapisz zmiany">
                </form>
            </c:forEach>

        </div>
    </body>
</html>

