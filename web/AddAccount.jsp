<%-- 
    Document   : AddAccount
    Created on : 2018-05-04, 16:31:24
    Author     : Bartek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tworzenie konta</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Tworzenie konta</h1>
        <div style="width: 900px; margin-left: auto; margin-right: auto">
            <form action="add_account" method="post">
                Imię:<br>
                <input type="text" name="name" style="width: 200px"><br>
                Nazwisko:<br>
                <input type="text" name="surname" style="width: 200px"><br>
                Telefon:<br>
                <input type="number" name="phone" style="width: 200px"><br>
                Kod pocztowy:<br>
                <input type="text" name="code" style="width: 200px"><br>
                Miasto:<br>
                <input type="text" name="town" style="width: 200px"><br>
                Nr mieszkania:<br>
                <input type="number" name="number" style="width: 200px"><br>
                Ulica:<br>
                <input type="text" name="street" style="width: 200px"><br>
                Email:<br>
                <input type="text" name="email" style="width: 200px"><br>
                Hasło:<br>
                <input type="password" name="password" style="width: 200px"><br>
                Data rejestracji:<br>
                <input type="date" name="registrationDate" style="width: 200px"><br>
                Id uprawnienia:<br>
                <input type="number" name="permissionId" style="width: 200px"><br><br>
                <input class="btn btn-success" type="submit" value="Utwórz konto">
            </form>
            <!--Complete Interface Addnew.-->
        </div>

    </body>
</html>
