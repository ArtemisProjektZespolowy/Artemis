

<%@page import="src.PolaczenieDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pl">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>logout</title>

        <!-- Bootstrap core CSS -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">


        <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">



        <!-- Custom styles for this template -->
        <link href="./css/register_sing_in.css" rel="stylesheet">
    </head>

    <body>
     <div class="body_1">
            <div class="wrapper">
                <div class="container_1">
                    <span class="glyphicon glyphicon-log-out" style="font-size: 250px; align-content: center; color: white; text-align:center; opacity: 0.7;"></span>
                    <br></br>
                    <p style="font-size: 28px; color:white;">Wylogowanie przebiegło pomyślnie</p>
                    <form name="" method="post" action="sign_in.jsp" id="contactForm" novalidate>
                        <br>
                        <button type="submit" value="" class="button_1">Zaloguj się</button>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>