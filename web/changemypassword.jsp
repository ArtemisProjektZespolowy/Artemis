
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="src.PolaczenieDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pl">

    <head>
                <%if(session.getAttribute("User")!=null){%>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>   
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Bootstrap core CSS -->
        <link href="https://mdbootstrap.com/previews/docs/latest/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://mdbootstrap.com/previews/docs/latest/css/mdb.min.css" rel="stylesheet">

        <link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.2/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.2/owl.theme.min.css">

        <!-- Custom styles for this template -->
        <link href="./css/service.css" rel="stylesheet">



    <body>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/holder/2.4.0/holder.js"></script>
        <jsp:include page="header.jsp"/>

    <div class="container" id="xd" style>
       <%                         ResultSet res = null;                                 
                                  Connection conn = null;
                                  Statement stat = null;
                                  conn = PolaczenieDB.getConnection();
                                  stat = conn.createStatement();
                                  String data = ("select * from konto where email = '" + session.getAttribute("User")+"';");
                                  res = stat.executeQuery(data);                                  
                                  res.next();%>
       
                                  <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif">Zmień hasło</h1>
                                  <hr class="featurette-divider" style="margin-left: -10px">
                                  <title>Zmień hasło</title>
                                  
                                  
                                  <div class="form-group">
                    <div class="btn-group btn-group-lg" style="width: 100%;">
                         

                        <a href="myaccount.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Moje konto</button></a>
                        <a href="changemydata.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Zmień dane</button></a>
                        <a href="changemypassword.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Zmień hasło</button></a>
                        <a href="myorders.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Moje zamówienia</button></a>
                        
                    </div>
                                  </div>
                                  <hr class="featurette-divider" style="margin-left: -10px">
                                  <div style="width: 100%; text-align: center;">
                        <span style="color:green; font-size: 20px;  text-align: center;"><%=(request.getAttribute("updatePassS") == null) ? "" : request.getAttribute("updatePassS")%></span>
                         <span style="color:red; font-size: 20px;  text-align: center;"><%=(request.getAttribute("updatePassF") == null) ? "" : request.getAttribute("updatePassF")%></span>
                                  </div>
                                  

<div class="form-group">
                <form class="form_1" name="sentMessage" method="post" action="changepass" >
                                  <div class="form-group">
                                  <label for="oldpass" style="font-size: 20px;">Podaj obecne hasło: </label>
                                  <input type="password"  class="form-control"  name="current_haslo" required>
                                  </div>
                                 <div class="form-group">
                                <label for="haslo" style="font-size: 20px;">Podaj nowe hasło:</label>
                                <input type="password" class="form-control" name="haslo"  id="haslo" pattern="^(?=(.*\d){2})(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z\d]).{8,}$" title="Haslo powinno się składac z co najmniej jednej dużej litery, cyfry i znaku specjalnego o minimalnej długości 8 znaków" required>
                                </div>
                                <div class="form-group">
                                <label for="potwierdz_haslo" style="font-size: 20px;">Powtórz nowe hasło:</label>   
                                <input type="password" class="form-control" name="potwierdz_haslo" id="potwierdz_haslo" pattern="^(?=(.*\d){2})(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z\d]).{8,}$" title="Haslo powinno się składac z co najmniej jednej dużej litery, cyfry i znaku specjalnego o minimalnej długości 8 znaków" required>
                                </div>
                                <script language='javascript' type='text/javascript'>
                                    var haslo = document.getElementById("haslo")
                                            , potwierdz_haslo = document.getElementById("potwierdz_haslo");

                                    function validatePassword() {
                                        if (haslo.value != potwierdz_haslo.value) {
                                            potwierdz_haslo.setCustomValidity("Podane hasła są różne!");
                                        } else {
                                            potwierdz_haslo.setCustomValidity('');
                                        }
                                    }

                                    haslo.onchange = validatePassword;
                                    potwierdz_haslo.onkeyup = validatePassword;
                                </script>

                            
                         
                                  </div>
                                  
                                  <button class="btn btn-large btn-default" value="Changepass">Zmień hasło</button>
                                  </form>
                                  </div>
       
                                  
                                  
    </div>
                                  


            <footer class="footer">
            <div class="container">
                <span class="text-muted">Copyright &copy; 2018 Artemis.</span>
                <p class="pull-right" style="text-align: center; margin-top: 10px; font-size: 40px;"><a href="#"><span  class="pull-right fa fa-toggle-up text-muted" aria-hidden="true"></span></a></p>
                
            </div>
        </footer>
                           
            <script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    </body>
    <%}else{
        response.sendRedirect("index.jsp");
}%>
</html>
