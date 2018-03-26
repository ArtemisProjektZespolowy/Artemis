
<!------ Include the above in your HEAD tag ---------->

<%@page import="src.PolaczenieDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <link href="https://mdbootstrap.com/previews/docs/latest/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://mdbootstrap.com/previews/docs/latest/css/mdb.min.css" rel="stylesheet">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>   
  <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Artemis</title>

        <!-- Bootstrap core CSS -->
        


        <link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="./css/service.css" rel="stylesheet">
        <link href="./css/register_sing_in.css" rel="stylesheet">
<head>
    
    
    
<!--<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/Lewitje/pen/BNNJjo?depth=everything&order=popularity&page=14&q=box&show_forks=false" />-->


</head>
<body>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/holder/2.4.0/holder.js"></script>

    
    
<jsp:include page="header.jsp"/>
    

        --->                        
        <div class="body_1">
            <div class="wrapper">
                <div class="container_1">
                    <h1>Zarejestruj się</h1>
                    <div class="form-group">
                        <form class="form_1" name="sentMessage" method="post" action="register" >
                            <div class="form-group">
                                <div class="row">
                                <input type="text" value="<%=(request.getAttribute("imie") == null) ? "" : request.getAttribute("imie")%>" name="imie"  id="imie" placeholder="Podaj Imie" pattern="([a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,20}" title="Imie może się składać tylko z liter o długości 3-20" required>
                                <input type="text" value="<%=(request.getAttribute("nazwisko") == null) ? "" : request.getAttribute("nazwisko")%>" name="nazwisko"  id="surname" placeholder="Podaj Nazwisko" pattern="([a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwisko może się składać tylko z liter o długości 3-40" required >
                                </div>
                                <input type="text" value="<%=(request.getAttribute("email") == null) ? "" : request.getAttribute("email")%>" name="email"  id="email" placeholder="Podaj Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="np. JanKowalski@gmail.com"  required>
                                <input type="tel" value="<%=(request.getAttribute("telefon") == null) ? "" : request.getAttribute("telefon")%>" name="telefon"  placeholder="Podaj Telefon" id="phone" pattern="[0-9]{9}" required>
                                <span style="color:red; font-size: 15px; text-align: center;"><%=(request.getAttribute("zajetyTelefon") == null) ? "" : request.getAttribute("zajetyTelefon")%></span>
                            </div>  


                            <div class="row">
                            
                                <label for="firstname" class="sr-only"></label>
                                <input type="text" value="<%=(request.getAttribute("kod_pocztowy") == null) ? "" : request.getAttribute("kod_pocztowy")%>" name="kod_pocztowy"  id="kod_pocztowy" placeholder="Kod pocztowy" pattern="^[0-9]{2}-[0-9]{3}$" title="Podaj kod w nastepującym formacie ( 00-000 )" required>   
                                <input type="text" value="<%=(request.getAttribute("miasto") == null) ? "" : request.getAttribute("miasto")%>" name="miasto"  id="miasto" placeholder="Podaj Miasto" pattern="([a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwa miasta może się składać tylko z liter o długości 3-40" required >
                            
                            </div>
                            <div class="form-group">
                                <input type="text" value="<%=(request.getAttribute("nr_domu") == null) ? "" : request.getAttribute("nr_domu")%>" name="nr_domu"  placeholder="Podaj Nr Domu / Mieszkania" id="nr_domu" pattern="([0-9a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwa miasta może się składać tylko z liter i cyfr o długości 3-40" required>
                                <input type="text" value="<%=(request.getAttribute("ulica") == null) ? "" : request.getAttribute("ulica")%>" name="ulica"  placeholder="Podaj Ulice" id="ulica" pattern="([0-9a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻ]+){3,40}" title="Nazwa miasta może się składać tylko z liter i cyfr o długości 3-40" required>
                                <span style="color:red; font-size: 15px; text-align: center;"><%=(request.getAttribute("zajetyEmail") == null) ? "" : request.getAttribute("zajetyEmail")%></span>
                            </div>


                            <div class="row">
                                <label for="firstname" class="sr-only"></label>
                                <input type="password" name="haslo"  id="haslo" placeholder="Podaj Hasło" pattern="^(?=(.*\d){2})(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z\d]).{8,}$" title="Haslo powinno się składac z co najmniej jednej dużej litery, cyfry i znaku specjalnego o minimalnej długości 8 znaków" required>
                                   
                                <input type="password" name="potwierdz_haslo" id="potwierdz_haslo"   placeholder="Potwierdz Hasło" pattern="^(?=(.*\d){2})(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z\d]).{8,}$" title="Haslo powinno się składac z co najmniej jednej dużej litery, cyfry i znaku specjalnego o minimalnej długości 8 znaków" required>
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
                            <button class="button_1" type="submit" value="Register" >Zarejestruj się</button>
                            <span style="color:red; font-size: 20px;  text-align: center;"><%=(request.getAttribute("registerFail") == null) ? "" : request.getAttribute("registerFail")%></span>

                        </form>
                        <span style="color:white; font-size: 17px;  text-align: center; ">
                            <%if (request.getAttribute("registetrSucces") == null) {
                                        } else {%>
                            <%=request.getAttribute("registetrSucces")%>
                            <form  class="form_1" action="sign_in.jsp">

                                <button class="button_1" type="submit" value="" >Zaloguj się</button><%}%></span> 
                        </form>  
                    </div>

                    <ul class="bg-bubbles">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
        </div>
        <script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script > $("#login-button").click(function (event) {
                                        event.preventDefault();

                                        $('form').fadeOut(500);
                                        $('.wrapper').addClass('form-success');
                                    });
                                    //# sourceURL=pen.js
        </script>
    </body>
</html>
