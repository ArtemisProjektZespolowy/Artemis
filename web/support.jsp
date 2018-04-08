

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

        
 
                        <div class="container" style="background-color: rgba(255,255,255, 0.2); width: 45%; ">
                            
                            
                            <h4>Formularz kontaktowy</h4>
                            
                            <form action="wysWiadDoSupp" method="post">
                                  <div class="md-form">
                                      
                               <select id="myText" name="rodzaj_problemu"  class="browser-default md-textarea form-control"required>
                                     
                                <option value="" disabled hidden selected class="md-form">Wybierz rodzaj problemu</option>
                                <option value="Problemy z kontem"  class="browser-default" >Problemy z kontem</option>
                                <option value="Płatnosci"  class="">Płatnosci</option>
                                <option value="Nie działa klucz gr"  class="">Nie działa klucz gry</option>
                                <option value="Inne"  class="">Inne</option>
                                
                                </select>
                                       
                           </div>
                               <div class="md-form form-lg">
                                   <input name="tytul" type="text" id="inputLGEx" class="form-control form-control-lg "  required   >
                                    <label for="inputLGEx">Tytuł wiadomości</label>
                                </div>
                                <p></p>
                           <div class="md-form" >
                               <textarea class="form-control" id="exampleFormControlTextarea4" rows="4"></textarea>
                            <label for="form7">Treść wiadomości</label>
                        </div>
              
                                <button name="support" value="wiadomoscSupport" class="btn btn-outline-primary waves-effect">Wyślij</button>
                            </form>


             
                
                    </form>
                </div>
         
    </body>

</html>