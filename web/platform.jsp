<%-- 
    Document   : platform
    Created on : 2018-04-08, 13:37:55
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

        <div class="container"id="xd">
            <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif">Gry z platformy <%=request.getAttribute("platform")%></h1>
            <hr class="featurette-divider" style="margin-left: -10px">
            <div class="container marketing">
                <div class="row">
                    <%int iteracja = 0;
                        int currentRow = 1;

                            Connection conn = null;
                            Statement stat = null;
                            ResultSet res = null;
                            conn = PolaczenieDB.getConnection();
                            stat = conn.createStatement();
                            String data = "select * from produkt where platforma like '"+request.getAttribute("platform")+"';";
                            res = stat.executeQuery(data);
                            while (res.next()) {
                                iteracja++;
                    %>
                    <script>


                        <%out.println("function " + "update" + iteracja + "" + currentRow + "()");%> {
                            document.getElementById("<%=iteracja + "" + currentRow%>").submit();
                        }

                    </script>

                    <div class="row" id="<%=currentRow%>">

                        <form id="<%=iteracja + "" + currentRow%>" action="more" name="formMore" method="get"><a name="id" onclick="<%out.println("update" + iteracja + "" + currentRow + "()");%>"><div class="col-md-12 " style=" padding-left: 8%;padding-right: 8%; padding-bottom: 8%;" >
                                    <div  class="card card-image" style="background-color:#00685c; min-height: 20%;height: 262px;width:262px;  opacity: 0.9;">
                                        <div class="text-white text-center py-12 px-12 my-12">
                                            <div>
                                                <%int currentId = res.getInt("id_produktu");%>
                                                <div id="products" class="item  col-xs-12 col-lg-12" >
                                                    <h5 id="mid"  style="max-width: 100%; text-align: center;" name="nazwa" class="card-title  mt-2 font-bold"  style=" font-size: 12px;padding-top: 5%">
                                                        <%if (res.getString("nazwa").length() > 20) {
                                                                String shortenedName;

                                    shortenedName = (res.getString("nazwa").substring(0, 20) + "...");
                                                                out.println(shortenedName); %></h5><%

                                                        } else {%>
                                                        <% out.println(res.getString("nazwa")); %></h6><%}%>

                                                    <h8 id="mid" name="platforma" class="group inner list-group-item-heading" >
                                                        <%
                                                        Date td = res.getDate("data_wydania");
                                                        String b = new String("");
                                                        SimpleDateFormat format = new SimpleDateFormat("dd/MM/YYYY");
                                                        b = format.format(td);
                                                        out.println(b);%></h8>
                                                    <div class="thumbnail" >
                                                        <% String obrazek = res.getString("obraz");
                                                            StringTokenizer stringTokenizer = new StringTokenizer(obrazek, ", ");
                                                            if (stringTokenizer.hasMoreElements()) {
                                                                obrazek = stringTokenizer.nextToken();
                                                            }
                                                        %>
                                                        <img  src="<%=obrazek%>"/>
                                                        <input name="id" type="hidden" value="<%=currentId%>">
                                                        <div class="caption">


                                                            <div class="row" id="mid">

                                                                <div class="col-xs-12 col-md-12">
                                                                    </a></form>
                                                                    <form  action="shoppingcart" name="formBuy" method="post">
                                                                        <button tabindex="4" name="btnBuy" class="btn btn-large btn-success "value="<%=res.getInt("id_produktu")%>" style="margin-left: 20px; margin-top:12px; text-align: center; font-size: 12px;">Dodaj do koszyka<br><p class="lead" style="font-size: 12px;margin-bottom: -4px">
                                                                                <% out.println((String.format("%.2f%n", Double.parseDouble(res.getString("cena")))) + "zł"); %></p></button></form>
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

                                <% }
                        conn.close();%>
                                </div>                         
                                </div>   
                                </div>
                                



                                <footer class="footer">
                                    <div class="container" style="">
                                        <span class="text-muted">Copyright &copy; 2018 Artemis.</span>
                                        <p class="pull-right" style="text-align: center; margin-top: 10px; font-size: 40px;"><a href="#"><span  class="pull-right fa fa-toggle-up text-muted" aria-hidden="true"></span></a></p>

                                    </div>
                                </footer>
                                </body>
                                </html>