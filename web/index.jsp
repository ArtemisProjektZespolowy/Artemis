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

<div class="container" id = "xd">
        
       <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" id="obraz" src="https://i.imgur.com/3XYxFR7.png" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" id="obraz" src="https://i.imgur.com/gW0Pelq.png" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" id="obraz" src="https://i.imgur.com/hoR3p9b.png" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    </div>


        <!-- Marketing messaging and featurettes
        ================================================== -->
        <!-- Wrap the rest of the page in another container to center all the content. -->

        <div class="container marketing">

            <!-- Three columns of text below the carousel -->
            <div class="row">
                <div class="col-lg-4">
                    <img src="https://i.imgur.com/FEzlI9G.png" alt="Generic placeholder image" style="width: 140px; height: 140px;">
                    <h2>Overwatch</h2>
                    <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."</p>
                    <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a>
                    </p>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img src="https://i.imgur.com/gW0Pelq.png" alt="Generic placeholder image" style="width: 140px; height: 140px;">
                    <h2>Fortnite</h2>
                    <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."</p>
                    <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a>
                    </p>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img src="https://i.imgur.com/3XYxFR7.png" alt="Generic placeholder image" style="width: 140px; height: 140px;">
                    <h2>Horizon zero dawn</h2>
                    <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."</p>
                    <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a>
                    </p>
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->


            <!-- START THE FEATURETTES -->



            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading">Horizon zero dawn<span class="text-muted"></span></h2>
                    <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
                <div class="col-md-5">
                    <img class="featurette-image img-responsive" src="https://i.imgur.com/3XYxFR7.png" style="max-width: 350px; max-height: 350px;" alt="Generic placeholder image">
                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-5">
                    <img class="featurette-image img-responsive" src="https://i.imgur.com/gW0Pelq.png" style="max-width: 350px; max-height: 350px;" alt="Generic placeholder image">
                </div>
                <div class="col-md-7">
                    <h2 class="featurette-heading">Fortnite<span class="text-muted">Open Beta! </span></h2>
                    <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading">Ashes of creation.<span class="text-muted">Patch 30.2</span></h2>
                    <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
                <div class="col-md-5">
                    <img class="featurette-image img-responsive" src="https://i.imgur.com/hoR3p9b.png" style="max-width: 350px; max-height: 350px;" alt="Generic placeholder image">
                </div>
            </div>

            <hr class="featurette-divider">

            <!-- /END THE FEATURETTES -->
        </div>
        <div class="contact">
            <div class="container">
                <div class="row">


                    <div class="col-md-3">
                        <h2 class="big-h2-heading"><i class="icon-envelope"></i> Contact Us</h2>
                        <p>Contact us to learn more about our product. We'll be in touch soon! Fill out the form or drop us an email to <a href="mailto:artemis@gmail.com">artemis@gmail.com</a>.</p>
                        <form id="contactUsForm" class="form-main" action="https://www.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8" novalidate="novalidate">
                            <fieldset>
                                <!-- Form Name -->
                                <!-- Text input-->
                                <div class="control-group">
                                    <label class="control-label" for="contact_first_name">Name <abbr title="required">*</abbr></label>
                                    <div class="controls">
                                        <input id="contact_first_name" name="first_name" type="text" placeholder="" class="input-xlarge required" aria-required="true">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="control-group">
                                    <label class="control-label" for="contact_email">Email <abbr title="required">*</abbr></label>
                                    <div class="controls">
                                        <input id="contact_email" name="email" type="text" placeholder="" class="input-xlarge required email" aria-required="true">

                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="control-group">
                                    <label class="control-label" for="contact_message">Message <abbr title="required">*</abbr></label>
                                    <div class="controls">
                                        <textarea id="contact_message" name="00Nb0000009NMvh" rows="3" type="text" wrap="soft" class="input-xlarge required" aria-required="true"></textarea>
                                    </div>
                                </div>

                                <div class="control-group hide">
                                    <div class="controls">
                                        <input maxlength="10" name="00Nb0000007as9g" size="20" type="text" value="yes" class="spam-input">
                                    </div>
                                </div>
                                <div class="actions">
                                    <button tabindex="4" type="submit" class="btn btn-large btn-primary ">Submit</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>

                    <div class="col-md-4 col-md-offset-1 vcard">
                        <h2 class="big-h2-heading"><i class="icon-map-marker"></i> Locate Us</h2>
                        <p class="margintop10"><span class="fn org">Our HQ</span></p>
                        <div class="adr">
                            <p><i class="icon-road"></i> <span class="street-address">Krosno</span></p>
                            <p><i class="icon-home"></i> <span class="locality">ul.malarska 5</span>, <span class="region"></span> <span class="postal-code">37-000</span></p>
                        </div>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3152.8968825939833!2d-122.39587069999999!3d37.79245629999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808580638aba3b7f%3A0x55a37465e30f91b2!2s50+Main+St%2C+San+Francisco%2C+CA+94111%2C+USA!5e0!3m2!1sen!2suk!4v1413975007640" width="600" height="450" frameborder="0" style="border:0"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">     
            <div class="row">
                <!-- price & service -->
                <div class="container">
                    <div class="row">
                        <h2 id="details">Choose your package</h2>
                    </div><br>

