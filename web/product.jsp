<%-- 
    Document   : product
    Created on : 2018-04-04, 14:03:00
    Author     : Patryk
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    
    <div class="container" id="xd">
       <%                         ResultSet res = null;                                 
        if(request.getAttribute("produkt.id")!= null){
                                  Connection conn = null;
                                  Statement stat = null;
                                  conn = PolaczenieDB.getConnection();
                                  stat = conn.createStatement();
                                  String data = ("select * from produkt where id_produktu = " + request.getAttribute("produkt.id")+";");
                                  res = stat.executeQuery(data);                                  
                                  res.next();%>
       
                                  <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif"><%out.println(res.getString("nazwa"));%></h1>
                                  <hr class="featurette-divider" style="margin-left: -10px">
                                  
                                  
<%
                               String picture = res.getString("obraz");
                               ArrayList<String> pictureArray = new ArrayList();
                               StringTokenizer stringTokenizer = new StringTokenizer(picture, ", ");
                               while(stringTokenizer.hasMoreElements()){
                               pictureArray.add(stringTokenizer.nextToken());
                               }
%>                                  
                                  
<div class ="row">
        <div class="col-sm-7">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" id="obraz" src="<%=pictureArray.get(1)%>" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" id="obraz" src="<%=pictureArray.get(2)%>" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" id="obraz" src="<%=pictureArray.get(3)%>" alt="Third slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" id="obraz" src="<%=pictureArray.get(4)%>" alt="Fourth slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="fa fa-angle-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="fa fa-angle-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    </div>
    <div class ="col-sm-5">
        <div class="col" style="text-align: center;">

            <p style="margin-top:10px;text-align: center;font-weight:bold;font-size:30px; font-family: Trebuchet MS, Helvetica, sans-serif">KATEGORIA<p style="text-align: center;margin-top: -15px;font-size:26px; font-family: Trebuchet MS, Helvetica, sans-serif;"><%out.println(res.getString("kategoria"));%></p> 
            </p>
            <p style="text-align: center;font-weight:bold;font-size:30px; font-family: Trebuchet MS, Helvetica, sans-serif">PLATFORMA<p style="text-align: center;margin-top: -15px;font-size:26px; font-family: Trebuchet MS, Helvetica, sans-serif;"><%out.println(res.getString("platforma"));%></p> 
            </p>
            <%Date td = res.getDate("data_wydania");
                                                        String b = new String("");
                                                        SimpleDateFormat format = new SimpleDateFormat("dd/MM/YYYY");
                                                        b = format.format(td);%>
            <p style="text-align: center;font-weight:bold;font-size:30px; font-family: Trebuchet MS, Helvetica, sans-serif">DATA WYDANIA<p style="text-align: center;margin-top: -15px;font-size:26px; font-family: Trebuchet MS, Helvetica, sans-serif;"><%out.println(b);%></p> 
            </p>

        <form  action="shoppingcart" name="formBuy" method="post">
        <button tabindex="4" name="btnBuy" class="btn btn-large btn-success "value="<%=res.getInt("id_produktu")%>" style="text-align: center; font-size: 26px;">Dodaj do koszyka<br><p class="lead" style="font-size: 20px;margin-bottom: -4px">
        <% out.println((String.format("%.2f%n",Double.parseDouble(res.getString("cena"))))+"zł"); %></p></button></form>
        
        </div>
    </div>
    </div>                                  

         
    </div>
        <div class="container" style="min-width: 70%;padding-top:25px;">
            
            
        <%    String opis = res.getString("opis");
                               ArrayList<String> opisArray = new ArrayList();
                               StringTokenizer opisTokenizer = new StringTokenizer(opis, "|");
                               while(opisTokenizer.hasMoreElements()){
                               opisArray.add(opisTokenizer.nextToken());
                               }
        conn.close();%>
                               <%for(int i=0; i<opisArray.size();i++){%>
                               <p style="font-family: Trebuchet MS, Helvetica, sans-serif;"><%out.println(opisArray.get(i));}%></p>
            
            
        </div>    
 


            <footer class="footer">
            <div class="container">
                <span class="text-muted">Copyright &copy; 2018 Artemis.</span>
                <p class="pull-right" style="text-align: center; margin-top: 10px; font-size: 40px;"><a href="#"><span  class="pull-right fa fa-toggle-up text-muted" aria-hidden="true"></span></a></p>
                
            </div>
        </footer>

    </body>                              
<% }else
        response.sendRedirect("index.jsp");
                                   
        %>
    </body>
</html>
