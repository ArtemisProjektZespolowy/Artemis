<%-- 
    Document   : index
    Created on : 2018-01-13, 13:10:27
    Author     : Iluvris
--%>

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

        <title>Artemis</title>

        <!-- Bootstrap core CSS -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">


        <link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.2/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.2/owl.theme.min.css">

        <!-- Custom styles for this template -->
        <link href="./css/service.css" rel="stylesheet">
        <link href="./css/register.css" rel="stylesheet">

    </head>
    <!-- NAVBAR
    ================================================== -->


    <body style="background-color:#559acc;">

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/holder/2.4.0/holder.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/holder/2.4.0/holder.js"></script>
        <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.2/owl.carousel.min.js"></script>




        <!-- navigation panel -->
        <div class="navbar-wrapper">
            <div class="container">
                <nav class="navbar navbar-inverse" role="navigation">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-main">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="index.jsp">Artemis</a>
                        </div>

                        <div class="collapse navbar-collapse" id="navbar-collapse-main">
                            <form class="navbar-form pull-left">
                                <div class="input-group" style="max-width:100px;">
                                    <input class="form-control" placeholder="SearchGame" name="srch-term" id="srch-term" type="text">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default btn-primary" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                                </div>
                            </form>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="games.jsp">Games</a></li>
                                <!-- <li><a href="giveaway.jsp">Giveaway</a></li> --->
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Art<span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Images</a></li>
                                        <li><a href="#">Moves</a></li>
                                        <li><a href="#">Wallpaper</a></li>
                                        <li><a href="#">Soundtrack</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Contact <span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Partnership</a></li>
                                        <li><a href="#">Live chat suport</a></li>
                                        <li><a href="contact_support.jsp">Contact support </a></li>
                                        <li><a href="#">Work </a></li>
                                    </ul>
                                </li>



                                <%
                                    if (session.getAttribute("User") != null) {
                                %> 


                                <%}%>




                                <%
                                    if (session.getAttribute("Admin") != null) {

                                %> 

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">AdminMenager<span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="accMenager.jsp">AccountMenager</a></li>
                                        <li><a href="productMenager.jsp">ProductMenager</a></li>
                                        <li><a href="raports.jsp">Raports</a></li>

                                    </ul>
                                </li>




                                <%}%>

                                <%
                                    if (session.getAttribute("Pracownik") != null) {

                                %> 


                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">WorkerMenager<span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="productMenager.jsp">ProductMenager</a></li>
                                        <li><a href="raports.jsp">Raports</a></li>


                                    </ul>
                                </li>




                                <%}%>


                                <%
                                    if (session.getAttribute("Admin") == null && session.getAttribute("Pracownik") == null && session.getAttribute("User") == null) {
                                %> 
                                <li><a href="register.jsp">Register</a></li>
                                <li><a href="sign_in.jsp">Sign in</a></li>

                                <%}%>
                                <%

                                    Connection conn = null;
                                    Statement stat = null;
                                    ResultSet res = null;


                                %>
                                <%                         if (session.getAttribute("Admin") != null || session.getAttribute("Pracownik") != null || session.getAttribute("User") != null) {%>
                                <li>   <form  action="shoppingcart" name="formBuy" method="post">
                                        <button class="btn btn-large" id="btmGameBuy" name="iconCard" value="true" style=" background-color: lightslategrey; padding: 4px 8px; margin-right:12px; margin-top: 5px;" ><span style="color:#fff; font-size: 20px; margin-top: 0px; margin-left:9px; margin-right:12px;" class="glyphicon glyphicon-shopping-cart" ></span></button>
                                    </form></li>
                                <li style="color:lightskyblue; margin-top: 14px; font-size:17px; "> 

                                    <%=(session.getAttribute("Admin") == null) ? "" : " | Welcome! " + session.getAttribute("Admin") + " |"%>
                                    <%=(session.getAttribute("Pracownik") == null) ? "" : " | Welcome! " + session.getAttribute("Pracownik") + " |"%>
                                    <%=(session.getAttribute("User") == null) ? "" : " | Welcome! " + session.getAttribute("User") + " |"%>
                                </li>

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">MyPanel<span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">

                                        <li><a href="orderHistory.jsp" style="color: #3aa343; font-weight: bold;" >My Order</a></li>
                                        <li><a href="logout" style="color: #bc7820; font-weight: 600; font-size: 14px;  ">Logout!</a></li>

                                    </ul>
                                </li>


                                <%}%>


                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>
        </div>


        <div class="container" id="SuppBody">
            <div class="row main">
                <div class="main-login main-center">
                    <h5>Dołącz do nas i odkryj świat gier</h5>
                    <form name="sentMessage" method="post" action="register" id="contactForm" >






                        <div class="form-group">
                            <label for="imie" class="cols-sm-2 control-label">Podaj Imie</label>

                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                    <input type="text" value="<%=(request.getAttribute("imie") == null) ? "" : request.getAttribute("imie")%>" name="imie" class="form-control" id="imie" placeholder="Podaj Imie" pattern="([a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,20}" title="Imie może się składać tylko z liter o długości 3-20" required>

                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="naziwsko" class="cols-sm-2 control-label">Podaj Nazwisko</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                    <input type="text" value="<%=(request.getAttribute("nazwisko") == null) ? "" : request.getAttribute("nazwisko")%>" name="nazwisko" class="form-control" id="surname" placeholder="Podaj Nazwisko" pattern="([a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwisko może się składać tylko z liter o długości 3-40" required >

                                </div>
                            </div>
                        </div>                




                        <div class="form-group">
                            <label for="telefon" class="cols-sm-2 control-label">Telefon</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-phone fa" aria-hidden="true"></i></span>
                                    <input type="tel" value="<%=(request.getAttribute("telefon") == null) ? "" : request.getAttribute("telefon")%>" name="telefon" class="form-control" placeholder="Podaj Telefon" id="phone" pattern="[0-9]{9}" required>
                                    <span style="color:#d10202; font-size: 15px; text-align: center;"><%=(request.getAttribute("zajetyTelefon") == null) ? "" : request.getAttribute("zajetyTelefon")%></span>
                                </div>
                            </div>
                        </div>





                        <div class="form-group">
                            <div class="row">

                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <label for="kod_pocztowy" class="cols-sm-2 control-label">Kod pocztowy</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-barcode fa" aria-hidden="true"></i></span>
                                        <input type="text" value="<%=(request.getAttribute("kod_pocztowy") == null) ? "" : request.getAttribute("kod_pocztowy")%>" name="kod_pocztowy" class="form-control" id="kod_pocztowy" placeholder="Kod pocztowy" pattern="^[0-9]{2}-[0-9]{3}$" title="Podaj kod w nastepującym formacie ( 00-000 )" required>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <label for="miasto" class="cols-sm-5 control-label">Miasto</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-home fa" aria-hidden="true"></i></span>
                                        <input type="text" value="<%=(request.getAttribute("miasto") == null) ? "" : request.getAttribute("miasto")%>" name="miasto" class="form-control" id="miasto" placeholder="Podaj Miasto" pattern="([a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwa miasta może się składać tylko z liter o długości 3-40" required >
                                    </div>
                                </div>
                            </div>
                        </div>        





                        <div class="form-group">
                            <label for="nr_domu" class="cols-sm-2 control-label">Nr Domu/Mieszkania</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-building fa" aria-hidden="true"></i></span>
                                    <input type="text" value="<%=(request.getAttribute("nr_domu") == null) ? "" : request.getAttribute("nr_domu")%>" name="nr_domu" class="form-control" placeholder="Podaj Nr Domu / Mieszkania" id="nr_domu" pattern="([0-9a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwa miasta może się składać tylko z liter i cyfr o długości 3-40" required>

                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="ulica" class="cols-sm-2 control-label">Ulica</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-eraser fa" aria-hidden="true"></i></span>
                                    <input type="text" value="<%=(request.getAttribute("ulica") == null) ? "" : request.getAttribute("ulica")%>" name="ulica" class="form-control" placeholder="Podaj Ulice" id="ulica" pattern="([0-9a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwa miasta może się składać tylko z liter i cyfr o długości 3-40" required>

                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Email</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                    <input type="text" value="<%=(request.getAttribute("email") == null) ? "" : request.getAttribute("email")%>" name="email" class="form-control" id="email" placeholder="Podaj Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="np. JanKowalski@gmail.com"  required>
                                    <span style="color:#d10202; font-size: 15px; text-align: center;"><%=(request.getAttribute("zajetyEmail") == null) ? "" : request.getAttribute("zajetyEmail")%></span>      
                                </div>
                            </div>
                        </div>


                        <div class="form-group">

                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <label for="name" class="cols-sm-2 control-label">Podaj hasło</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                        <input type="password" name="haslo" class="form-control" id="haslo" placeholder="Podaj Hasło" pattern="^(?=(.*\d){2})(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z\d]).{8,}$" title="Haslo powinno się składac z co najmniej jednej dużej litery, cyfry i znaku specjalnego o minimalnej długości 8 znaków" required>

                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <label for="imie" class="cols-sm-5 control-label">Potwierdz hasło</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                        <input type="password" name="potwierdz_haslo" class="form-control"  id="potwierdz_haslo"   placeholder="Potwierdz Hasło" pattern="^(?=(.*\d){2})(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z\d]).{8,}$" title="Haslo powinno się składac z co najmniej jednej dużej litery, cyfry i znaku specjalnego o minimalnej długości 8 znaków" required>

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
                                </div>
                            </div>

                        </div>         


                        <!--						<div class="form-group">
                                                                                <label for="haslo" class="cols-sm-2 control-label">Hasło</label>
                                                                                <div class="cols-sm-10">
                                                                                        <div class="input-group">
                                                                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                                                                <input type="password" name="haslo" class="form-control" id="haslo" placeholder="Podaj Hasło" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required>
                                                                                               
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                        
                                                                        <div class="form-group">
                                                                                <label for="potwierdz" class="cols-sm-2 control-label">Potwierdz Hasło</label>
                                                                                <div class="cols-sm-10">
                                                                                        <div class="input-group">
                                                                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                                                                <input type="password" name="potwierdz_haslo" class="form-control"  id="potwierdz_haslo"   placeholder="Potwierdz Hasło" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" title="Wynagana co najmniej jedna duża litera i cyfra" required>
                                                                                                
                                                                                                <script language='javascript' type='text/javascript'>
                                                                                                  var haslo = document.getElementById("haslo")
                                                                                                            , potwierdz_haslo = document.getElementById("potwierdz_haslo");
                        
                                                                                                          function validatePassword(){
                                                                                                            if(haslo.value != potwierdz_haslo.value) {
                                                                                                              potwierdz_haslo.setCustomValidity("Podane hasła są różne!");
                                                                                                            } else {
                                                                                                              potwierdz_haslo.setCustomValidity('');
                                                                                                            }
                                                                                                          }
                        
                                                                                                          haslo.onchange = validatePassword;
                                                                                                          potwierdz_haslo.onkeyup = validatePassword;
                                                                                                </script>
                                                                                                
                                                                                        </div>
                                                                                </div>
                                                                        </div>-->

                        
                        <div class="form-group " id="RegSpace">
                           
                            <button type="submit" value="Register" class="btn btn-warning btn-lg btn-block login-button">Register</button>
                            <div class="form-group" style="align-content: center; text-align: center" >
                                <span style="color:red; font-size: 20px;  text-align: center;"><%=(request.getAttribute("registerFail") == null) ? "" : request.getAttribute("registerFail")%></span>
                            </div>
                        </div>
                    </form>
                          <div class="form-group" style="align-content: center; text-align: center" >  
                            <form action="sign_in.jsp">
                    <span style="color:#59ff3f; font-size: 17px;  text-align: center; ">
                                    <%if (request.getAttribute("registetrSucces") == null) {
                                                            } else {%>
                                                            <%=request.getAttribute("registetrSucces")%><button type="submit" value=""  class="btn btn-success btn-lg btn-block login-button">Zaloguj się</button><%}%></span>  
                          </form>  
                            </div>
                </div>
            </div>
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>
