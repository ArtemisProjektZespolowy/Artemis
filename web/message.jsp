

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
              <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/holder/2.4.0/holder.js"></script>


        <jsp:include page="header.jsp"/>

        <%
            Connection conn = PolaczenieDB.getConnection();
            Statement stat = conn.createStatement();
            Statement stat2 = conn.createStatement();
            Statement stat3 = conn.createStatement();
            Statement glownaStat = conn.createStatement();
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

            <%if (session.getAttribute("ranga").equals("User")) {%>
            <form action="obslugaWiadomosci" method="post" >
                <button  id="btnFA" class="btn btn-primary" name="widok" value="NowaWiadomosc">Nowa Wiadomość <i class="fa fa-envelope"></i></button>
            </form>
            <%} else if (session.getAttribute("ranga").equals("Pracownik")) {%>
            <form action="obslugaPracownika" method="post" >
                <button  id="btnFA" class="btn btn-primary" name="widok" value="NowaWiadomosc">Nowa Wiadomość <i class="fa fa-envelope"></i></button>
            </form>
            <%} else if (session.getAttribute("ranga").equals("Admin")) {%>
            <form action="obslugaPracownika" method="post" >
                <button  id="btnFA" class="btn btn-primary" name="widok" value="NowaWiadomosc">Nowa Wiadomość <i class="fa fa-envelope"></i></button>
            </form>
            <%}%>




            <div class="panel-body">
                <div class="form-group">
                    <div class="btn-group btn-group-lg" style="width: 100%;">
                        <%
                            String dataG = "select count(id_wiadomosci) as nowe_G from poczta where (((email_nadawcy='" + session.getAttribute("User") + "' and (status_nadawcy = false and status_odbiorcy = true))  or (email_odbiorcy='" + session.getAttribute("User") + "' and (status_nadawcy = true and status_odbiorcy = false))) and (typ_wiadomosci='glowna'))";
                            glownaRes = glownaStat.executeQuery(dataG);
                            glownaRes.next();
                        %>

                        <form action="obslugaWiadomosci" method="post" style="width: 100%;">
                            <button class="btn btn waves-effect border border-primary" style="width: 100%;" name="widok2" value="glowna">Główna<%if (glownaRes.getInt("nowe_G") != 0) {%><i class="fa-stack_2  has-badge" data-count="<%=glownaRes.getInt("nowe_G")%>"></i><%}%></button>
                        </form>

                        <%glownaRes.close(); %>
                        <%
                            String dataS = "select count(id_wiadomosci) as nowe_S from poczta where (((email_nadawcy='" + session.getAttribute("User") + "' and (status_nadawcy = false and status_odbiorcy = true))  or (email_odbiorcy='" + session.getAttribute("User") + "' and (status_nadawcy = true and status_odbiorcy = false))) and (typ_wiadomosci='spolecznosc'))";
                            spolecznoscRes = spolecznoscStat.executeQuery(dataS);
                            spolecznoscRes.next();
                        %>
                        <form action="obslugaWiadomosci" method="post" style="width: 100%;">
                            <button class="btn btn waves-effect border border-success" style="width: 100%;" name="widok2" value="spolecznosc">Społeczność<%if (spolecznoscRes.getInt("nowe_S") != 0) {%><i class="fa-stack_2  has-badge" data-count="<%=spolecznoscRes.getInt("nowe_S")%>"></i><%}%></button>
                        </form>
                        <%spolecznoscRes.close(); %>
                        <%
                            String dataI = "select count(id_wiadomosci) as nowe_I from poczta where (((email_nadawcy='" + session.getAttribute("User") + "' and (status_nadawcy = false and status_odbiorcy = true))  or (email_odbiorcy='" + session.getAttribute("User") + "' and (status_nadawcy = true and status_odbiorcy = false))) and (typ_wiadomosci='informacje'))";
                            informacjaRes = informacjaStat.executeQuery(dataI);
                            informacjaRes.next();
                        %>
                        <form action="obslugaWiadomosci" method="post" style="width: 100%;">
                            <button class="btn btn waves-effect border border-warning" style="width: 100%;" name="widok2" value="informacje">Informacje<%if (informacjaRes.getInt("nowe_I") != 0) {%><i class="fa-stack_2  has-badge" data-count="<%=informacjaRes.getInt("nowe_I")%>"></i><%}%></button>
                        </form>
                        <%informacjaRes.close(); %>
                        <%
                            String dataSupp = "select count(id_wiadomosci) as nowe_Supp from poczta where (((email_nadawcy='" + session.getAttribute("User") + "' and (status_nadawcy = false and status_odbiorcy = true))  or (email_odbiorcy='" + session.getAttribute("User") + "' and (status_nadawcy = true and status_odbiorcy = false))) and (typ_wiadomosci='support'))";
                            supportRes = supportStat.executeQuery(dataSupp);
                            supportRes.next();
                        %>
                        <form action="obslugaWiadomosci" method="post" style="width: 100%;">
                            <button class="btn btn waves-effect border border-info" style="width: 100%;" name="widok2"value="support">Support<%if (supportRes.getInt("nowe_Supp") != 0) {%><i class="fa-stack_2  has-badge" data-count="<%=supportRes.getInt("nowe_Supp")%>"></i><%}%></button>
                        </form>
                        <%supportRes.close(); %>
                    </div>



                    <% if (request.getAttribute("KontrolerWiodku") == null) {%>
                    <div class="scrollpane">
                        <%
                            if (session.getAttribute("ranga").equals("User") || session.getAttribute("ranga").equals("Pracownik") || session.getAttribute("ranga").equals("Admin")) {
                                if (session.getAttribute("typ_wiadomosci") == null) {
                                    session.setAttribute("typ_wiadomosci", "glowna");
                                }
                                String data = "select tytul, id_wiadomosci, status_nadawcy, status_odbiorcy, email_nadawcy, email_odbiorcy, status_wiadomosci  from poczta where (email_nadawcy='" + session.getAttribute("User") + "' or email_odbiorcy='" + session.getAttribute("User") + "') and (typ_wiadomosci='" + session.getAttribute("typ_wiadomosci") + "') ";
                                res = stat.executeQuery(data);
                            } else {
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
                                <li onclick="<%out.println("update" + iteracja + "()");%>" class="list-group-item "><%=res.getString("tytul")%><span class="space" >Nr.wiad :  <%=res.getString("id_wiadomosci")%></span>


                                    <%if ((res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == false && res.getBoolean("status_odbiorcy") == true)) {
                                    %>
                                    <span class="badge badge-pill green">Nowa odpowiedz NAD</span>
                                    <%} else if ((res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == true && res.getBoolean("status_odbiorcy") == true)) {
                                    %>
                                    <span class="badge badge-pill orange">Odbiorca przeczytal wiadomosc NAD</span>
                                    <%} else if ((res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == false && res.getBoolean("status_odbiorcy") == false)) {
                                    %>
                                    <span class="badge badge-pill red">Przeczytana NAD</span>
                                    <%} else if ((res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == true && res.getBoolean("status_odbiorcy") == false)) {
                                    %>
                                    <span class="badge badge-pill pink">Wiadomość wysłana NAD</span>
                                    <%} else if ((!res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == true && res.getBoolean("status_odbiorcy") == false)) {
                                    %>
                                    <span class="badge badge-pill green">Nowa wiadomosć ODB</span>
                                    <%} else if (!(res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == false && res.getBoolean("status_odbiorcy") == true)) {
                                    %>
                                    <span class="badge badge-pill pink">Odpowiedź wyslana ODB</span>
                                    <%} else if (!(res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == true && res.getBoolean("status_odbiorcy") == true)) {
                                    %>
                                    <span class="badge badge-pill blue">Przeczytana ODB</span>
                                    <%} else if (!(res.getString("email_nadawcy").equals(klient)) && (res.getBoolean("status_nadawcy") == false && res.getBoolean("status_odbiorcy") == false)) {
                                    %>
                                    <span class="badge badge-pill red">Odbiorca przeczytal wiadomosc ODB</span>
                                    <%}

                                    %>
                                    <%if (res.getBoolean("status_wiadomosci") == true) {
                                    %>
                                    <span class="badge badge-pill black">Wiadomość zamknięta</span>
                                    <%}%>

                                </li>


                            </ul>

                            <input name="id_wiadomosci" type="hidden" value="<%=res.getInt("id_wiadomosci")%>" ></input>
                            <input name="widok" type="hidden"  value="OknoWiadomosci" ></input>

                        </form>    

                        <%}
                          res.close(); %> 
                    </div>  
                    <%} else if (request.getAttribute("KontrolerWiodku").equals("otwarcie_wiadomosci")) {%>


                    <div class="container-fluid wrap bgOtwarciewiadomosci">

                        <div class="scrollpaneOW" style="width: 100%; margin-top: 0.1%;">

                            <%
                                int iteWiad = 0;
                                String data2 = "select p.email_nadawcy, p.status_wiadomosci, bw.id_wiadomosci, bw.email_nadawcy_k, bw.email_odbiorcy_k, bw.data_wyslania, bw.tresc_wiadomosci from poczta p join baza_wiadomosci bw on p.id_wiadomosci=bw.id_wiadomosci where p.id_wiadomosci=" + request.getAttribute("id_wiadomosci") + "";
                                res2 = stat2.executeQuery(data2);
                                while (res2.next()) {
                                    iteWiad++;
                            %>
                            <ul  class="list-group list-group-mine list-group-mine2">
                                <li  class="list-group-item list-group-item2"data-toggle="collapse" data-target="#<%=iteWiad%>" >Wysłana przez: &nbsp;<%=res2.getString("email_nadawcy_k")%> do <%=res2.getString("email_odbiorcy_k")%>&nbsp;&nbsp; Data wysłania:                               
                                    <%=res2.getString("data_wyslania")%>
                                </li>
                                <div id="<%=iteWiad%>" class="collapse">
                                    <li  class=" list-group-item3"><%=res2.getString("tresc_wiadomosci")%></li
                                </div>
                            </ul>



                            <form action="obslugaWiadomosci" method="post" >
                                <%if (session.getAttribute("User").equals(res2.getString("email_nadawcy"))) {%>
                                <input name="email_odbiorcy" type="hidden" value="<%=res2.getString("email_odbiorcy_k")%>"></input>
                                <%} else {%>
                                <input name="email_odbiorcy" type="hidden" value="<%=res2.getString("email_nadawcy_k")%>"></input>
                                <% }%>

                                <input name="id_wiadomosci" type="hidden" value="<%=res2.getInt("id_wiadomosci")%>" ></input>

                                <%}  %>

                                <br>
                                </div>                          
                                </div>  
                                <%
                                    String data3 = "select status_wiadomosci from poczta where id_wiadomosci=" + request.getAttribute("id_wiadomosci") + "";
                                    res3 = stat3.executeQuery(data3);
                                    res3.next();
                                %>
                                <%if (res3.getBoolean("status_wiadomosci") == true) {%>
                                <textarea class="form-control border border-primary"  disabled="true" rows="2"  style="width: 100%" placeholder="Nie można odpowiadać na zamknięte wiadomosći." name="text_odpowedzi"></textarea>
                                <button disabled="true" class="btn btn-danger" name="widok" value="wyslijOdpowiedz" >Odpowiedz</button>

                                <%if (session.getAttribute("ranga").equals("Pracownik")) {%>
                                <button class="btn btn-deep-orange" name="widok" value="otwozZgloszenie" >Otwóż zgłoszenie</button>
                                <%} else if (session.getAttribute("ranga").equals("Admin")) {%>
                                <button class="btn btn-deep-orange" name="widok" value="otwozZgloszenie" >Otwóż zgłoszenie</button>
                                <%}%>
                                <%} else if (res3.getBoolean("status_wiadomosci") == false) {%>

                                <textarea rows="3" class="form-control border border-primary" style="width: 100%" placeholder="Odpowiedź..." name="text_odpowedzi" required></textarea>

                                <%if (session.getAttribute("ranga").equals("User")) {%>                    
                                <button class="btn btn-dark-green waves-effect" name="widok" value="wyslijOdpowiedz" >Odpowiedz</button>
                                <%} else if (session.getAttribute("ranga").equals("Pracownik")) {%>
                                <button class="btn btn-dark-green waves-effect" name="widok" value="wyslijOdpowiedz" >Odpowiedz</button>
                                <button class="btn btn-elegant waves-effect" name="widok" value="zamknijZgloszenie" >Zamknij zgłoszenie</button>
                                <%} else if (session.getAttribute("ranga").equals("Admin")) {%>
                                <button class="btn btn-dark-green waves-effect" name="widok" value="wyslijOdpowiedz" >Odpowiedz</button>
                                <button class="btn btn-elegant waves-effect" name="widok" value="zamknijZgloszenie" >Zamknij zgłoszenie</button>
                                <%}%>
                                <%}
                                    res3.close();
                                    stat3.close();
                                    conn.close(); %>

                            </form>
                            <%} else if (request.getAttribute("KontrolerWiodku").equals("nw")) {%>
                            <script>

$(document).ready(function () {
$('.mdb-select').material_select();
});

                            </script>

                            <div class="container-fluid wrap bgNowaWiadomosc" style="width: 100%; height: 100%;">


                                <%if (session.getAttribute("ranga").equals("User")) {%>

                                <div class="scrollpaneNW" style="width: 100%; height: 100%; margin-top: 0.1%;">
                                    <form action="obslugaWiadomosci" method="post" >
                                        <br>

                                        <div class="row" style="margin-left: 0.5%">
                                            <div class="md-form form-lg">
                                                <input class="form-control" id="qwe" type="text" disabled="true" value="<%out.print(session.getAttribute("User"));%>"></input>
                                                <label for="qwe">od</label>
                                            </div>
                                            <div class="md-form form-lg " >
                                                <input   class="form-control" id="qwe1" type="text" name="email_odbiorcy" value=""  placeholder="podaj email" required></input>
                                                <label for="qwe1">do</label>
                                            </div>

                                        </div>
                                        <p></p>
                                        <div class="md-form ">
                                            <input  class="form-control" id="qwe2" style="width: 99%" type="text" name="tytul" value="" required></input>
                                            <label for="qwe2">Tytuł wiadomości</label>
                                        </div>

                                        <textarea rows="2" class="form-control border border-primary"  style="width: 99%; margin-top: 2.5%;" placeholder="Wiadomość..." name="text_wiadomosci"></textarea>
                                        <button class="btn btn-dark-green" name="widok" value="wyslijWiadomosc" >Wyślij</button>
                                    </form>
                                </div>
                                <%} else if (session.getAttribute("ranga").equals("Pracownik")) {%>
                                <div class="scrollpaneNW" style="width: 100%; height: 100%; margin-top: 0.1%;">
                                    <form action="obslugaPracownika" method="post" >
                                        <div class="md-form" style="width: 99%">
                                            <select name="typ_wiadomosci"  class="browser-default md-textarea form-control"  required=> 
                                                <option value="">Typ wiadomosci</option>
                                                <option value="glowna" ddata-icon="" >Głowna</option>
                                                <option value="spolecznosc" data-fa-icon="" class="rounded-circle">Społeczność</option>
                                                <option value="informacje" data-icon="" class="rounded-circle">Informacje</option>
                                                <option value="support" data-icon="" class="rounded-circle">Support</option>
                                            </select>
                                        </div>

                                        <div class="row" style="margin-top: 3%;">
                                            <div class="form-check">
                                                <input name="toAll" value="tak" type="checkbox" class="form-check-input" id="checkbox100">
                                                <label class="form-check-label" for="checkbox100">Wyślij do wszystkich klientów</label>
                                            </div>
                                            <div class="form-check">
                                                <input name="zablokujWiadomosc" value="tak" type="checkbox" class="form-check-input" id="2">
                                                <label class="form-check-label" for="2">Zablokuj wiadomość</label>
                                            </div>
                                        </div>


                                        <br>

                                        <div class="row" style="margin-left: 0.5%">
                                            <div class="md-form form-lg">
                                                <input class="form-control" id="qwe" type="text" disabled="true" value="<%out.print(session.getAttribute("User"));%>"></input>
                                                <label for="qwe">od</label>
                                            </div>
                                            <div class="md-form form-lg " >
                                                <input   class="form-control" id="email_odbiorcy" type="text" name="email_odbiorcy" value=""  placeholder="podaj email" required></input>
                                                <label for="email_odbiorcy">do</label>
                                            </div>

                                        </div>
                                        <p></p>
                                        <div class="md-form ">
                                            <input  class="form-control" id="qwe2" style="width: 99%" type="text" name="tytul" value="" required></input>
                                            <label for="qwe2">Tytuł wiadomości</label>
                                        </div>

                                        <textarea rows="2" class="form-control border border-primary"  style="width: 99%; margin-top: 2.5%;" placeholder="Wiadomość..." name="text_wiadomosci"></textarea>
                                        <button class="btn btn-dark-green" name="widok" value="wyslijWiadomosc" >Wyślij</button>
                                    </form>
                                </div>
                                <script>
                                    document.getElementById('checkbox100').onchange = function () {
                                        if (this.checked) {
                                            document.getElementById('email_odbiorcy').disabled = this.checked;
                                            document.getElementById('email_odbiorcy').value = '';
                                            document.getElementById('email_odbiorcy').placeholder = 'Wszyscy klienci';
                                        } else {
                                            document.getElementById('email_odbiorcy').disabled = this.checked;
                                            document.getElementById('email_odbiorcy').placeholder = 'podaj email';
                                        }
                                    };
                                </script>

                                <%} else if (session.getAttribute("ranga").equals("Admin")) {%>
                                <div class="scrollpaneNW" style="width: 100%; height: 100%; margin-top: 0.1%;">
                                    <form action="obslugaPracownika" method="post" >
                                        <div class="md-form" style="width: 99%">
                                            <select name="typ_wiadomosci"  class="browser-default md-textarea form-control"  required=> 
                                                <option value="">Typ wiadomosci</option>
                                                <option value="glowna" ddata-icon="" >Głowna</option>
                                                <option value="spolecznosc" data-fa-icon="" class="rounded-circle">Społeczność</option>
                                                <option value="informacje" data-icon="" class="rounded-circle">Informacje</option>
                                                <option value="support" data-icon="" class="rounded-circle">Support</option>
                                            </select>
                                        </div>

                                        <div class="row" style="margin-top: 3%;">
                                            <div class="form-check">
                                                <input name="toAll" value="tak" type="checkbox" class="form-check-input" id="checkbox100">
                                                <label class="form-check-label" for="checkbox100">Wyślij do wszystkich klientów</label>
                                            </div>
                                            <div class="form-check">
                                                <input name="zablokujWiadomosc" value="tak" type="checkbox" class="form-check-input" id="2">
                                                <label class="form-check-label" for="2">Zablokuj wiadomość</label>
                                            </div>
                                        </div>


                                        <br>

                                        <div class="row" style="margin-left: 0.5%">
                                            <div class="md-form form-lg">
                                                <input class="form-control" id="qwe" type="text" disabled="true" value="<%out.print(session.getAttribute("User"));%>"></input>
                                                <label for="qwe">od</label>
                                            </div>
                                            <div class="md-form form-lg " >
                                                <input   class="form-control" id="email_odbiorcy" type="text" name="email_odbiorcy" value=""  placeholder="podaj email" required></input>
                                                <label for="email_odbiorcy">do</label>
                                            </div>

                                        </div>
                                        <p></p>
                                        <div class="md-form ">
                                            <input  class="form-control" id="qwe2" style="width: 99%" type="text" name="tytul" value="" required></input>
                                            <label for="qwe2">Tytuł wiadomości</label>
                                        </div>

                                        <textarea rows="2" class="form-control border border-primary"  style="width: 99%; margin-top: 2.5%;" placeholder="Wiadomość..." name="text_wiadomosci"></textarea>
                                        <button class="btn btn-dark-green" name="widok" value="wyslijWiadomosc" >Wyślij</button>
                                    </form>
                                </div>
                                <script>
                                    document.getElementById('checkbox100').onchange = function () {
                                        if (this.checked) {
                                            document.getElementById('email_odbiorcy').disabled = this.checked;
                                            document.getElementById('email_odbiorcy').value = '';
                                            document.getElementById('email_odbiorcy').placeholder = 'Wszyscy klienci';
                                        } else {
                                            document.getElementById('email_odbiorcy').disabled = this.checked;
                                            document.getElementById('email_odbiorcy').placeholder = 'podaj email';
                                        }
                                    };
                                </script>
                                <%}%>



                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>


                </body>
                </html>