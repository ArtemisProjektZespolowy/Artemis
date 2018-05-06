
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="src.PolaczenieDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.TreeMap"%>
<%@page import="shopping.cart.Bean_Ilosc"%>
<%@page import="shopping.cart.Bean_ID"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                            <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Kategoria</a>
                        <ul class="dropdown-menu" role="menu">
 <%                   Connection conn = null;
                                  ArrayList<String> kategoriaArray = new ArrayList();
                                  int i=0;
                                  Statement stat = null;
                                  ResultSet res = null;
                                  conn = PolaczenieDB.getConnection();
                                  stat = conn.createStatement();
                                  String data = "select distinct kategoria from produkt order by kategoria;";
                                  res = stat.executeQuery(data);
                                  while(res.next()){
                                      kategoriaArray.add(res.getString("kategoria"));
                                  %>
        <script>
               

            <%out.println("function " + kategoriaArray.get(i)  + "()");%> {
            document.getElementById("<%=kategoriaArray.get(i)%>").submit();
             }
             
        </script>

                            <li> <form id="<%=kategoriaArray.get(i)%>" action="kategoria" name="formKategoria" method="get">
            <a class="nav-link" name="id" onclick="<%out.println(kategoriaArray.get(i)+ "()");%>"><input name="id" type="hidden" value="<%=kategoriaArray.get(i)%>"><%=kategoriaArray.get(i)%></a></form></li>
                        <%i++;}%>
                        </ul>
                    </li>
                        <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-6" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Platforma</a>
                        <ul class="dropdown-menu" role="menu">
 <%                               conn = null;
                                   Statement stat40= null;
                                   ResultSet res40 = null;
                                  ArrayList<String> platformaArray = new ArrayList();
                                  i=0;
                                  stat = null;
                                  res = null;
                                  conn = PolaczenieDB.getConnection();
                                  stat = conn.createStatement();
                                  data = "select distinct platforma, count(*) as wystapienia from produkt group by platforma order by wystapienia desc;";
                                  res = stat.executeQuery(data);
                                  while(res.next()){
                                      platformaArray.add(res.getString("platforma"));
                                  %>
        <script>
               

            <%out.println("function " + "platforma"+ i + "()");%> {
            document.getElementById("<%=platformaArray.get(i)%>").submit();
             }
             
        </script>

                            <li> <form id="<%=platformaArray.get(i)%>" action="platforma" name="formPlatforma" method="get">
            <a class="nav-link" name="id" onclick="<%out.println("platforma"+ i + "()");%>"><input name="id" type="hidden" value="<%=platformaArray.get(i)%>"><%=platformaArray.get(i)%></a></form></li>
                        <%i++;}conn.close();%>
                        </ul>
                    </li>
                    <script>
            <%out.println("function " + "nowości" + "()");%>{
            document.getElementById("nowościForm").submit();}
            </script>
                    <li class="nav-item">
                        
            <form id="nowościForm" action="typ" name="formTyp" method="get">
                <a class="nav-link" onclick="nowości()">Nowości<input name="id" type="hidden" value="Nowości"> </a></form>
                    </li>
         <% if (session.getAttribute("permissions") != null) {%>
                    <li class="nav-item">
                        <a class="nav-link" href="support.jsp">Kontakt</a>
                    </li>
                    <%} %>
               <% if (session.getAttribute("permissions") != null && (session.getAttribute("permissions").equals("Admin") || session.getAttribute("permissions").equals("Pracownik")) ) {%>	
                      </li>	
                        <li class="nav-item">	
                          <a class="nav-link" href="raports.jsp">Raporty</a>	
                  </li>	
                  <%}%>
                </ul>

               

                <ul class="s navbar-nav ml-auto nav-flex-icons">
                    
                         <li style="padding-right: 2%; padding-top: 1%;" class="nav-item">             	                   
                     <input id="search" class="form-control form-control-sm" type="text" placeholder="Wyszukaj" onkeyup="wyszukaj()">	
	
                   </li>
                    
                     <%
                    Map<Bean_ID, Bean_Ilosc> koszyk = (Map<Bean_ID, Bean_Ilosc>) session.getAttribute("koszyk");
                    if (koszyk == null) {
                        koszyk = new TreeMap<>();
                    }
                    %>
                    
                    <li class="space nav-item">

                        <a  href="shoppingCard.jsp" class="waves-effect waves-light fa-stack fa-1x has-badge" data-count="<%out.print(koszyk.size()); %>">
                            <i class="fa fa-shopping-cart fa-stack fa-inverse"></i>
                        </a>
                    </li>

                  


                    <% if (session.getAttribute("permissions") == null) {%>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Zarejestruj</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="sign_in.jsp">Zaloguj</a>
                    </li>
                    <%} else {%>
                          <%
                        conn = PolaczenieDB.getConnection();
                        stat = conn.createStatement();
          
                       res = null;
                       data = "select count(id_wiadomosci) as nowe_wiadomosci from poczta where (email_nadawcy='"+session.getAttribute("User")+"' and (status_nadawcy = false and status_odbiorcy = true))  or (email_odbiorcy='"+session.getAttribute("User")+"' and (status_nadawcy = true and status_odbiorcy = false))";
                       res = stat.executeQuery(data);
                       res.next();
                        %>
                    <li class="nav-item">

                        <a href="message.jsp"  class=" waves-effect waves-light fa-stack fa-1x has-badge" data-count="<%=res.getInt("nowe_wiadomosci") %>">
                            <i class="fa fa-envelope fa-stack fa-inverse"></i>
                        </a>
                    </li>
                    <%res.close(); conn.close(); %>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="#"><%="Witaj " + session.getAttribute("User")%></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Konto</a>
                        <ul class="dropdown-menu" style="transform: translate(-50%, 0%)" role="menu">
                            <li><a href="myaccount.jsp">Moje konto</a></li>
                            <li><a href="myorders.jsp">Moje zamówienia</a></li>
                            <li><a href="changemydata.jsp">Zmiana danych</a></li>
                            <li><a href="changemypassword.jsp">Zmiana hasła</a></li>
                            <li class="nav-item">
                        <a class="nav-link" href="logout">Wyloguj</a>
                    </li>    
                        </ul>
                    </li>
                    
                    <%}%>
                </ul>
            </div>
        </nav>
    </header>
                <!--                                                          <div class="close1">-->
                                    <div id="searchModal" class="searchModal">
                                         <table style="margin-top: 3%;"  id="searchTable" class="table table-striped">
                                  <thead>
                                      <tr>
                                          <th></th>
                                          <th>Gra</th>
                                          <th>Platforma</th>
                                          <th>Wydawca</th>
                                          <th>Data wydania</th>
                                          <th>Cena</th>

                                      </tr>
                                  </thead>
                                  <%
                                    conn = PolaczenieDB.getConnection();    
                                    stat40 = conn.createStatement();
                                    String data10 = "select id_produktu, obraz, nazwa, platforma, wydawca, data_wydania, cena from produkt order by nazwa";
                                        res40 = stat40.executeQuery(data10);
                                        
                                         int iteracjaS = 0;
                                        while (res40.next()) {
                                           
                                           
                                  %>
                                     <script>

                            <%out.println("function " + "updateS" + iteracjaS + "()");%> {
                                document.getElementById("<%=iteracjaS%>").submit();
                            }
                        </script>
                         <% String obrazek = res40.getString("obraz");
                               StringTokenizer stringTokenizer = new StringTokenizer(obrazek, ", ");
                               if(stringTokenizer.hasMoreElements())
                               obrazek=stringTokenizer.nextToken();
                            %>
                                  <form id="<%=iteracjaS%>" action="more" name="formMore" method="get">
                                  <tbody onclick="<%out.println("updateS" + iteracjaS + "()");%>" >  
                                      <tr  >     
                                          
                                          <td  style="font-weight: bold;"><img  src="<%=obrazek%>"/></td>
                                          <td  style="font-weight: bold; padding-top: 7vh;"><%=res40.getString("nazwa")%></td>
                                          <td  style="font-weight: bold;padding-top: 7vh;"><%=res40.getString("platforma")%></td>
                                          <td  style="font-weight: bold;padding-top: 7vh;"><%=res40.getString("wydawca")%></td>
                                          <td  style="font-weight: bold;padding-top: 7vh;"><%=res40.getString("data_wydania")%></td>
                                          <td style="font-weight: bold;padding-top: 7vh;"><%=res40.getFloat("cena")%>zł</td>
                                          <input name="id" type="hidden" value="<%=res40.getInt("id_produktu")%>">
                                    </td>
                                      </tr>
                                  </tbody>
                                  </form>
                                  <%  iteracjaS++;} stat40.close(); res40.close(); conn.close();  %> 
                              </table>
