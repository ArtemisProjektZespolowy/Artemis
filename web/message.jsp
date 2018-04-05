

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
        <title>Wiadomosci</title>
        <link href="./css/message.css" rel="stylesheet">

    </head>
    <!-- NAVBAR
    ================================================== -->

    <body class="body">


        <jsp:include page="header.jsp"/>

        <%
            Connection conn = PolaczenieDB.getConnection();
            Statement stat = conn.createStatement();
            Statement stat2 = conn.createStatement();
            Statement stat3 = conn.createStatement();
            Statement glownaStat= conn.createStatement();
            Statement spolecznoscStat = conn.createStatement();
            Statement informacjaStat = conn.createStatement();
            Statement supportStat = conn.createStatement();
            ResultSet res = null;
            ResultSet res2 = null;
            ResultSet res3 = null;
            ResultSet glownaRes = null;
            ResultSet spolecznoscRes = null;
            ResultSet informacjaRes = null;
            ResultSet supportRes = null;
            
            
            String klient = String.valueOf(session.getAttribute("User"));
            
                  
       
            
      

            int iteracja = 0;
            

        %>
        
        
       <a  href="shoppingCard.jsp" class="waves-effect waves-light fa-stack fa-1x has-badge" data-count="4">
                            <i class="fa fa-shopping-cart fa-stack fa-inverse"></i>
                        </a>

        <div class="container ">
           <form action="obslugaWiadomosci" method="post" >
                <button class="btn btn-danger" name="widok" value="NowaWiadomosc">Nowa Wiadomość</button>
            
            </form>
            <div class="panel-body">
                <div class="form-group">
                    <div class="btn-group btn-group-lg" style="width: 100%;">
                           <%
                       String dataG = "select count(id_wiadomosci) as nowe_G from poczta where (((email_nadawcy='"+session.getAttribute("User")+"' and (status_nadawcy = false and status_odbiorcy = true))  or ((email_odbiorcy='"+session.getAttribute("User")+"' and (status_nadawcy = true and status_odbiorcy = false))) and (typ_wiadomosci='glowna')))";
                       glownaRes = glownaStat.executeQuery(dataG);
                       glownaRes.next();
                        %>
                         
                        <form action="obslugaWiadomosci" method="post" style="width: 100%;">
                        <button class="btn btn-primary" style="width: 100%;" name="widok2" value="glowna">Główna<%if(glownaRes.getInt("nowe_G") != 0 ){%><i class="fa-stack_2  has-badge" data-count="<%=glownaRes.getInt("nowe_G") %>"></i><%}%></button>
                        </form>
                       
                        <%glownaRes.close(); %>
                            <%
                       String dataS = "select count(id_wiadomosci) as nowe_S from poczta where (((email_nadawcy='"+session.getAttribute("User")+"' and (status_nadawcy = false and status_odbiorcy = true))  or (email_odbiorcy='"+session.getAttribute("User")+"' and (status_nadawcy = true and status_odbiorcy = false))) and (typ_wiadomosci='spolecznosc'))";
                       spolecznoscRes = spolecznoscStat.executeQuery(dataS);
                       spolecznoscRes.next();
                        %>
                        <form action="obslugaWiadomosci" method="post" style="width: 100%;">
                        <button class="btn btn-primary"style="width: 100%;" name="widok2" value="spolecznosc">Społeczność<%if(spolecznoscRes.getInt("nowe_S") != 0 ){%><i class="fa-stack_2  has-badge" data-count="<%=spolecznoscRes.getInt("nowe_S") %>"></i><%}%></button>
                        </form>
                         <%spolecznoscRes.close(); %>
                               <%
                       String dataI = "select count(id_wiadomosci) as nowe_I from poczta where (((email_nadawcy='"+session.getAttribute("User")+"' and (status_nadawcy = false and status_odbiorcy = true))  or (email_odbiorcy='"+session.getAttribute("User")+"' and (status_nadawcy = true and status_odbiorcy = false))) and (typ_wiadomosci='informacje'))";
                       informacjaRes = informacjaStat.executeQuery(dataI);
                       informacjaRes.next();
                        %>
                         <form action="obslugaWiadomosci" method="post" style="width: 100%;">
                        <button class="btn btn-primary"style="width: 100%;" name="widok2" value="informacje">Informacje<%if(informacjaRes.getInt("nowe_I") != 0 ){%><i class="fa-stack_2  has-badge" data-count="<%=informacjaRes.getInt("nowe_I") %>"></i><%}%></button>
                         </form>
                          <%informacjaRes.close(); %>
                                 <%
                       String dataSupp = "select count(id_wiadomosci) as nowe_Supp from poczta where (((email_nadawcy='"+session.getAttribute("User")+"' and (status_nadawcy = false and status_odbiorcy = true))  or (email_odbiorcy='"+session.getAttribute("User")+"' and (status_nadawcy = true and status_odbiorcy = false))) and (typ_wiadomosci='support'))";
                       supportRes = supportStat.executeQuery(dataSupp);
                       supportRes.next();
                        %>
                        <form action="obslugaWiadomosci" method="post" style="width: 100%;">
                        <button class="btn btn-primary"style="width: 100%;" name="widok2"value="support">Support<%if(supportRes.getInt("nowe_Supp") != 0 ){%><i class="fa-stack_2  has-badge" data-count="<%=supportRes.getInt("nowe_Supp") %>"></i><%}%></button>
                        </form>
                         <%supportRes.close(); %>
                    </div>
                    <% if(request.getAttribute("KontrolerWiodku")== null){%>
                    
    <%        
            if(session.getAttribute("ranga").equals("User")|| session.getAttribute("ranga").equals("Pracownik")){
                if(session.getAttribute("typ_wiadomosci") == null){
                    session.setAttribute("typ_wiadomosci", "glowna");
                }
                        String data = "select tytul, id_wiadomosci, status_nadawcy, status_odbiorcy, email_nadawcy, email_odbiorcy, status_wiadomosci  from poczta where (email_nadawcy='"+session.getAttribute("User")+"' or email_odbiorcy='"+session.getAttribute("User")+"') and (typ_wiadomosci='"+session.getAttribute("typ_wiadomosci")+"') ";
                  res = stat.executeQuery(data);
            }
            else{
                out.println("ERROR");
            }
     

            while (res.next()) {
                
                iteracja++;
               
               
        %>
      
            
       
       
        
        <script>
               
            <%out.println("function " + "update" + iteracja + "()");%> {
            document.getElementById("<%=iteracja%>").submit();
             }
        </script>
        
        
        <form id="<%=iteracja%>" action="obslugaWiadomosci" method="post" >
      
                    <ul  class="list-group list-group-mine  ">
                        <li onclick="<%out.println("update" + iteracja + "()");%>" class="list-group-item "><%=res.getString("tytul") %><span class="space" >Nr.wiad :  <%=res.getString("id_wiadomosci") %></span>
                          
                            <%if(res.getBoolean("status_wiadomosci") == true ){   
                             %>
                             <span class="badge badge-pill black">Zgloszenie zostało zamknięte przez support</span>
                            <%}
                              else if((res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == false && res.getBoolean("status_odbiorcy") == true)){
                              %>
                              <span class="badge badge-pill green">Nowa odpowiedz NAD</span>
                              <%}else if((res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == true && res.getBoolean("status_odbiorcy") == true)){
                              %>
                              <span class="badge badge-pill orange">Odbiorca przeczytal wiadomosc NAD</span>
                              <%}else if((res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == false && res.getBoolean("status_odbiorcy") == false)){
                              %>
                              <span class="badge badge-pill red">Przeczytana NAD</span>
                              <%}else if((res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == true && res.getBoolean("status_odbiorcy") == false)){
                              %>
                              <span class="badge badge-pill pink">Wiadomość wysłana NAD</span>
                              <%} else if((!res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == true && res.getBoolean("status_odbiorcy") == false)){
                              %>
                              <span class="badge badge-pill green">Nowa wiadomosć ODB</span>
                              <%}else if(!(res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == false && res.getBoolean("status_odbiorcy") == true)){
                              %>
                              <span class="badge badge-pill pink">Odpowiedź wyslana ODB</span>
                              <%}else if(!(res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == true && res.getBoolean("status_odbiorcy") == true)){
                              %>
                              <span class="badge badge-pill blue">Przeczytana ODB</span>
                              <%}else if(!(res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == false && res.getBoolean("status_odbiorcy") == false)){
                              %>
                              <span class="badge badge-pill red">Odbiorca przeczytal wiadomosc ODB</span>
                              <%}  
                           
                            %>
                           
                        </li>
                     
              
                </ul>
                           
                            <input name="id_wiadomosci" type="hidden" value="<%=res.getInt("id_wiadomosci")%>" ></input>
                            <input name="widok" type="hidden"  value="OknoWiadomosci" ></input>
                          
        </form>    
                     
                      <%} res.close(); %> 
                              <%}else if(request.getAttribute("KontrolerWiodku").equals("otwarcie_wiadomosci")){%>
                              <div class="container-fluid wrap" style="background-color: #eaeaea; height: 400px; ">
                               
                                       <aside>
                              
                              <%
                               String data2 = "select p.email_nadawcy, p.status_wiadomosci, bw.id_wiadomosci, bw.email_nadawcy_k, bw.email_odbiorcy_k, bw.data_wyslania, bw.tresc_wiadomosci from poczta p join baza_wiadomosci bw on p.id_wiadomosci=bw.id_wiadomosci where p.id_wiadomosci="+request.getAttribute("id_wiadomosci")+"";
                                    res2 = stat2.executeQuery(data2);
                                   while(res2.next()) {
                              %>
                              <p>Wyspłana przez: &nbsp;<%=res2.getString("email_nadawcy_k")%> do <%=res2.getString("email_odbiorcy_k")%> </p>                              
                              <%=res2.getString("data_wyslania") %>
                              <p></p>
                              <%=res2.getString("tresc_wiadomosci")%>
                              <p></p>
                         
                                <form action="obslugaWiadomosci" method="post" >
                                    <%if(session.getAttribute("User").equals(res2.getString("email_nadawcy"))){%>
                                    <input name="email_odbiorcy" type="hidden" value="<%=res2.getString("email_odbiorcy_k")%>"></input>
                                    <%}else{%>
                                       <input name="email_odbiorcy" type="hidden" value="<%=res2.getString("email_nadawcy_k")%>"></input>
                                       <% }%>
                                
                                <input name="id_wiadomosci" type="hidden" value="<%=res2.getInt("id_wiadomosci")%>" ></input>
                            <%}  %>
                             </aside>
                            
                            </div> 
               
                                
                                    
                                <%
                                    String data3 = "select status_wiadomosci from poczta where id_wiadomosci="+request.getAttribute("id_wiadomosci")+"";
                                    res3 = stat3.executeQuery(data3);
                                   res3.next();
                              %>
                              <%if(res3.getBoolean("status_wiadomosci") == true){%>
                              <textarea disabled="true" rows="2"  style="width: 100%" placeholder="Nie można odpowiadać na zamknięte zgłoszenia." name="text_odpowedzi"></textarea>
                                 <button disabled="true" class="btn btn-danger" name="widok" value="wyslijOdpowiedz" >Odpowiedz</button>
                                 
                              <%}
                                else{%>
                                     <textarea rows="2"  style="width: 100%" placeholder="Odpowiedź..." name="text_odpowedzi"></textarea>
                                 <button class="btn btn-success" name="widok" value="wyslijOdpowiedz" >Odpowiedz</button>
                            
                                <%} res3.close(); stat3.close(); conn.close(); %>
                                   
                                
                                
                               </form>
                            <%}else if(request.getAttribute("KontrolerWiodku").equals("nw")){%>
                            <div class="container-fluid" style="background-color: #eaeaea; height: 400px; ">
                                <form action="obslugaWiadomosci" method="post" >
                                    <input  style="width: 100%" type="text" name="tytul" value=""  placeholder="podaj tytuł"></input>
                                    <p></p>
                                    od<input type="text" disabled="true" value="<%out.print(session.getAttribute("User"));%>"></input>
                                    do<input  type="text" name="email_odbiorcy" value=""  placeholder="podaj email"></input>
                                    <textarea rows="2"  style="width: 100%" placeholder="Wiadomość..." name="text_wiadomosci"></textarea>
                                    
                                    <button class="btn btn-success" name="widok" value="wyslijWiadomosc" >Wyślij</button>
                                      
                                       
                                                  
                                    
                                    
                       </form>
                               </div>
        <% }%>
          </div>
            </div>
        </div>


    </body>
</html>