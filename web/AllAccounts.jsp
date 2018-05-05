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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Konta</title>
    </head>
    <body>
        <div style="width: 1200px; margin-left: auto; margin-right: auto;">
            <table cellpadding="10" class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Imię</th>
                    <th>Nazwisko</th>
                    <th>Telefon</th>
                    <th>Kod pocztowy</th>
                    <th>Miasto</th>
                    <th>Nr mieszkania</th>
                    <th>Ulica</th>
                    <th>Email</th>
                    <th>Hasło</th>
                    <th>Data rejestracji</th>
                    <th>Id uprawnienia</th>
                    <th>Akcja</th>
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
    </body>
</html>


