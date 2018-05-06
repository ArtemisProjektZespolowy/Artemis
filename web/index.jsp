<%-- 
    Document   : index
    Created on : 2018-01-13, 13:10:27
    Author     : Iluvris
--%>

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

<div class="container" id = "xd">
    <div class ="row">
        <div class="col-sm-7">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
        <script>
            <%out.println("function " + "farcry5" + "()");%>{
            document.getElementById("farcry5Form").submit();}
            </script>
            <form id="farcry5Form" action="more" name="formMore" method="get">
                <a class="text-muted" onclick="farcry5()"><img class="d-block w-100" id="obraz" src="https://i.imgur.com/7eoCboV.jpg" alt="First slide">
                            <input name="id" type="hidden" value="14"> 
                            </a></form>
      
    </div>
    <div class="carousel-item">
      <script>
            <%out.println("function " + "warhammer2" + "()");%>{
            document.getElementById("warhammer2Form").submit();}
            </script>
            <form id="warhammer2Form" action="more" name="formMore" method="get">
                <a class="text-muted" onclick="warhammer2()"><img class="d-block w-100" id="obraz" src="https://i.imgur.com/GCQtdtD.jpg" alt="Second slide">
                            <input name="id" type="hidden" value="26"> 
                            </a></form>
    </div>
    <div class="carousel-item">
      <script>
            <%out.println("function " + "awayout" + "()");%>{
            document.getElementById("awayoutForm").submit();}
            </script>
            <form id="awayoutForm" action="more" name="formMore" method="get">
                <a class="text-muted" onclick="awayout()"><img class="d-block w-100" id="obraz" src="https://i.imgur.com/3OHSlyc.jpg" alt="Third slide">
                            <input name="id" type="hidden" value="28"> 
                            </a></form>
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
        <div class="col">
       <script>
            <%out.println("function " + "prepforwar" + "()");%>{
            document.getElementById("prepForWarForm").submit();}
            </script>
            <form id="prepForWarForm" action="more" name="formMore" method="get">
                <a class="text-muted" onclick="prepforwar()"><img src="https://i.imgur.com/SFxBsvc.png" id="obrazek">
                            <input name="id" type="hidden" value="16"> 
                            </a></form>
       <script>
            <%out.println("function " + "becomeSpelunker" + "()");%>{
            document.getElementById("becomeSpelunkerForm").submit();}
            </script>
            <form id="becomeSpelunkerForm" action="more" name="formMore" method="get">
                <a class="text-muted" onclick="becomeSpelunker()"><img src="https://i.imgur.com/jHjC4XY.png" style="margin-top:8%;"  id = "obrazek">
                            <input name="id" type="hidden" value="29"> 
                            </a></form>
        </div>
    </div>
    </div>
