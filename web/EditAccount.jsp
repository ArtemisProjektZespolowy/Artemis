<%-- 
    Document   : EditAccount
    Created on : 2018-05-04, 18:21:19
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
        <title>Edycja konta</title>
    </head>
    <body>
        <h1>Edycja konta</h1>
        <div style="width: 900px; margin-left: auto; margin-right: auto">
            <c:forEach items="${getAccountById}" var="p">
                <form action="edit_account" method="post">
                    <input type="hidden" name="id" value="${p.id}">
                    Imię:<br>
                    <input type="text" value="${p.name}" name="name" style="width: 200px"><br>
                    Nazwisko:<br>
                    <input type="text" value="${p.surname}" name="surname" style="width: 200px"><br>
                    Telefon:<br>
                    <input type="number" value="${p.phone}" name="phone" style="width: 200px"><br>
                    Kod pocztowy:<br>
                    <input type="text" value="${p.code}" name="code" style="width: 200px"><br>
                    Miasto:<br>
                    <input type="text" value="${p.town}" name="town" style="width: 200px"><br>
                    Nr mieszkania:<br>
                    <input type="number" value="${p.number}" name="number" style="width: 200px"><br>
                    Ulica:<br>
                    <input type="text" value="${p.street}" name="street" style="width: 200px"><br>
                    Email:<br>
                    <input type="text" value="${p.email}" name="email" style="width: 200px"><br>
                    Hasło:<br>
                    <input type="password" value="${p.password}" name="password" style="width: 200px"><br>
                    Data rejestracji:<br>
                    <input type="date" value="${p.registrationDate}" name="registrationDate" style="width: 200px"><br>
                    Id uprawnienia:<br>
                    <input type="number" value="${p.permissionId}" name="permissionId" style="width: 200px"><br><br>
                    <input class="btn btn-success" type="submit" value="Zapisz zmiany">
                </form>
            </c:forEach>

        </div>
    </body>
</html>