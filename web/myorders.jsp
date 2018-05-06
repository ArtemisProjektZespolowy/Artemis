<%-- 
    Document   : myorders
    Created on : 2018-04-22, 17:24:13
    Author     : Patryk
--%>

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

        <%if(session.getAttribute("User")!=null){%>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

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
        <script>
$(document).ready(function(){
  $(".flip").click(function(){
    $(this).next().closest(".panel").slideToggle("slow");
    
  });
});
</script>
        <jsp:include page="header.jsp"/>

    <div class="container" id="xd" style>

                                  <h1 style="text-align: center;font-size:50px; font-family: Trebuchet MS, Helvetica, sans-serif">Moje zamówienia</h1>
                                  <hr class="featurette-divider" style="margin-left: -10px">
                                  <title>Moje zamówienia</title>
                                  
                                  
                                  <div class="form-group">
                    <div class="btn-group btn-group-lg" style="width: 100%;">
                         

                        <a href="myaccount.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Moje konto</button></a>
                        <a href="changemydata.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Zmień dane</button></a>
                        <a href="changemypassword.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Zmień hasło</button></a>
                        <a href="myorders.jsp"style="width: 100%;"><button class="btn btn-default" style="width: 100%;"href="#">Moje zamówienia</button></a>
                        
                    </div>
                                  </div>
                                  <hr class="featurette-divider" style="margin-left: -10px">
                                   <%
                                    Connection conn = null;
                                    Statement stat = null;
                                    ResultSet res = null;
                                    conn = PolaczenieDB.getConnection();
                                    stat = conn.createStatement();
                                    res = stat.executeQuery("select distinct zp.seria_zamowienia,zk.suma, zk.data_zamowienia from zp join zk on zk.id_zp=zp.id_zp where zk.id_konto = "+session.getAttribute("id_konta")+"order by zk.data_zamowienia desc;");
                                    if(!res.next()){
                                        %>
                                        <div style="width:100%;margin-top:100px;text-align: center;">
                                        <h1>Nie złożyłeś jeszcze żadnych zamówień.</h1>
                                        </div>
                                        <%
                                    }else
                                    res = null;
                                    res = stat.executeQuery("select distinct zp.seria_zamowienia,zk.suma, zk.data_zamowienia from zp join zk on zk.id_zp=zp.id_zp where zk.id_konto = "+session.getAttribute("id_konta")+"order by zk.data_zamowienia desc;");

                                    
                                    while(res.next()){
      %>
      <div>
      <h1 class="flip btn btn-default" style ="margin-left:0%;width:100%;font-size:12pt;">Zamówienie z dnia <%=res.getDate("data_zamowienia")%> | <%=String.format("%.2f%n",res.getDouble("suma"))%>zł</h1>
		<div class="panel">
                    <table class="table">
                  <thead>
                      <tr>
                          <th>Nazwa</th>
                          <th>Cena</th>
                          <th>Platforma</th>
                          <th>Klucz</th>
                          
                      </tr>
                  </thead>
                  <tbody>
                      <tr > 
                          
                     
                    <%  
                    Statement stat2 = conn.createStatement();
                    double suma = 0;
                    ResultSet res2 = stat2.executeQuery("select p.nazwa,p.platforma, p.cena, zp.kod_gry from produkt p join zp on p.id_produktu=zp.id_produktu where zp.seria_zamowienia= "+String.valueOf(res.getInt("seria_zamowienia")) +";");
                    while(res2.next()){
                    suma+=res2.getDouble("cena");
                    %>
                    
                          <td width="25%" height="30"><%=res2.getString("nazwa")%></td>
                          <td width="25%" height="30"><%=String.format("%.2f%n",res2.getDouble("cena"))%>zł</td>
                          <td width="25%" height="30"><%=res2.getString("platforma")%></td>
                          <td width="25%" height="30"><%=res2.getString("kod_gry")%></td>
                          
                    </tr>
                    <%}%>
                     
                        </tbody>
              </table>
                    <h3 style="float:right;">Suma zamówienia: <%=String.format("%.2f%n",suma)%>zł</h3>
		</div>
      </div>
		
                            <%}%>      
                            
    </div>
                                  


            <footer class="footer">
            <div class="container">
                <span class="text-muted">Copyright &copy; 2018 Artemis.</span>
                <p class="pull-right" style="text-align: center; margin-top: 10px; font-size: 40px;"><a href="#"><span  class="pull-right fa fa-toggle-up text-muted" aria-hidden="true"></span></a></p>
                
            </div>
        </footer>

    </body>                              

    </body>
    <%}else{
        response.sendRedirect("index.jsp");
}%>
</html>
