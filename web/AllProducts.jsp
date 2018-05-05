<%-- 
    Document   : AllProducts
    Created on : 2018-04-12, 17:19:02
    Author     : Bartek
--%>
<%@page import="src.PolaczenieDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Produkty</title>
    </head>
    <body>
        <div style="width: 1200px; margin-left: auto; margin-right: auto;">
            <table cellpadding="10" class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Nazwa</th>
                    <th>Data wydania</th>
                    <th>Kategoria</th>
                    <th>Platforma</th>
                    <th>Cena</th>
                    <th>Wydawca</th>
                    <th>Opis</th>
                    <th>Obraz</th>
                    <th>Akcja</th>
                </tr>
                <c:forEach items="${AllProducts}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.releaseDate}</td>
                        <td>${p.category}</td>
                        <td>${p.platform}</td>
                        <td>${p.price}</td>
                        <td>${p.publisher}</td>
                        <td>${p.description}</td>
                        <td>${p.image}</td>
                        <td>
                            <p><a class="btn btn-warning" href="edit_product?id=${p.id}" role="button">Edytuj</a></p>
                            <p><a class="btn btn-danger" href="delete_product?id=${p.id}" role="button">Usuń</a></p>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

