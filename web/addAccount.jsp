<%-- 
    Document   : AddAccount
    Created on : 2018-05-04, 16:31:24
    Author     : Bartek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Tworzenie konta</title>
    </head>
    <body class="manager-background">
         <jsp:include page="header.jsp"/>
        <div style="width: 900px;  margin-left: auto; margin-right: auto; margin-top: 100px;">
            <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif;">Tworzenie konta</h1>
            <hr class="featurette-divider" style="margin-left: -10px">
            <form action="add_account" method="post">
                <label>Imię:</label>
                <input type="text" class="form-control" name="name" pattern="[A-Z a-z-ąćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,40}" title="X, gdzie X jest to ciąg liter (dopuszczalne spacje i myślniki)" maxlength="40" style="width: 400px" required><br>
                <label>Nazwisko:</label>
                <input type="text" class="form-control" name="surname" pattern="[A-Z a-z-ąćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,40}" title="X, gdzie X jest to ciąg liter (dopuszczalne spacje i myślniki)" maxlength="40" style="width: 400px" required><br>
                <label>Telefon:</label>
                <input type="tel" class="form-control" name="phone" pattern="[0-9]{9}" title="XXXXXXXXX, gdzie X jest cyfrą od 0 do 9 (bez spacji i myślników)" maxlength="9" style="width: 400px" required><br>
                <label>Kod pocztowy:</label>
                <input type="text" class="form-control" name="code" pattern="[0-9]{2}-[0-9]{3}" title="XX-XXX, gdzie X jest cyfrą od 0 do 9 (bez spacji i myślników)" maxlength="6" style="width: 400px" required><br>
                <label>Miasto:</label>
                <input type="text" class="form-control" name="town" pattern="[A-Z a-z-ąćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,50}" title="X, gdzie X jest to ciąg liter (dopuszczalne spacje i myślniki)" maxlength="50" style="width: 400px" required><br>
                <label>Nr mieszkania:</label>
                <input type="text" class="form-control" name="number" pattern="[0-9A-Z/]{1,10}" title="X, gdzie X jest to ciąg cyfr (dopuszczalne litery, np. 1A)" maxlength="10" style="width: 400px" required><br>
                <label>Ulica:</label>
                <input type="text" class="form-control" name="street" pattern="[A-Z a-z-ąćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,60}" title="X, gdzie X jest to ciąg liter (dopuszczalne spacje i myślniki)" maxlength="60" style="width: 400px" required><br>
                <label>Email:</label>
                <input type="email" class="form-control" name="email" title="np. jankowalski@gmail.com" style="width: 400px" required><br>
                <label>Hasło:</label>
                <input type="password" class="form-control" name="password" pattern="^(?=(.*\d){2})(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z\d]).{8,}$" title="Hasło powinno się składac z co najmniej jednej dużej litery, cyfry i znaku specjalnego o minimalnej długości 8 znaków" minlength="8" maxlength="30" style="width: 400px" required><br>
                <label>Data rejestracji:</label>
                <input type="date" class="form-control" name="registrationDate" style="width: 400px" required><br>
                <label>Id uprawnienia:</label>
                <input type="number" class="form-control" name="permissionId" pattern="[1-3]{1}" title="X, gdzie X to cyfra od 1 do 3" maxlength="1" style="width: 400px" required><br><br>
                <input class="btn btn-success" type="submit" value="Utwórz konto">
            </form>
        </div>
        <footer class="footer">
            <div class="container">
                <span class="text-muted">Copyright &copy; 2018 Artemis.</span>
                <p class="pull-right" style="text-align: center; margin-top: 10px; font-size: 40px;"><a href="#"><span  class="pull-right fa fa-toggle-up text-muted" aria-hidden="true"></span></a></p>
            </div>
        </footer>
    </body>
</html>
