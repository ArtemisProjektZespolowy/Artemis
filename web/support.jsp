

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

        <title>Wsparcie</title>

        <!-- Bootstrap core CSS -->


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">




        <!-- Custom styles for this template -->
        <link href="./css/support.css" rel="stylesheet">
    </head>

    <body>

        <jsp:include page="header.jsp"/>
        <script>

// Material Select Initialization
            $(document).ready(function () {
                $('.mdb-select').material_select();
            });

        </script>
        <div class="body_1">
            <div class="wrapper">
             
                   

                        <div class="container" style="background-color: rgba(255,255,255, 0.9); color: white; ">
                             <form action="support" method="post">
                                <select name="rodzaj_problemu"  class="mdb-select">
                                <option value="" disabled selected >Wybierz rodzaj problemu</option>
                                <option value="Problemy z kontem" ddata-icon="" >Problemy z kontem</option>
                                <option value="Płatnosci" data-fa-icon="" class="rounded-circle">Płatnosci</option>
                                <option value="Problemy z kodem" data-icon="" class="rounded-circle">Problemy z kodem</option>
                                <option value="Inne" data-icon="" class="rounded-circle">Inne</option>
                            </select>
                           
                               <div class="md-form form-lg">
                                   <input name="tytul" type="text" id="inputLGEx" class="form-control form-control-lg">
                                    <label for="inputLGEx">Podaj tytuł wiadomości</label>
                                </div>
                                <p></p>
                           <div class="md-form">
                               <textarea name="trescWiadomosci" type="text" id="form7" class="md-textarea form-control" rows="3"></textarea>
                            <label for="form7">Treść wiadomości</label>
                        </div>
              
                                <button name="support" value="wiadomoscSupport" class="btn btn-outline-primary waves-effect">Wyślij</button>
                            </form>


             
                
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>