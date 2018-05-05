<%-- 
    Document   : AddProduct
    Created on : 2018-04-12, 17:18:36
    Author     : Bartek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dodawanie produktu</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Dodawanie produktu</h1>
        <div style="width: 900px; margin-left: auto; margin-right: auto">
            <form action="add_product" method="post">
                Nazwa:<br>
                <input type="text" name="name" style="width: 200px"><br>
                Data wydania:<br>
                <input type="date" name="releaseDate" style="width: 200px"><br>
                Kategoria:<br>
                <input type="text" name="category" style="width: 200px"><br>
                Platforma:<br>
                <input type="text" name="platform" style="width: 200px"><br>
                Cena:<br>
                <input type="number" name="price" style="width: 200px"><br>
                Wydawca:<br>
                <input type="text" name="publisher" style="width: 200px"><br>
                Opis:<br>
                <textarea name="decription" style="width: 400px; height: 200px"></textarea><br>
                Obraz:<br>
                <input type="text" name="image" style="width: 200px"><br><br>
                <input class="btn btn-success" type="submit" value="Dodaj produkt">
            </form>
            <!--Complete Interface Addnew.-->
        </div>

    </body>
</html>
