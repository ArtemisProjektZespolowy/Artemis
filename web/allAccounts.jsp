<%-- 
    Document   : AllAccounts
    Created on : 2018-05-04, 16:50:19
    Author     : Bartek
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="src.PolaczenieDB"%>
<%@page import="src.DBUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
        <title>Menedżer kont</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div style="width: 1450px; margin-left: auto; margin-right: auto; margin-top: 100px;">
            <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif">Menedżer kont</h1>
            <hr class="featurette-divider" style="margin-left: -10px">
            <p><a class="btn btn-success" href="add_account" role="button">Utwórz konto...</a></p>
            <table cellpadding="10" class="table table-striped">
                <tr>
                    <th><b>Id</b></th>
                    <th><b>Imię</b></th>
                    <th><b>Nazwisko</b></th>
                    <th><b>Telefon</b></th>
                    <th><b>Kod pocztowy</b></th>
                    <th><b>Miasto</b></th>
                    <th><b>Nr mieszkania</b></th>
                    <th><b>Ulica</b></th>
                    <th><b>Email</b></th>
                    <th><b>Hasło</b></th>
                    <th><b>Data rejestracji</b></th>
                    <th><b>Id uprawnienia</b></th>
                    <th><b>Akcja</b></th>
                </tr>
                <c:forEach items="${AllAccounts}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.surname}</td>
                        <td>${p.phone}</td>
                        <td>${p.code}</td>
                        <td>${p.town}</td>
                        <td>${p.number}</td>
                        <td>${p.street}</td>
                        <td>${p.email}</td>
                        <td>${p.password}</td>
                        <td>${p.registrationDate}</td>
                        <td>${p.permissionId}</td>
                        <td>
                            <p><a class="btn btn-warning" href="edit_account?id=${p.id}" role="button">Edytuj</a></p>
                            <p><a class="btn btn-danger" href="delete_account?id=${p.id}" role="button">Usuń</a></p>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <footer class="footer">
            <div class="container">
                <span class="text-muted">Copyright &copy; 2018 Artemis.</span>
                <p class="pull-right" style="text-align: center; margin-top: 10px; font-size: 40px;"><a href="#"><span  class="pull-right fa fa-toggle-up text-muted" aria-hidden="true"></span></a></p>
            </div>
        </footer>
    </body>
</html>


