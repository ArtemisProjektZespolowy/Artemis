<%-- 
    Document   : userpanel
    Created on : 2018-04-22, 15:38:47
    Author     : Patryk
--%>


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
       
                                  <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif">Moje konto</h1>
                                  <hr class="featurette-divider" style="margin-left: -10px">
                                  <title>Moje konto</title>
                                  
                                  
                                  <div class="form-group">
                    <div class="btn-group btn-group-lg" style="width: 100%;">
                         

                        <a href="myaccount.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Moje konto</button></a>
                        <a href="changemydata.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Zmień dane</button></a>
                        <a href="changemypassword.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Zmień hasło</button></a>
                        <a href="myorders.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Moje zamówienia</button></a>
                        
                    </div>
                                  </div>
                                  <hr class="featurette-divider" style="margin-left: -10px">
                                  <h3>Adres e-mail:</h3><p><%out.println(res.getString("email"));%></p>
                                  <h3>Imię:</h3><p> <%out.println(res.getString("imie"));%></p>
                                  <h3>Nazwisko:</h3><p> <%out.println(res.getString("nazwisko"));%></p>
                                  <h3>Numer telefonu:</h3><p> <%out.println(res.getString("telefon"));%></p>
                                  <h3>Miejscowość:</h3><p> <%out.println(res.getString("miasto"));%></p>
                                  <h3>Ulica:</h3><p> <%out.println(res.getString("ulica"));%></p>
                                  <h3>Numer domu/mieszkania:</h3><p> <%out.println(res.getString("nr_mieszkania"));%></p>
                                  <h3>Kod pocztowy:</h3><p> <%out.println(res.getString("kod_pocztowy"));%></p>
    </div>
                                  


            <footer class="footer">
            <div class="container">
                <span class="text-muted">Copyright &copy; 2018 Artemis.</span>
                <p class="pull-right" style="text-align: center; margin-top: 10px; font-size: 40px;"><a href="#"><span  class="pull-right fa fa-toggle-up text-muted" aria-hidden="true"></span></a></p>
                
            </div>
        </footer>
    </body>
        <%}else{
        response.sendRedirect("index.jsp");
}%>
</html>