<!--                                    </div>-->
                                
                            
                            </div>
                              
                              
                                <script>
                var searchModalClass = document.getElementById('searchModal');

                var btn = document.getElementById("search");
            
                var span = document.getElementsByClassName("close1")[0];
                btn.onkeyup = function () {
                    searchModalClass.style.display = "block";
                }
        
                
                btn.onkeyup = function () {
                    if(btn.is)
               
                }
                window.onclick = function (event) {
                    if (event.target == searchModalClass) {
                        searchModalClass.style.display = "none";
                    }
                     
                }
            </script>
                                        <script>
                                        $( function() {
                                          var availableTags = [
                                                  <%
                conn = PolaczenieDB.getConnection();    
                stat40 = conn.createStatement();
                String data40 = "select nazwa, wydawca from produkt order by nazwa";
                    res40 = stat40.executeQuery(data40);
                    while (res40.next()) {
                         out.print('"' + res40.getString("nazwa") + '"' + ",");
                    }
                             conn.close(); %>
                                          ];
                                          $( "#searchTable" ).autocomplete({
                                            source: availableTags
                                          });
                                        } );
                                        </script>
                                        
                                        <script>
                             
                                  
                                    $("#search").keyup(function(){
                                       
                                       if($('#search').val() == ''){
                                            $('#searchModal').hide();
                                           }else{$('#searchModal').show();}
                                          });

                                        </script>
                                        
                                                                <script>
                                    
                      function wyszukaj() {
                          
                        var input, filter, table, tr, td, i;
                        input = document.getElementById("search");
                        filter = input.value.toUpperCase();
                        table = document.getElementById("searchTable");
                        tr = table.getElementsByTagName("tr");
                        for (i = 0; i < tr.length; i++) {
                          td = tr[i].getElementsByTagName("td")[1];
                          if (td) {
                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                              tr[i].style.display = "";
                            } else {
                              tr[i].style.display = "none";
                            }
                          }       
                        }
                      }
                       
                      </script> 
                               
          <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <script src="https://mdbootstrap.com/previews/docs/latest/js/bootstrap.min.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/mdb.min.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/jarallax.js"></script>
    <script>
    new WOW().init();
</script> 