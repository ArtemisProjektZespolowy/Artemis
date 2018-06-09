

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

        <title>logoutSuccess</title>

        <!-- Bootstrap core CSS -->
        

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
       



        <!-- Custom styles for this template -->
        <link href="./css/register_sing_in.css" rel="stylesheet">
    </head>

    <body>
        
        <jsp:include page="header.jsp"/>
        
     <div class="body_1">
            <div class="wrapper">
                <div class="container_1">
                    <span class="fa fa-sign-out" style="font-size: 250px; padding-left: 40px;  color: white; text-align:center; opacity: 0.7;"></span>
                    <br>
                    <p style="font-size: 28px; color:white;">Wylogowanie przebiegło pomyślnie</p>
                    <form name="" method="post" action="sign_in.jsp" id="contactForm" novalidate>
                        
                        <button type="submit" value="" class="button_1">Zaloguj się</button>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>