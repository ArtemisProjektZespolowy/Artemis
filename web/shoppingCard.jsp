

<%@page import="java.util.TreeMap"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.util.Currency"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="shopping.cart.Bean_ID"%>
<%@page import="shopping.cart.Bean_Ilosc"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="shopping.cart.Cart2"%>
<%@page import="src.PolaczenieDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="system.rejestracji.*"%>
<!DOCTYPE html>
<html lang="pl">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Koszyk</title>
        <link href="./css/koszyk.css" rel="stylesheet">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

        <!-- Custom styles for this template -->
        <link href="./css/register_sing_in.css" rel="stylesheet">

    </head>
    <!-- NAVBAR
    ================================================== -->

    <body onload="script();">
        <script type="text/javascript" src="//code.jquery.com/jquery-1.9.1.js"></script>
        <jsp:include page="header.jsp"/>

        <%
            Connection conn = PolaczenieDB.getConnection();
            Statement stat = conn.createStatement();
            Statement stat2 = conn.createStatement();
            ResultSet res = null;
            ResultSet res2 = null;
           

            double suma = 0;
            double cena = 0;

            String sumaFormat = "";
            String cenaJedFormat = "";
            String cenaFormat = "";
            String pl = "zł";
            DecimalFormat formatter = (DecimalFormat) NumberFormat.getCurrencyInstance(Locale.GERMANY);
            DecimalFormatSymbols symbol = new DecimalFormatSymbols(Locale.GERMANY);
            symbol.setCurrencySymbol(pl);
            formatter.setDecimalFormatSymbols(symbol);
        %>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <!-- Latest compiled and minified JavaScript -->
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>




                    <% 
                        
                        
                            Map<Bean_ID, Bean_Ilosc> koszyk = (Map<Bean_ID, Bean_Ilosc>) session.getAttribute("koszyk");
                            if (koszyk == null) {
                                 koszyk = new TreeMap<>();
                            }
                            if (koszyk.size() != 0) {%>
                            <div class="container" id="xd">
        <div class="container" >
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">

                    <%   
                        int iteracja = 0;
                        for (Object q : koszyk.keySet()) {
                            int id_productMap = (Integer) q;
//                            out.println(q);
                            String s = String.valueOf(koszyk.get(q));
                            int ilosc = 0;

                            ilosc = Integer.parseInt(s);

                            iteracja++;
                    %>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Produkt</th>
                                <th> </th>
                                <th style=" text-align: center;" >Ilość</th>
                                <th> </th>
                                <th class="text-center">Cena jedn.</th>
                                <th class="text-center">Cena</th>
                                <th> </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String data = "select * from produkt where id_produktu=" + id_productMap + "";

                                res = stat.executeQuery(data);
                                res.next();

                                String data2 = "select count(k.id_produktu) as dostepnosc  from klucze k join produkt p on k.id_produktu=p.id_produktu where  (p.id_produktu = " + id_productMap + " and czy_zuzyty = false)";

                                res2 = stat2.executeQuery(data2);
                                res2.next();

                                suma = suma + res.getDouble("cena") * ilosc;
                                sumaFormat = formatter.format(suma);

                                cena = res.getDouble("cena");
                                cenaFormat = formatter.format(cena);
                                cenaJedFormat = formatter.format(cena * ilosc);

                                session.setAttribute("sumOreder", suma);

                            %>
                            <tr>
                                <td class="td-space-1">
                                    <div class="media">
                                        <a class="thumbnail pull-left" href="#"> <img class="media-object" src="<%=res.getString("obraz")%>" style="width: 72px; height: 72px;"> </a>
                                        <div class="media-body">
                                            <h4 class="media-heading "><a href="#"><%=res.getString("nazwa")%></a></h4>
                                            <h5 class="media-heading"> by <a href="#"><%=res.getString("wydawca")%></a></h5>
                                            <span>Status: </span><%if (res2.getInt("dostepnosc") != 0) {%><span class="text-success"><strong>Dostępny - szt. <% out.println(res2.getInt("dostepnosc")); %> </strong></span><%} else {%><span class="text-danger"><strong>Niedostepny</strong></span><%}%>
                                        </div>
                                    </div></td>
                                    
                                     <td class="td-space-minus-plus">
                                         <form id="#" action="iloscproduktu" method="post">                             
                                        <button class="btn-info button-minus" id="#" name="minus" value="<%=res.getInt("id_produktu")%>">-</button>
                                    </form>
                                     </td>
                                     
                                <td class="td-space-2" style=" text-align: center;" >
                                    <script>
                                        <%out.println("function " + "update" + iteracja + "()");%> {
                                            document.getElementById("<%=iteracja%>").submit();
                                        }
                                    </script>

                                            
                                    

                                    <form  id="<%=iteracja%>" action="iloscproduktu" method="post">   
                                        <input  name="suppID" type="hidden" value="<%=res.getInt("id_produktu")%>" ></input>
                                        <input class="input-ilosc" type="text" id="number" name="inputUpdate"  value="<%out.print(ilosc);%>" onfocusout="<%out.println("update" + iteracja + "()");%>"></input>
                                    </form>

                                   
                                      
                                </td>
                                <td class="td-space-minus-plus">
                                    <form  id="#" action="iloscproduktu" method="post">  
                                        <button class="btn-info button-plus" id="#" name="plus"  value="<%=res.getInt("id_produktu")%>" >+</button>
                                    </form
                                </td>

                                <td class=" td-space-3"><strong><%out.println(cenaFormat);%></strong></td>
                                <td class="td-space-4"><strong><%out.println(cenaJedFormat);%></strong></td>


                        <form  action="deleteCard" method="post">
                            <td class="td-space-5"><button class=" btn btn-danger"  name="cardID" value="<%=res.getInt("id_produktu")%>"  onclick="deleteUser">Usuń</button></td>
                            <script src='//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>      
                        </form>
                        </tr>          
                        </tbody>
                    </table>
                    <%  }
                        res.close();
                        res2.close();
                        conn.close();%> 

                    <div class="container-fluid text-right">
                        <h3>Łącznie</h3>
                        <p class=""><h3><strong><%out.println(sumaFormat);%></strong></h3></p>
                    </div>
                    <div class="row-fluid" style="margin-bottom: 15%; ">

                        <a href="index.jsp" type="button" class="btn btn-warning">Kontynuuj zakupy</a>

                        <div class="pull-right ">
                            <form  action="platnosci" method="post">
                                <button  class="btn btn-default" name="platnosci" onclick="platnosci">Przejdz do płatności</button>
                            </form> 
                        </div>
                    </div>

                  
                </div>
            </div>
        </div>
</div>
                    
                    <% } else {
                            %>
                   <div class="body_1">
            <div class="wrapper">
                <div class="container_1">


                    <span class="fa fa-shopping-cart" style="font-size: 250px; align-content: center; color: white; text-align:center; "></span>
                    <br>
                    <p style="font-size: 28px; color: white; ">Twoj koszyk jest pusty :( </p>
                    <form name="" method="post" action="index.jsp" id="contactForm" novalidate>
                        <br>
                        <button type="submit" value="" class="btn btn-warning waves-effect" style="font-size: 16px; font-weight: 300;">Strona główna</button>
                    </form>
                </div>
            </div>
        </div>        
            <%
            }%>
    </body>
</html>