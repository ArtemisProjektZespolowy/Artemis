

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

        <title>EmptyCard</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

        <!-- Custom styles for this template -->
        <link href="./css/register_sing_in.css" rel="stylesheet">
    </head>
    <!-- NAVBAR
    ================================================== -->

    <body>


        <jsp:include page="header.jsp"/>


    <div class="body_1">
            <div class="wrapper">
                <div class="container_1">


                    <span class="fa fa-server" style="font-size: 250px; align-content: center; color: white; text-align:center; "></span>
                    <br>
                    <p style="font-size: 28px; color: white; ">Serwer jest chwilowo niedostępny, spróbuj ponownie później :( </p>
                    <form name="" method="post" action="index.jsp" id="contactForm" novalidate>
                        <br>
                        <button  class="btn btn-deep-orange"  >Strona Główna</button>
                    </form>
                </div>
            </div>
        </div>


    </body>

</html>