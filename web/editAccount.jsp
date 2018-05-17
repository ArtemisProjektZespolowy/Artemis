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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://mdbootstrap.com/previews/docs/latest/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://mdbootstrap.com/previews/docs/latest/css/mdb.min.css" rel="stylesheet">
        <link href="./css/service.css" rel="stylesheet">
        <title>Edycja konta</title>
    </head>
    <body class="manager-background">
        <jsp:include page="header.jsp"/>
        <div style="width: 900px; margin-left: auto; margin-right: auto; margin-top: 100px;">
            <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif;">Edycja konta</h1>
            <hr class="featurette-divider" style="margin-left: -10px">
            <c:forEach items="${getAccountById}" var="p">
                <form action="edit_account" method="post">
                    <input type="hidden" name="id" value="${p.id}">
                    <label>Imię:</label>
                    <input type="text" class="form-control" value="${p.name}" name="name" pattern="[A-Z a-z-ąćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,40}" title="X, gdzie X jest to ciąg liter (dopuszczalne spacje i myślniki)" maxlength="40" style="width: 400px"><br>
                    <label>Nazwisko:</label>
                    <input type="text" class="form-control" value="${p.surname}" name="surname" pattern="[A-Z a-z-ąćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,40}" title="X, gdzie X jest to ciąg liter (dopuszczalne spacje i myślniki)" maxlength="40" style="width: 400px"><br>
                    <label>Telefon:</label>
                    <input type="number" class="form-control" value="${p.phone}" name="phone" pattern="[0-9]{9}" title="XXXXXXXXX, gdzie X jest cyfrą od 0 do 9 (bez spacji i myślników)" maxlength="9" style="width: 400px"><br>
                    <label>Kod pocztowy:</label>
                    <input type="text" class="form-control" value="${p.code}" name="code" pattern="[0-9]{2}-[0-9]{3}" title="XX-XXX, gdzie X jest cyfrą od 0 do 9 (bez spacji i myślników)" maxlength="6" style="width: 400px"><br>
                    <label>Miasto:</label>
                    <input type="text" class="form-control" value="${p.town}" name="town" pattern="[A-Z a-z-ąćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,50}" title="X, gdzie X jest to ciąg liter (dopuszczalne spacje i myślniki)" maxlength="50" style="width: 400px"><br>
                    <label>Nr mieszkania:</label>
                    <input type="text" class="form-control" value="${p.number}" name="number" pattern="[0-9A-Z/]{1,10}" title="X, gdzie X jest to ciąg cyfr (dopuszczalne litery, np. 1A)" maxlength="10" style="width: 400px"><br>
                    <label>Ulica:</label>
                    <input type="text" class="form-control" value="${p.street}" name="street" pattern="[A-Z a-z-ąćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,60}" title="X, gdzie X jest to ciąg liter (dopuszczalne spacje i myślniki)" maxlength="60" style="width: 400px"><br>
                    <label>Email:</label>
                    <input type="text" class="form-control" value="${p.email}" name="email" title="np. jankowalski@gmail.com" style="width: 400px"><br>
                    <label>Hasło:</label>
                    <input type="password" class="form-control" value="${p.password}" name="password" pattern="^(?=(.*\d){2})(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z\d]).{8,}$" title="Hasło powinno się składac z co najmniej jednej dużej litery, cyfry i znaku specjalnego o minimalnej długości 8 znaków" minlength="8" maxlength="30" style="width: 400px"><br>
                    <label>Data rejestracji:</label>
                    <input type="date" class="form-control" value="${p.registrationDate}" name="registrationDate" style="width: 400px"><br>
                    <label>Id uprawnienia:</label>
                    <input type="number" class="form-control" value="${p.permissionId}" name="permissionId" pattern="[1-3]{1}" title="X, gdzie X to cyfra od 1 do 3" maxlength="1" style="width: 400px"><br><br>
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