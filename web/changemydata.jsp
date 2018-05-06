
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
       
                                  <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif">Zmień dane</h1>
                                  <hr class="featurette-divider" style="margin-left: -10px">
                                  <title>Zmień dane</title>
                                  
                                  
                                  <div class="form-group">
                    <div class="btn-group btn-group-lg" style="width: 100%;">
                         

                        <a href="myaccount.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Moje konto</button></a>
                        <a href="changemydata.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Zmień dane</button></a>
                        <a href="changemypassword.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Zmień hasło</button></a>
                        <a href="myorders.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Moje zamówienia</button></a>
                        
                    </div>
                                      <hr class="featurette-divider" style="margin-left: -10px">
                                      <div style="width: 100%; text-align: center;">
                        <span style="color:red; font-size: 20px;  text-align: center;"><%=(request.getAttribute("updateDaneFail") == null) ? "" : request.getAttribute("updateDaneFail")%></span>

                        <span style=" color:green; font-size: 20px;  text-align: center; ">
                            
                            <%if (request.getAttribute("updateDaneSucces") == null) {
                                        } else {%>
                                        <%=request.getAttribute("updateDaneSucces")%><%}%></span>
                                      </div>

                                      
                                  </div>
                                  <form class="form_1" name="sentMessage" method="post" action="changedane" >
                                  <div class="form-group">
                                  <label for="email" style="font-size: 20px;">Adres e-mail:</label>
                                  <input type="text" class="form-control" value="<%=(request.getAttribute("email") == null) ? res.getString("email") : request.getAttribute("email")%>" name="email"  id="email" placeholder="Podaj Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="np. JanKowalski@gmail.com" required>
                                  <span style="color:red; font-size: 18px; text-align: center;"><%=(request.getAttribute("zajetyEmail") == null) ? "" : request.getAttribute("zajetyEmail")%></span>
                                  </div> 
                                  <div class="form-group">
                                  <label for="imie" style="font-size: 20px;">Imię:</label>
                                  <input type="text" class="form-control" value="<%=(request.getAttribute("imie") == null) ? res.getString("imie") : request.getAttribute("imie")%>" name="imie"  id="imie" placeholder="Podaj Imie" pattern="([a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,20}" title="Imie może się składać tylko z liter o długości 3-20" required>
                            
                                  </div>
                                  <div class="form-group">
                                  <label for="nazwisko" style="font-size: 20px;">Nazwisko:</label>
                                  <input type="text" class ="form-control" value="<%=(request.getAttribute("nazwisko") == null) ? res.getString("nazwisko") : request.getAttribute("nazwisko")%>" name="nazwisko"  id="surname" placeholder="Podaj Nazwisko" pattern="([a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwisko może się składać tylko z liter o długości 3-40" required>
                                  </div>
                                  <div class="form-group">
                                  <label for="telefon" style="font-size: 20px;">Numer telefonu:</label>
                                  <input type="tel" class ="form-control" value="<%=(request.getAttribute("telefon") == null) ? res.getString("telefon") : request.getAttribute("telefon")%>" name="telefon"  placeholder="Podaj Telefon" id="phone" pattern="[0-9]{9}" required>
                                  <span style="color:red; font-size: 18px; text-align: center;"><%=(request.getAttribute("zajetyTelefon") == null) ? "" : request.getAttribute("zajetyTelefon")%></span>
                                  </div>
                                  <div class="form-group">
                                  <label for="miasto" style="font-size: 20px;">Miejscowość:</label>
                                  <input type="text" class ="form-control" value="<%=(request.getAttribute("miasto") == null) ? res.getString("miasto") : request.getAttribute("miasto")%>" name="miasto"  id="miasto" placeholder="Podaj Miasto" pattern="([a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwa miasta może się składać tylko z liter o łącznej długości 3-40 znaków" required >
                                  </div>
                                  <div class="form-group">
                                  <label for="ulica" style="font-size: 20px;">Ulica</label>
                                  <input type="text" class ="form-control" value="<%=(request.getAttribute("ulica") == null) ? res.getString("ulica") : request.getAttribute("ulica")%>" name="ulica"  placeholder="Podaj Ulice" id="ulica" pattern="([a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwa ulicy może się składać tylko z liter o łącznej długości 3-40 znaków" required>
                                  </div>
                                  <div class="form-group">
                                  <label for="nr_dom" style="font-size: 20px;">Numer domu/mieszkania:</label>
                                  <input type="text" class ="form-control" value="<%=(request.getAttribute("nr_domu") == null) ? res.getString("nr_mieszkania") : request.getAttribute("nr_domu")%>" name="nr_domu"  placeholder="Podaj Nr Domu / Mieszkania" id="nr_domu" pattern="([0-9a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Numer mieszkania może się składać tylko z liter i cyfr o łącznej długości 3-40 znaków" required>                                  </div>
                                  <div class="form-group">
                                  <label for="kod_p" style="font-size: 20px;">Kod pocztowy:</label>
                                  <input type="text" class ="form-control" value="<%=(request.getAttribute("kod_pocztowy") == null) ? res.getString("kod_pocztowy") : request.getAttribute("kod_pocztowy")%>" name="kod_pocztowy"  id="kod_pocztowy" placeholder="Kod pocztowy" pattern="^[0-9]{2}-[0-9]{3}$" title="Podaj kod w nastepującym formacie ( 00-000 )" required>
                                  </div>
                                  
                                  <div class="form-group">
                                  <label for="haslo" style="font-size: 20px;">Podaj hasło w celu autoryzacji:</label>
                                  <input type="password" class="form-control"  id="haslo" name="haslo" required>
                                  </div>
                                  <button class="btn btn-large btn-default" type="submit" value="Changedane" >Zmień dane</button>

                        </form>

                            
                                  
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