</div>

    


        <!-- Marketing messaging and featurettes
        ================================================== -->
        <!-- Wrap the rest of the page in another container to center all the content. -->

        <div class="container marketing">
            
            <script>
            <%out.println("function " + "najpopularniejsze" + "()");%>{
            document.getElementById("najpopularniejszeForm").submit();}
            </script>
            <form id="najpopularniejszeForm" action="typ" name="formTyp" method="get">
                <a class="text-muted" onclick="najpopularniejsze()"><h3  style="font-weight: bold">Najpopularniejsze  <span  class="fa fa-angle-right" aria-hidden="true"></span></h3>
                            <input name="id" type="hidden" value="Najpopularniejsze"> 
                            </a></form>
            <hr class="featurette-divider" style="margin-left: -10px">
            <div class="row">
            <%int iteracja = 0;
            int currentRow = 1;
                                  Connection conn = null;
                                  Statement stat = null;
                                  ResultSet res = null;
                                  boolean res2next;
                                  ResultSet res2 = null;
                                  Statement stat2 = null;
                                  conn = PolaczenieDB.getConnection();
                                  stat2 = conn.createStatement();
                                  
                                  stat = conn.createStatement();
                                  String data = "select * from produkt order by random() limit 4";
                                  String data2;
                                  res = stat.executeQuery(data);
                                  while(res.next()){
                                      data2 = "select p.id_produktu, count(k.id_produktu) as dostepnosc  from klucze k join produkt p on k.id_produktu=p.id_produktu where p.id_produktu = " + res.getInt("id_produktu") + " and k.czy_zuzyty = 'false' group by p.id_produktu;";                                  
                                      res2= stat2.executeQuery(data2);
                                      if(res2.next())
                                          res2next=true;
                                      else
                                          res2next=false;
                                      
                                      iteracja++;
                                      
                                  %>
        <script>
               

            <%out.println("function " + "update" + iteracja +""+ currentRow + "()");%> {
            document.getElementById("<%=iteracja+""+currentRow%>").submit();
             }
             
        </script>
                                  
                                  <div class="row" id="<%=currentRow%>">
 
        <form id="<%=iteracja+""+currentRow%>" action="more" name="formMore" method="get"><a name="id" onclick="<%out.println("update" + iteracja +""+ currentRow + "()");%>"><div class="col-md-12 " style=" padding-left: 8%;padding-right: 8%;" >
        <div  class="card card-image" style="background-color:#00685c; min-height: 20%;height: 262px;width:262px;  opacity: 0.9;">
            <div class="text-white text-center py-12 px-12 my-12">
                <div>
                    <%int currentId=res.getInt("id_produktu");%>
                    <div id="products" class="item  col-xs-12 col-lg-12" >
                        <h5 id="mid"  style="max-width: 100%; text-align: center;" name="nazwa" class="card-title  mt-2 font-bold"  style=" font-size: 12px;padding-top: 5%">
                            <%if(res.getString("nazwa").length()>20)
                            {String shortenedName;
                            
                            shortenedName=(res.getString("nazwa").substring(0, 20)+"...");
                            out.println(shortenedName); %></h5><% 
                                
                            }else{%>
                            <% out.println(res.getString("nazwa")); %></h6><%}%>                            
                                    <h8 id="mid" name="platforma" class="group inner list-group-item-heading" >
                                    <% out.println(res.getString("platforma"));%></h8>
                        <div class="thumbnail" >
                            <% String obrazek = res.getString("obraz");
                               StringTokenizer stringTokenizer = new StringTokenizer(obrazek, ", ");
                               if(stringTokenizer.hasMoreElements())
                               obrazek=stringTokenizer.nextToken();
                            %>
                            <img  src="<%=obrazek%>"/>
                         <input name="id" type="hidden" value="<%=currentId%>"> 
                            <div class="caption">
                                
                                
                                <div class="row" id="mid">

                                    <div class="col-xs-12 col-md-12">
                                          </a></form>
                                        <form  action="shoppingcart" name="formBuy" method="post">
                                            <button   name="btnBuy" class="btn btn-large btn-success "value="<%=res.getInt("id_produktu")%>" style="margin-left: 20px; margin-top:12px; text-align: center; font-size: 12px;" tabindex="4" <%if(res2next == true){%>>Dodaj do koszyka<%}else{%>disabled>Klucz niedostępny<%}%><br><p class="lead" style="font-size: 12px;margin-bottom: -4px">
                                                <% out.println((String.format("%.2f%n",Double.parseDouble(res.getString("cena"))))+"zł"); %></p></button></form>
                                    </div>                                 
                                </div>
                            </div>
                                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                          </div> 
</div>
                    
                    <% }conn.close();%>