<div class="row">
                    <!-- Pack 1-->
                    <div class="col-md-3" id="home-box">
                        <div class="pricing_header">
                            <h2>Basic User</h2>
                            <div class="space"></div>
                        </div>
                        <ul class="list-group">
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_1</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_2</li>
                            <li class="list-group-item off"><span class="glyphicon glyphicon-remove"></span> Variant_3</li>
                            <li class="list-group-item off"><span class="glyphicon glyphicon-remove"></span> Variant_4</li>
                            <li class="list-group-item off"><span class="glyphicon glyphicon-remove"></span> Variant_5</li>
                            <li class="list-group-item off"><span class="glyphicon glyphicon-remove"></span> Variant_6</li>
                        </ul>

                        <div class="try">
                            <p class="price">Free</p>
                            <a class="btn btn-default" href="#" type="button">Select</a>
                        </div>
                    </div>
                    <!-- Pack 2-->
                    <div class="col-md-3" id="home-box">
                        <div class="pricing_header">
                            <h2>Premium User</h2>
                            <div class="space"></div>
                        </div>
                        <ul class="list-group">
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_1</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_2</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_3</li>
                            <li class="list-group-item off"><span class="glyphicon glyphicon-remove"></span> Variant_4</li>
                            <li class="list-group-item off"><span class="glyphicon glyphicon-remove"></span> Variant_5</li>
                            <li class="list-group-item off"><span class="glyphicon glyphicon-remove"></span> Variant_6</li>
                        </ul>

                        <div class="try">
                            <p class="price">$ 44.99</p>
                            <a class="btn btn-default" href="#" type="button">Select</a>

                        </div>
                    </div>


                    <!-- Pack 3-->
                    <div class="col-md-3" id="home-box">
                        <div class="pricing_header">
                            <h2>Business User</h2>
                            <div class="space"></div>
                        </div>
                        <ul class="list-group">

                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_1</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_2</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_3</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_4</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_5</li>
                            <li class="list-group-item off"><span class="glyphicon glyphicon-remove"></span> Variant_6</li>
                        </ul>

                        <div class="try">
                            <p class="price">$ 79.99</p>
                            <button class="btn btn-default" href="#" type="button">Select</button>
                        </div>
                    </div>


                    <!-- Pack 4-->
                    <div class="col-md-3" id="home-box">
                        <div class="pricing_header">
                            <h2>Customize</h2>
                            <div class="space"></div>
                        </div>
                        <ul class="list-group">
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_1</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_2</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_3</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_4</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_5</li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-ok"></span> Variant_6</li>
                        </ul>

                        <div class="try">
                            <p class="price">$ 119.99</p>
                            <button class="btn btn-default" href="#" type="button">Select</button>
                        </div>

                    </div> 
                </div>  
            </div>
            </div>
            <hr class="featurette-divider">


            <!-- FOOTER -->
            <footer>
                <p class="pull-right"><a href="#">Back to top</a>
                </p>
                <p>&copy; 2017 Artemis. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a>
                </p>
            </footer>

        </div>
        <!-- /.container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->


    </body>

</html>

 <!-- /.test -->