
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
                <a class="nav-link" href="3">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Games</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Art</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>
            </ul>
             
        <ul class="navbar-nav ml-auto nav-flex-icons">
           <!--  <li class="nav-item">
                <a class="nav-link waves-effect waves-light">14 <i class="fa fa-envelope"></i></a>
            </li>
            <li class="nav-item avatar dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="http://www.torneodj.com/files/avatar/2_120.jpg" class="img-fluid rounded-circle z-depth-0" width="30"></a>
                <div class="dropdown-menu dropdown-menu-right dropdown-purple" aria-labelledby="navbarDropdownMenuLink-5">
                    <a class="dropdown-item whov" href="#"><i class="fa fa-plus"></i> Agregar post</a>
                    <a class="dropdown-item whov" href="#"><i class="fa fa-edit"></i> Editar cuenta</a>
                </div>
            </li>-->
           <% if(session.getAttribute("permissions") == null){%>
            <li class="nav-item">
                <a class="nav-link" href="#">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="sign_in.jsp">Sign in</a>
            </li>
             <%}else{%>
             <li class="nav-item">
                <a class="nav-link" href="#"><%="Welcome " +  session.getAttribute("User")%></a>
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
            <%}%>
        </ul>
    </div>
</nav>
</header>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/bootstrap.min.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/mdb.min.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/jarallax.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/jarallax-video.js"></script>
    <script>
        new WOW().init();
    </script> 