

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



        <div class="container" style="background-color: rgba(255,255,255, 0.2); width: 55%; ">


            <h4>Wybierz rodzaj płatnosci</h4>

            <div class="tabs-wrapper"> 
                <ul class="nav classic-tabs tabs-orange waves-effect"  role="tablist">
                    <li class="nav-item" style="float: none; margin: 0 auto;" >
                        <a class="nav-link waves-light active waves-effect" data-toggle="tab" href="#panel61" role="tab"><i class="fa fa-credit-card fa-2x" aria-hidden="true"></i><br>Karty kredytwe</a>
                    </li>
                    <li class="nav-item"style="float: none; margin: 0 auto;">
                        <a class="nav-link waves-light waves-effect" data-toggle="tab" href="#panel62" role="tab"><i class="fa fa-globe fa-2x" aria-hidden="true"></i><br>Przelewy</a>
                    </li>
                    <li class="nav-item"style="float: none; margin: 0 auto;">
                        <a class="nav-link waves-light waves-effect" data-toggle="tab" href="#panel63" role="tab"><i class="fa fa-cc-paypal fa-2x" aria-hidden="true"></i><br>PayPal</a>
                    </li>
                    <li class="nav-item"style="float: none; margin: 0 auto;">
                        <a class="nav-link waves-light waves-effect" data-toggle="tab" href="#panel64" role="tab"><i class="fa fa-star fa-2x" aria-hidden="true"></i><br>Inne</a>
                    </li>
                </ul>
            </div>

            <!-- Tab panels -->
            <div class="tab-content card">

                <!--Panel 1-->
                <div class="tab-pane fade in show active" id="panel61" role="tabpanel">
                    <form  action="zamowienie" method="post">

                        <div class="credit-card-div">
                            <div class="panel panel-default" >
                                <div class="panel-heading">

                                    <div class="row ">
                                        <div class="col-md-12">
                                            <input type="text" class="form-control" placeholder="Wprowadź numer karty" />
                                        </div>
                                    </div>
                                    <div class="row ">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <span class="help-block text-muted small-font" > Miesiąc</span>
                                            <input type="text" class="form-control" placeholder="MM" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <span class="help-block text-muted small-font" >  Rok</span>
                                            <input type="text" class="form-control" placeholder="YY" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <span class="help-block text-muted small-font" >  CCV</span>
                                            <input type="text" class="form-control" placeholder="CCV" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <img src="img/1.png" class="img-rounded" />
                                        </div>
                                    </div>
                                    </br>
                                    <div class="row ">
                                        <div class="col-md-12 pad-adjust">

                                            <input type="text" class="form-control" placeholder="Imię i nazwisko na karcie" />
                                        </div>
                                    </div>
                                    </br>
                                    <div class="row ">
                                        <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                          <a href="shoppingCard.jsp" class="btn btn-danger waves-effect" value="" />Anuluj</a>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">                 
                                            <button  class="btn btn-success btn-block waves-effect" name="rodzaj_platnosci" value="karta_kredytowa" >Zapłać</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- CREDIT CARD DIV END -->


                    </form>
                </div>
                <!--/.Panel 1-->

                <!--Panel 2-->
             
                <div class="tab-pane fade" id="panel62" role="tabpanel">
                       <h5>In Dev</h5>
                    <form  action="zamowienie" method="post">
                               <div class="credit-card-div">
                            <div class="panel panel-default" >
                                <div class="panel-heading">

                                    <div class="row ">
                                        <div class="col-md-12">
                                            <input type="text" class="form-control" placeholder="Wprowadź numer karty" />
                                        </div>
                                    </div>
                                    <div class="row ">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <span class="help-block text-muted small-font" > Miesiąc</span>
                                            <input type="text" class="form-control" placeholder="MM" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <span class="help-block text-muted small-font" >  Rok</span>
                                            <input type="text" class="form-control" placeholder="YY" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <span class="help-block text-muted small-font" >  CCV</span>
                                            <input type="text" class="form-control" placeholder="CCV" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <img src="img/1.png" class="img-rounded" />
                                        </div>
                                    </div>
                                    </br>
                                    <div class="row ">
                                        <div class="col-md-12 pad-adjust">

                                            <input type="text" class="form-control" placeholder="Imię i nazwisko na karcie" />
                                        </div>
                                    </div>
                                    </br>
                                    <div class="row ">
                                        <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                          <a href="shoppingCard.jsp" class="btn btn-danger waves-effect" value="" />Anuluj</a>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">                 
                                            <button  class="btn btn-success btn-block waves-effect" name="rodzaj_platnosci" value="przelew" >Zapłać</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        
                    </form>
                </div>
                <!--/.Panel 2-->

                <!--Panel 3-->
                <div class="tab-pane fade" id="panel63" role="tabpanel">
                    <form  action="zamowienie" method="post">
                        
                        
                        <div class="credit-card-div">
                            <i class="fa fa-cc-paypal fa-20x" style="font-size: 60px; color: #009edf; " ></i>
                            <div class="panel panel-default" >
                                <div class="panel-heading">

                                    <div class="row ">
                                        <div class="col-md-12">
                                            </br>
                                            <input type="text" class="form-control" placeholder="Wprowadź login" />
                                        </div>
                                    </div>

                                    </br>
                                    <div class="row ">
                                        <div class="col-md-12 pad-adjust">

                                            <input type="password" class="form-control" placeholder="Haslo" />
                                        </div>
                                    </div>
                                    </br>
                                    <div class="row ">
                                        <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                            <a href="shoppingCard.jsp"  class="btn btn-danger waves-effect" value="" />Anuluj</a>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">                 
                                            <button  class="btn btn-success btn-block waves-effect" name="rodzaj_platnosci" value="payPal" >Zapłać</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- CREDIT CARD DIV END -->
                    </form>
                </div>
                <!--/.Panel 3-->

                <!--Panel 4-->
                <div class="tab-pane fade" id="panel64" role="tabpanel">
                    <h5>In Dev</h5>
                    <form  action="zamowienie" method="post">
                         <div class="credit-card-div">
                            <div class="panel panel-default" >
                                <div class="panel-heading">

                                    <div class="row ">
                                        <div class="col-md-12">
                                            <input type="text" class="form-control" placeholder="Wprowadź numer karty" />
                                        </div>
                                    </div>
                                    <div class="row ">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <span class="help-block text-muted small-font" > Miesiąc</span>
                                            <input type="text" class="form-control" placeholder="MM" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <span class="help-block text-muted small-font" >  Rok</span>
                                            <input type="text" class="form-control" placeholder="YY" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <span class="help-block text-muted small-font" >  CCV</span>
                                            <input type="text" class="form-control" placeholder="CCV" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <img src="img/1.png" class="img-rounded" />
                                        </div>
                                    </div>
                                    </br>
                                    <div class="row ">
                                        <div class="col-md-12 pad-adjust">

                                            <input type="text" class="form-control" placeholder="Imię i nazwisko na karcie" />
                                        </div>
                                    </div>
                                    </br>
                                    <div class="row ">
                                        <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                          <a href="shoppingCard.jsp" class="btn btn-danger waves-effect" value="" />Anuluj</a>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">                 
                                            <button  class="btn btn-success btn-block waves-effect" name="rodzaj_platnosci" value="inne" >Zapłać</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                      
                    </form>
                </div>
                <!--/.Panel 4-->

            </div>





        </div>

    </body>

</html>