<%-- 
    Document   : AddProduct
    Created on : 2018-04-12, 17:18:36
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
        <title>Dodawanie produktu</title>
    </head>
    <body class="manager-background">
        <jsp:include page="header.jsp"/>
        <div style="width: 900px;  margin-left: auto; margin-right: auto; margin-top: 100px;">
            <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif;">Dodawanie produktu</h1>
            <hr class="featurette-divider" style="margin-left: -10px">
            <form action="add_product" method="post">
                <label>Nazwa:</label>
                <input type="text" class="form-control" name="name" maxlength="100" style="width: 400px" required><br>
                <label>Data wydania:</label>
                <input type="date" class="form-control" name="releaseDate" style="width: 400px" required><br>
                <label>Kategoria:</label>
                <input type="text" class="form-control" name="category" maxlength="100" style="width: 400px" required><br>
                <label>Platforma:</label>
                <input type="text" class="form-control" name="platform" maxlength="50" style="width: 400px" required><br>
                <label>Cena:</label>
                <input type="number" step="0.01" class="form-control" name="price" style="width: 400px" required><br>
                <label>Wydawca:</label>
                <input type="text" class="form-control" name="publisher" maxlength="50" style="width: 400px" required><br>
                <label>Opis:</label>
                <textarea name="decription" class="form-control" style="width: 400px; height: 300px" required></textarea><br>
                <label>Obraz:</label>
                <input type="text" class="form-control" name="image" style="width: 400px" required><br><br>
                <input class="btn btn-success" type="submit" value="Dodaj produkt">
            </form>
            <!--Complete Interface Addnew.-->
        </div>
        <footer class="footer">
            <div class="container">
                <span class="text-muted">Copyright &copy; 2018 Artemis.</span>
                <p class="pull-right" style="text-align: center; margin-top: 10px; font-size: 40px;"><a href="#"><span  class="pull-right fa fa-toggle-up text-muted" aria-hidden="true"></span></a></p>
            </div>
        </footer>
    </body>
</html>