</div>


                                    <hr class="featurette-divider" style="margin-left: -10px">
               
                                    
        <script>
            <%out.println("function " + "nowości" + "()");%>{
            document.getElementById("nowościForm").submit();}
            </script>
            <form id="nowościForm" action="typ" name="formTyp" method="get">
                <a class="text-muted" onclick="nowości()"><h3  style="font-weight: bold">Nowości <span  class="fa fa-angle-right" aria-hidden="true"></span></h3>
                            <input name="id" type="hidden" value="Nowości"> 
                            </a></form>
            <hr class="featurette-divider" style="margin-left: -10px">
            <div class="row">
            <%                    
                                  iteracja=0;
                                  currentRow = 2;
                                  conn = PolaczenieDB.getConnection();
                                  stat = conn.createStatement();
                                  data = "select * from produkt order by data_wydania desc limit 4";
                                  res = stat.executeQuery(data);
                                  stat2 = conn.createStatement();
                                  while(res.next()){
                                      data2 = "select p.id_produktu, count(k.id_produktu) as dostepnosc  from klucze k join produkt p on k.id_produktu=p.id_produktu where p.id_produktu = " + res.getInt("id_produktu") + " and k.czy_zuzyty = 'false' group by p.id_produktu;";                                  
                                      res2= stat2.executeQuery(data2);
                                      if(res2.next())
                                          res2next=true;
                                      else
                                          res2next=false;;
                                      iteracja++;
                                  %>
                                   <script>
               

            <%out.println("function " + "update" + iteracja +""+ currentRow + "()");%> {
            document.getElementById("<%=iteracja+""+currentRow%>").submit();
             }
             
        </script>                                 
                                  
                                  <div class="row">
 
        <form id="<%=iteracja+""+currentRow%>" action="more" name="formMore" method="get"><a name="id" onclick="<%out.println("update" + iteracja +""+ currentRow + "()");%>"><div class="col-md-12 " style=" padding-left: 8%;padding-right: 8%;" >
        <div  class="card card-image" style="background-color:#00685c; min-height: 20%;height: 262px;width:262px;  opacity: 0.9;">
            <div class="text-white text-center py-12 px-12 my-12">
                <div>
                    <%int currentId=res.getInt("id_produktu");%>
                    <div id="products" class="item  col-xs-12 col-lg-12" >
                        <h5 id="mid"  style="max-width: 100%; text-align: center;" name="nazwa" class="card-title  mt-2 font-bold"  style=" font-size: 12px;padding-top: 5%">
                            <%if(res.getString("nazwa").length()>20)
                            {String shortenedName;
                            
                            shortenedName=(res.getString("nazwa").substring(0, 20)+"...");
                            out.println(shortenedName); %></h5><% 
                                
                            }else{%>
                            <% out.println(res.getString("nazwa")); %></h6><%}%>
                    
                                    <h8 id="mid" name="platforma" class="group inner list-group-item-heading" >
                                    <% out.println(res.getString("platforma"));%></h8>
                        <div class="thumbnail" >
                            <% String obrazek = res.getString("obraz");
                               StringTokenizer stringTokenizer = new StringTokenizer(obrazek, ", ");
                               if(stringTokenizer.hasMoreElements())
                               obrazek=stringTokenizer.nextToken();
                            %>
                            <img  src="<%=obrazek%>"/>
                         <input name="id" type="hidden" value="<%=currentId%>">
                            <div class="caption">
                                
                                
                                <div class="row" id="mid">
                                    
                                    <div class="col-xs-12 col-md-12">
                                          </a></form>
                                        <form  action="shoppingcart" name="formBuy" method="post">
                                            <button   name="btnBuy" class="btn btn-large btn-success "value="<%=res.getInt("id_produktu")%>" style="margin-left: 20px; margin-top:12px; text-align: center; font-size: 12px;" tabindex="4" <%if(res2next == true){%>>Dodaj do koszyka<%}else{%>disabled>Klucz niedostępny<%}%><br><p class="lead" style="font-size: 12px;margin-bottom: -4px">
                                                <% out.println((String.format("%.2f%n",Double.parseDouble(res.getString("cena"))))+"zł"); %></p></button></form>
                                    </div>                                 
                                </div>
                            </div>
                                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                          </div> 
</div>
                    
                    <% }conn.close();%>
