
<%@page import="java.util.TreeMap"%>
<%@page import="shopping.cart.Bean_Ilosc"%>
<%@page import="shopping.cart.Bean_ID"%>
<%@page import="java.util.Map"%>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://mdbootstrap.com/previews/docs/latest/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://mdbootstrap.com/previews/docs/latest/css/mdb.min.css" rel="stylesheet">
        <link href="./css/header.css" rel="stylesheet">

    </head>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark default-color-dark fixed-top">
            <a class="navbar-brand" href="index.jsp">Artemis</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="games.jsp">Games</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Art</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                </ul>

                <%
                    Map<Bean_ID, Bean_Ilosc> koszyk = (Map<Bean_ID, Bean_Ilosc>) session.getAttribute("koszyk");
                    if (koszyk == null) {
                        koszyk = new TreeMap<>();
                    }
                %>

                <ul class="s navbar-nav ml-auto nav-flex-icons">
                    <li class="space nav-item">

                        <a  href="shoppingCard.jsp" class="waves-effect waves-light fa-stack fa-1x has-badge" data-count="<%out.print(koszyk.size()); %>">
                            <i class="fa fa-shopping-cart fa-stack fa-inverse"></i>
                        </a>
                    </li>


                    <li class="nav-item">

                        <span class=" waves-effect waves-light fa-stack fa-1x has-badge" data-count="10">
                            <i class="fa fa-envelope fa-stack fa-inverse"></i>
                        </span>
                    </li>


                    <% if (session.getAttribute("permissions") == null) {%>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Zarejestruj</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="sign_in.jsp">Zaloguj</a>
                    </li>
                    <%} else {%>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><%="Welcome " + session.getAttribute("User")%></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My account</a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Images</a></li>
                            <li><a href="#">Moves</a></li>
                            <li><a href="#">Wallpaper</a></li>
                            <li><a href="#">Soundtrack</a></li>

                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Wyloguj</a>
                    </li>
                    <%}%>
                </ul>
            </div>
        </nav>
    </header>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <script src="https://mdbootstrap.com/previews/docs/latest/js/bootstrap.min.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/mdb.min.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/jarallax.js"></script>

    new WOW().init();
</script> 