</div>                            

                                    <hr class="featurette-divider" style="margin-left: -10px">
               
                                    
        <script>
            <%out.println("function " + "steam" + "()");%>{
            document.getElementById("grySteamForm").submit();}
            </script>
            <form id="grySteamForm" action="typ" name="formTyp" method="get">
                <a class="text-muted" onclick="steam()"><h3  style="font-weight: bold">Gry z platformy Steam <span  class="fa fa-angle-right" aria-hidden="true"></span></h3>
                            <input name="id" type="hidden" value="Gry z platformy Steam"> 
                            </a></form>
            <hr class="featurette-divider" style="margin-left: -10px">
            <div class="row">
            <%                    
                                  iteracja=0;
                                  currentRow = 3;
                                  conn = PolaczenieDB.getConnection();
                                  stat = conn.createStatement();
                                  data = "select * from produkt where platforma='Steam' order by random() limit 4";
                                  res = stat.executeQuery(data);
                                  stat2 = conn.createStatement();
                                  while(res.next()){
                                      data2 = "select p.id_produktu, count(k.id_produktu) as dostepnosc  from klucze k join produkt p on k.id_produktu=p.id_produktu where p.id_produktu = " + res.getInt("id_produktu") + " and k.czy_zuzyty = 'false' group by p.id_produktu;";                                  
                                      res2= stat2.executeQuery(data2);
                                      if(res2.next())
                                          res2next=true;
                                      else
                                          res2next=false;
                                      iteracja++;
                                  %>
                                   <script>
               

            <%out.println("function " + "update" + iteracja +""+ currentRow + "()");%> {
            document.getElementById("<%=iteracja+""+currentRow%>").submit();
             }
             
        </script>                                 
                                  
                                  <div class="row">
 
        <form id="<%=iteracja+""+currentRow%>" action="more" name="formMore" method="get"><a name="id" onclick="<%out.println("update" + iteracja +""+ currentRow + "()");%>"><div class="col-md-12 " style=" padding-left: 8%;padding-right: 8%;" >
        <div  class="card card-image" style="background-color:#00685c; min-height: 20%;height: 262px;width:262px;  opacity: 0.9;">
            <div class="text-white text-center py-12 px-12 my-12">
                <div>
                    <%int currentId=res.getInt("id_produktu");%>
                    <div id="products" class="item  col-xs-12 col-lg-12" >
                        <h5 id="mid"  style="max-width: 100%; text-align: center;" name="nazwa" class="card-title  mt-2 font-bold"  style=" font-size: 12px;padding-top: 5%">
                            <%if(res.getString("nazwa").length()>20)
                            {String shortenedName;
                            
                            shortenedName=(res.getString("nazwa").substring(0, 20)+"...");
                            out.println(shortenedName); %></h5><% 
                                
                            }else{%>
                            <% out.println(res.getString("nazwa")); %></h6><%}%>
                    
                                    <h8 id="mid" name="platforma" class="group inner list-group-item-heading" >
                                    <% out.println(res.getString("platforma"));%></h8>
                        <div class="thumbnail" >
                            <% String obrazek = res.getString("obraz");
                               StringTokenizer stringTokenizer = new StringTokenizer(obrazek, ", ");
                               if(stringTokenizer.hasMoreElements())
                               obrazek=stringTokenizer.nextToken();
                            %>
                            <img  src="<%=obrazek%>"/>
                         <input name="id" type="hidden" value="<%=currentId%>">
                            <div class="caption">
                                
                                
                                <div class="row" id="mid">
                                    
                                    <div class="col-xs-12 col-md-12">
                                          </a></form>
                                        <form  action="shoppingcart" name="formBuy" method="post">
                                            <button   name="btnBuy" class="btn btn-large btn-success "value="<%=res.getInt("id_produktu")%>" style="margin-left: 20px; margin-top:12px; text-align: center; font-size: 12px;" tabindex="4" <%if(res2next == true){%>>Dodaj do koszyka<%}else{%>disabled>Klucz niedostępny<%}%><br><p class="lead" style="font-size: 12px;margin-bottom: -4px">
                                                <% out.println((String.format("%.2f%n",Double.parseDouble(res.getString("cena"))))+"zł"); %></p></button></form>
                                    </div>                                 
                                </div>
                            </div>
                                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                          </div> 
</div>
                    
                    <% }conn.close();%>
</div> 

            <hr class="featurette-divider" style="margin-left: -10px">

        <script>
            <%out.println("function " + "gryunder40" + "()");%>{
            document.getElementById("gry40Form").submit();}
            </script>
            <form id="gry40Form" action="typ" name="formTyp" method="get">
                <a class="text-muted" onclick="gryunder40()"><h3  style="font-weight: bold">Gry poniżej 40zł <span  class="fa fa-angle-right" aria-hidden="true"></span></h3>
                            <input name="id" type="hidden" value="Gry poniżej 40zł"> 
                            </a></form>
            <hr class="featurette-divider" style="margin-left: -10px">
            <div class="row">
            <%                    
                                  iteracja=0;
                                  currentRow = 4;
                                  conn = PolaczenieDB.getConnection();
                                  stat = conn.createStatement();
                                  data = "select * from produkt where cena<=40 order by random() limit 4";
                                  res = stat.executeQuery(data);
                                  stat2 = conn.createStatement();
                                  while(res.next()){
                                      data2 = "select p.id_produktu, count(k.id_produktu) as dostepnosc  from klucze k join produkt p on k.id_produktu=p.id_produktu where p.id_produktu = " + res.getInt("id_produktu") + " and k.czy_zuzyty = 'false' group by p.id_produktu;";                                  
                                      res2= stat2.executeQuery(data2);
                                      if(res2.next())
                                          res2next=true;
                                      else
                                          res2next=false;
                                      iteracja++;
                                  %>
                                   <script>
               

            <%out.println("function " + "update" + iteracja +""+ currentRow + "()");%> {
            document.getElementById("<%=iteracja+""+currentRow%>").submit();
             }
             
        </script>                                 
                                  
                                  <div class="row">
 
        <form id="<%=iteracja+""+currentRow%>" action="more" name="formMore" method="get"><a name="id" onclick="<%out.println("update" + iteracja +""+ currentRow + "()");%>"><div class="col-md-12 " style=" padding-left: 8%;padding-right: 8%;" >
        <div  class="card card-image" style="background-color:#00685c; min-height: 20%;height: 262px;width:262px;  opacity: 0.9;">
            <div class="text-white text-center py-12 px-12 my-12">
                <div>
                    <%int currentId=res.getInt("id_produktu");%>
                    <div id="products" class="item  col-xs-12 col-lg-12" >
                        <h5 id="mid"  style="max-width: 100%; text-align: center;" name="nazwa" class="card-title  mt-2 font-bold"  style=" font-size: 12px;padding-top: 5%">
                            <%if(res.getString("nazwa").length()>20)
                            {String shortenedName;
                            
                            shortenedName=(res.getString("nazwa").substring(0, 20)+"...");
                            out.println(shortenedName); %></h5><% 
                                
                            }else{%>
                            <% out.println(res.getString("nazwa")); %></h6><%}%>
                    
                                    <h8 id="mid" name="platforma" class="group inner list-group-item-heading" >
                                    <% out.println(res.getString("platforma"));%></h8>
                        <div class="thumbnail" >
                            <% String obrazek = res.getString("obraz");
                               StringTokenizer stringTokenizer = new StringTokenizer(obrazek, ", ");
                               if(stringTokenizer.hasMoreElements())
                               obrazek=stringTokenizer.nextToken();
                            %>
                            <img  src="<%=obrazek%>"/>
                         <input name="id" type="hidden" value="<%=currentId%>">
                            <div class="caption">
                                
                                
                                <div class="row" id="mid">
                                    
                                    <div class="col-xs-12 col-md-12">
                                          </a></form>
                                        <form  action="shoppingcart" name="formBuy" method="post">
                                            <button   name="btnBuy" class="btn btn-large btn-success "value="<%=res.getInt("id_produktu")%>" style="margin-left: 20px; margin-top:12px; text-align: center; font-size: 12px;" tabindex="4" <%if(res2next == true){%>>Dodaj do koszyka<%}else{%>disabled>Klucz niedostępny<%}%><br><p class="lead" style="font-size: 12px;margin-bottom: -4px">
                                                <% out.println((String.format("%.2f%n",Double.parseDouble(res.getString("cena"))))+"zł"); %></p></button></form>
                                    </div>                                 
                                </div>
                            </div>
                                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                          </div> 
</div>
                    
                    <% }conn.close();%>
</div> 
            
            <!-- /END THE FEATURETTES -->
        </div>
        

            <footer class="footer">
            <div class="container">
                <span class="text-muted">Copyright &copy; 2018 Artemis.</span>
                <p class="pull-right" style="text-align: center; margin-top: 10px; font-size: 40px;"><a href="#"><span  class="pull-right fa fa-toggle-up text-muted" aria-hidden="true"></span></a></p>
                
            </div>
        </footer>

    </body>

</html>

 <!-- /.test -->