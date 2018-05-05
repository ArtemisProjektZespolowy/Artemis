

<%@page import="java.util.Random"%>
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

        <title>Raporty</title>

        <!-- Bootstrap core CSS -->


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


        <!-- Custom styles for this template -->
        <link href="./css/raports.css" rel="stylesheet">
      
    </head>

    <body>
        <%
                  Connection conn = null;
                    Statement stat = null;
                    Statement stat2 = null;
                    Statement stat3 = null;
                    Statement stat4= null;
                    Statement stat5= null;
                    Statement stat6= null;
                    ResultSet res = null;
                    ResultSet res2 = null;
                    ResultSet res3 = null;
                    ResultSet res4 = null;
                    ResultSet res5 = null;
                    ResultSet res6 = null;
                        Random random = new Random();
                    %>
 

        <jsp:include page="header.jsp"/>
          <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        
              <script>
                                        $( function() {
                                          var availableTags = [
                                                  <%
                conn = PolaczenieDB.getConnection();    
                stat4 = conn.createStatement();
                String data12 = "select nazwa from produkt order by nazwa";
                    res4 = stat4.executeQuery(data12);
                    while (res4.next()) {
                         out.print('"' + res4.getString("nazwa") + '"' + ",");
                    }
                             %>
                                          ];
                                          $( "#tags" ).autocomplete({
                                            source: availableTags
                                          });
                                        } );
                                        </script>
                                        
                                    <script>
                                        
                      function tableFilter() {
                        var input, filter, table, tr, td, i;
                        input = document.getElementById("tags");
                        filter = input.value.toUpperCase();
                        table = document.getElementById("myTable");
                        tr = table.getElementsByTagName("tr");
                        for (i = 0; i < tr.length; i++) {
                          td = tr[i].getElementsByTagName("td")[0];
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
                      
                          <script>
                                        $( function() {
                                          var availableTags = [
                                                  <%
                conn = PolaczenieDB.getConnection();    
                stat4 = conn.createStatement();
                String data14 = "select email from konto order by email";
                    res4 = stat4.executeQuery(data14);
                    while (res4.next()) {
                         out.print('"' + res4.getString("email") + '"' + ",");
                    }
                             %>
                                          ];
                                          $( "#tags2" ).autocomplete({
                                            source: availableTags
                                          });
                                        } );
                                        </script>
                                        
                                    <script>
                                        
                      function tableFilter_2() {
                        var input, filter, table, tr, td, i;
                        input = document.getElementById("tags2");
                        filter = input.value.toUpperCase();
                        table = document.getElementById("myTable2");
                        tr = table.getElementsByTagName("tr");
                        for (i = 0; i < tr.length; i++) {
                          td = tr[i].getElementsByTagName("td")[3];
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
 
        <div class="body_1">
            <div class="wrapper">
                <h2>Raporty</h2>
        
                <div class="container_1">

<script>
$(document).ready(function(){
    $("#close_arrow").hide();
    $("#tags2").click(function(){
        $("#zxc").css({"margin-left": "-100%", "min-width": "200%"});
        $("#close_arrow").show();
    });
    $("#close_arrow").click(function(){
        $("#zxc").css({"margin-left": "0%", "min-width": "100%"});
        $("#close_arrow").hide();
    });
});
</script>
                    <div  class="row">

                        <div style="height: 100%" id="wykresy" class="col-2">
                            <!--        <button id="myBtn">Open Modal</button>-->
                            <h4 class="wykresy_txt">Produkty</h4>
                            <hr style="border-top: 1px solid #fff;">
                            <h5 style="margin-bottom: 6%;" class="wykresy_txt">Statystyki - wykresy</h5>
                            <div id="test"  class="scrollpane">

                                <ul  class="list-group list-group-mine list-group-mine2">
                                    <li  class="list-group-item list-group-item2" id="chart_1">Liczba dostępnych kluczy w grze   </li>
                                    <li  class="list-group-item list-group-item2" id="chart_2" >Najlepiej sprzedająca się gra</li>
                                    <li  class="list-group-item list-group-item2" id="chart_3">Liczba gier danego producenta </li>
                                    <li  class="list-group-item list-group-item2" id="chart_4">Liczba gier danej kategorii </li>
                                    <li  class="list-group-item list-group-item2" id="chart_5">Gry według ceny</li>
                                </ul>
                            </div>
                            <div  class="row">
                                      <div    class="col">
                                   
                                  
                        <input  id="tags" class="form-control" type="text" placeholder="Wyszukaj produkt" onkeyup="tableFilter()">
                    <div   class="scrollpane2">                                


                        <table style="margin-top: 3%;"  id="myTable" class="table table-striped">
                                  <thead>
                                      <tr>

                                          <th>Nazwa</th>
                                          <th>Cena</th>

                                      </tr>
                                  </thead>
                                  <%
                                    conn = PolaczenieDB.getConnection();    
                                    stat4 = conn.createStatement();
                                    String data10 = "select nazwa, platforma, cena from produkt order by nazwa";
                                        res4 = stat4.executeQuery(data10);
                                        while (res4.next()) {
                                  %>
                                  <tbody>  
                                      <tr >                    
                                          <td style="font-weight: bold;"><%=res4.getString("nazwa")%></td>
                                          <td style="font-weight: bold;"><%=res4.getFloat("cena")%></td>

                                    </td>
                                      </tr>
                                  </tbody>
                                  <%} stat4.close(); res4.close(); conn.close();  %> 
                              </table>
                                     
                                 </div>  
                                 </div>
                        </div>
                        </div>
                        <div class="col">
                            <div class="col">
                            <h4 class="wykresy_txt">Tworzenie raportów</h4>
                            <hr style="border-top: 1px solid #fff;">
            
                                            <script>
                                    $(document).ready(function(){
                                   $("#controlViewTable").hide();
                                   $("#drukuj").hide();
                                   
                                        if(<% if(request.getParameter("control") == null){
                                            out.print(false);
                                    }else{out.print(true);} ;%>)
                                            {
                                                $("#drukuj").show();
                                            $("#produkty").show();
                                            $("#controlViewTable").show();
                                            $("#klienci").hide();
                                        }else{$("#produkty").hide();
                                            if(<% if(request.getParameter("control2") == null){
                                            out.print(false);
                                    }else{out.print(true);} ;%>){
                                                $("#drukuj").show();
                                                $("#klienci").show();
                                                
                                            }else{$("#klienci").hide();}
                                            
                                            $("#controlViewTable").show();
                                            $("#produkty").hide();
                                        }
                                        
                                        $("#tProdukty").click(function(){
                                             if($("#produkty").is(":visible")){

                                                   $("#produkty").slideUp(500);
                                                   return;
                                            }else{
                                                
                                                $("#klienci").slideUp(500, function() {
                                         $("#produkty").slideDown(500);
                                    });
                                            }

                                        });
                                        $("#tKlienci").click(function(){
                                            
                                            $("#controlViewTable").show();
                                             if($("#klienci").is(":visible")){
                                                   $("#klienci").slideUp(500);

                                            }else{
                                                $("#produkty").slideUp(500, function() {
                                         $("#klienci").slideDown(500);
                                    });


                                            }

                                        });
                                    });
                </script>
                

                
                            
                            
                            <div>    
                                <div  style="width: 100%" class="btn-group" role="group" aria-label="Basic example">
                                    <button id="tProdukty" style="width: 100%; font-size: 13px; font-weight: 800; letter-spacing: 3px; background-color: rgba(255,180,70,0.7)!important" class="btn btn-success waves-effect" type="button" >Produkty</button>
                                    <button id="tKlienci" style="width: 100%; font-size: 13px; letter-spacing: 3px; font-weight: 800; background-color: rgba(100,13,100,0.5)!important " class="btn btn-warning waves-effect" type="button" >Klienci</button>
</div>
                                
                                
                            </div>
                    <!-- / Collapse buttons -->

                    <!-- Collapsible element -->
                    <div style="height: 17vh;"  id="produkty">
                        
      <div class="row">
          <div style="width: 10%">
     <a class="btn-floating" href="#multi-item-example2" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
    </div>
          <div style="width: 80%">
        
<!--Carousel Wrapper-->
<div id="multi-item-example2" class="carousel slide carousel-multi-item" >
    <!--Slides-->
    <div class="carousel-inner" role="listbox">

        <!--First slide-->
        <div class="carousel-item active">

  
            <div class="col-md-4">
                <div class="card mb-3">
                    <h6 class="card-title">Cena > wartość</h6>
                    
                    
                    <form method="post" action="raports.jsp">
                        <input id="cxz" name="raport1" style="text-align: center;" class="form-control" type="text" placeholder="Podaj wartość" pattern="[0-9]" title="Prosze podaj wartości liczbowe" required>
                   <input hidden="true" id="cxz" name="control" value="true" >
                   <button name="bpRaport1" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
                </form>
                </div>
            </div>

             <div class="col-md-4">
                <div class="card mb-3">
                   
                    <h6 style="" class="card-title">Data wydania > wartość</h6>
                       <form method="post" action="raports.jsp">
                   <input id="cxz" name="raport2" style="text-align: center;" class="form-control" type="date" placeholder="Podaj datę"  required>
                   <input hidden="true" id="cxz" name="control" value="true" >
                   <button name="bpRaport2" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
                </form>
                    
                </div>
            </div>

            <div class="col-md-4">
                <div class="card mb-3">
                    <h6 class="card-title">Liczba kluczy > wartość</h6>
                     <form method="post" action="raports.jsp">
                   <input id="cxz" name="raport3" style="text-align: center;" class="form-control" type="text" placeholder="Podaj wartość" pattern="[0-9]" title="Prosze podaj wartości liczbowe" required>
                   <input hidden="true" id="cxz" name="control" value="true" >
                   <button name="bpRaport3" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
                </form>
                </div>
            </div>

        </div>
        
        <!--/.First slide-->

        <!--Second slide-->
        <div class="carousel-item">

           <div class="col-md-4">
                <div class="card mb-3">
                    <h6 class="card-title">In future</h6>
                   <input id="cxz" name="raport3" style="text-align: center;" class="form-control" type="text" placeholder="Podaj wartoś" pattern="[0-9]" title="Prosze podaj wartości liczbowe" required>
                   <input hidden="true" id="cxz" name="control" value="true" >
                   <button name="bpRaport3" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
            
             
                </div>
            </div>

         <div class="col-md-4">
                <div class="card mb-3">
                    <h6 class="card-title">In future</h6>
                   <input id="cxz" name="raport3" style="text-align: center;" class="form-control" type="text" placeholder="Podaj wartość"  pattern="[0-9]" title="Prosze podaj wartości liczbowe" required>
                   <input hidden="true" id="cxz" name="control" value="true" >
                   <button name="bpRaport3" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
             
                </div>
            </div>

          <div class="col-md-4">
                <div class="card mb-3">
                    <h6 class="card-title">In future</h6>
                   <input id="cxz" name="raport3" style="text-align: center;" class="form-control" type="text" placeholder="Podaj wartość"  pattern="[0-9]" title="Prosze podaj wartości liczbowe" required>
                   <input hidden="true" id="cxz" name="control" value="true" >
                   <button name="bpRaport3" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
             
                </div>
            </div>

        </div>
        <!--/.Second slide-->

     

    </div>
    <!--/.Slides-->

</div>
<!--/.Carousel Wrapper-->
                        
    </div>
    <div style="width: 10%; text-align: right;">
        <a  class="btn-floating" href="#multi-item-example2" data-slide="next"><i class="fa fa-chevron-right"></i></a>
    </div>
</div>
                        
                    </div>
                    
                    
        <div  style="height: 17vh;"  id="klienci">
                        
      <div class="row">
          <div style="width: 10%">
     <a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
    </div>
          <div style="width: 80%">
        
<!--Carousel Wrapper-->
<div id="multi-item-example" class="carousel slide carousel-multi-item" >
    <!--Slides-->
    <div class="carousel-inner" role="listbox">

        <!--First slide-->
        <div class="carousel-item active">

            <div class="col-md-4">
                <div class="card mb-3">
                    <h6 class="card-title">Suma > wartość</h6>
                    <form method="post" action="raports.jsp">
                    <input id="cxz" name="raport1" style="text-align: center;" class="form-control" type="text" placeholder="Podaj wartość" pattern="[0-9]" title="Prosze podaj wartości liczbowe" required>
                    <input hidden="true" id="cxz" name="control2" value="true" >
                    <button name="bkRaport1" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
                    </form>
             
                </div>
            </div>

             <div class="col-md-4">
                <div class="card mb-3">
                    <h6 style="" class="card-title">Suma - platforma</h6>
                     <form method="post" action="raports.jsp">
                        
                         <select name="raport2" class="browser-default md-textarea form-control" required>
                            <option value="" disabled selected>Wybierz platformę</option>
                            <option value="Battle.net">Battle.net</option>
                            <option value="Steam">Steam</option>
                            <option value="Epic Games">Epic Games</option>
                            <option value="Origin">Origin</option>
                            <option value="Uplay">Uplay</option>
                            
                        </select>
            
                    <input hidden="true" id="cxz" name="control2" value="true" >
                    <button name="bkRaport2" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
                    </form>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card mb-3">
                    <h6 class="card-title">Długość hasła < wartość</h6>
                   <form method="post" action="raports.jsp">
                    <input id="cxz" name="raport3" style="text-align: center;" class="form-control" type="text" placeholder="Podaj wartość" pattern="[0-9]" title="Prosze podaj wartości liczbowe" required>
                    <input hidden="true" id="cxz" name="control2" value="true" >
                    <button name="bkRaport3" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "   class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
                  
                   </form>
                </div>
            </div>

        </div>
        
        <!--/.First slide-->

        <!--Second slide-->
        <div class="carousel-item">

           <div class="col-md-4">
                <div class="card mb-3">
                    <h6 class="card-title">In future</h6>
                    <input id="cxz" name="raport3" style="text-align: center;" class="form-control" type="text" placeholder="Podaj wartość" pattern="[0-9]" title="Prosze podaj wartości liczbowe" required>
                    <input hidden="true" id="cxz" name="control2" value="true" >
                    <button name="bkRaport3" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
                  
             
                </div>
            </div>

         <div class="col-md-4">
                <div class="card mb-3">
                    <h6 class="card-title">In future</h6>
                   <input id="cxz" name="raport3" style="text-align: center;" class="form-control" type="text" placeholder="Podaj wartość" pattern="[0-9]" title="Prosze podaj wartości liczbowe" required>
                    <input hidden="true" id="cxz" name="control2" value="true" >
                    <button name="bkRaport3" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
             
                </div>
            </div>

          <div class="col-md-4">
                <div class="card mb-3">
                    <h6 class="card-title">In future</h6>
                   <input id="cxz" name="raport3" style="text-align: center;" class="form-control" type="text" placeholder="Podaj wartość" pattern="[0-9]" title="Prosze podaj wartości liczbowe" required>
                    <input hidden="true" id="cxz" name="control2" value="true" >
                    <button name="bkRaport3" value="true"  type="submit" style="width: 95%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-outline-primary waves-effect btn-sm">Wykonaj</button>
             
                </div>
            </div>

        </div>
        <!--/.Second slide-->



    </div>
    <!--/.Slides-->

</div>
<!--/.Carousel Wrapper-->
                        
    </div>
    <div style="width: 10%; text-align: right;">
        <a  class="btn-floating" href="#multi-item-example" data-slide="next"><i class="fa fa-chevron-right"></i></a>
    </div>
</div>
                        
                    </div>
                            <div class="close1">
                                    <div id="modalChart_1" class="modal">
                                    <canvas id="chart1" class="chart_block" ></canvas>
                                    </div>
                                
                                    <div id="modalChart_2" class="modal">
                                    <canvas id="chart2" class="chart_block"></canvas>
                                    </div>
                                
                                    <div id="modalChart_3" class="modal">
                                    <canvas id="chart3" class="chart_block"></canvas>
                                    </div>
                                
                                     <div id="modalChart_4" class="modal">
                                    <canvas id="chart4" class="chart_block"></canvas>
                                    </div>
                                
                                    <div id="modalChart_5" class="modal">
                                    <canvas id="chart5" class="chart_block"></canvas>
                                    </div>
                                
                                    <div id="modalChart_6" class="modal">
                                    <canvas id="chart6" class="chart_block" ></canvas>
                                    </div>
                                
                                    <div id="modalChart_7" class="modal">
                                    <canvas id="chart7" class="chart_block"></canvas>
                                    </div>
                                
                                    <div id="modalChart_8" class="modal">
                                    <canvas id="chart8" class="chart_block"></canvas>
                                    </div>
                                
                                     <div id="modalChart_9" class="modal">
                                    <canvas id="chart9" class="chart_block"></canvas>
                                    </div>
                                
                                    <div id="modalChart_10" class="modal">
                                    <canvas id="chart10" class="chart_block"></canvas>
                                    </div>
                            </div>
                        </div>
                    <div id="relaod_1" class="col">
                                        <button  id="drukuj" onclick="drukuj()" style="opacity: 0.8; width: 100%; margin-left: -0.1%; font-size: 13px; font-weight: 900; letter-spacing: 3px; "  class="btn btn-elegant waves-effect btn-sm">Drukuj raport</button>                  


                    <div id="controlViewTable"  class="scrollpane2">                                
                            
                        
                        <%if(Boolean.valueOf(request.getParameter("bpRaport1"))){%>
                                        
                        
                        

                        <table style=""  id="myTable" class="table table-striped">
                                  <thead>
                                      <tr>

                                          <th>Nazwa</th>
                                          <th>Cena</th>

                                      </tr>
                                  </thead>
                                  <%
                                    conn = PolaczenieDB.getConnection();    
                                    stat4 = conn.createStatement();
                                    String data30 = "select nazwa, cena from produkt where cena > "+request.getParameter("raport1")+" order by cena desc";
                                        res4 = stat4.executeQuery(data30);
                                        while (res4.next()) {
                                  %>
                                  <tbody>  
                                      <tr >                    
                                          <td style="font-weight: bold;"><%=res4.getString("nazwa")%></td>
                                          <td style="font-weight: bold;"><%=res4.getFloat("cena")%></td>

                                    </td>
                                      </tr>
                                  </tbody>
                                  <%} stat4.close(); res4.close(); conn.close();  %> 
                              </table>
                                  <% }else if(Boolean.valueOf(request.getParameter("bpRaport2"))){%>
                                        <table style=""  id="myTable" class="table table-striped">
                                  <thead>
                                      <tr>

                                          <th>Nazwa</th>
                                          <th>Kategoria</th>
                                          <th>Platforma</th>
                                          <th>Wydawca</th>
                                          <th>Data wydania</th>

                                      </tr>
                                  </thead>
                                  <%
                                    conn = PolaczenieDB.getConnection();    
                                    stat4 = conn.createStatement();
                                    String data30 = "select nazwa, kategoria, platforma, wydawca, data_wydania from produkt where data_wydania > '"+request.getParameter("raport2")+"' order by cena desc";
                                        res4 = stat4.executeQuery(data30);
                                        while (res4.next()) {
                                  %>
                                  <tbody>  
                                      <tr >                    
                                          <td style="font-weight: bold;"><%=res4.getString("nazwa")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("kategoria")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("platforma")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("wydawca")%></td>
                                          <td style="font-weight: bold;"><%=res4.getDate("data_wydania")%></td>

                                    </td>
                                      </tr>
                                  </tbody>
                                  <%} stat4.close(); res4.close(); conn.close();  %> 
                              </table>


                                    <%}else if(Boolean.valueOf(request.getParameter("bpRaport3"))){%>
                                             <table style=""  id="myTable" class="table table-striped">
                                  <thead>
                                      <tr>

                                          <th>Nazwa</th>
                                          <th>Kategoria</th>
                                          <th>Platforma</th>
                                          <th>Liczba dostepnych kluczy</th>
                                          

                                      </tr>
                                  </thead>
                                  <%
                                    conn = PolaczenieDB.getConnection();    
                                    stat4 = conn.createStatement();
                                    String data30 = "select p.nazwa, p.platforma, p.wydawca, count(*) as liczba from produkt p join klucze k on p.id_produktu=k.id_produktu where czy_zuzyty = 'false' group by (p.nazwa, p.platforma, p.wydawca ) having count(*)> "+request.getParameter("raport3")+"  order by liczba desc";
                                        res4 = stat4.executeQuery(data30);
                                        while (res4.next()) {
                                  %>
                                  <tbody>  
                                      <tr >                    
                                          <td style="font-weight: bold;"><%=res4.getString("nazwa")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("platforma")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("wydawca")%></td>
                                          <td style="font-weight: bold;"><%=res4.getInt("liczba")%></td>

                                    </td>
                                      </tr>
                                  </tbody>
                                  <%} stat4.close(); res4.close(); conn.close();  %> 
                              </table>

                                    <%}else if(Boolean.valueOf(request.getParameter("bkRaport1"))){%>
                                                    <table style=""  id="myTable" class="table table-striped">
                                  <thead>
                                      <tr>

                                          <th>Imie</th>
                                          <th>Nazwisko</th>
                                          <th>telefon</th>
                                          <th>Email</th>
                                          <th>Suma</th>
                                          

                                      </tr>
                                  </thead>
                                  <%
                                    conn = PolaczenieDB.getConnection();    
                                    stat4 = conn.createStatement();
                                    String data30 = " select k.imie, k.nazwisko, k.telefon, k.email, sum(zk.suma) as suma from konto k join zk zk on k.id_konto=zk.id_konto group by(k.imie, k.nazwisko, k.telefon, k.email, k.email) having sum(zk.suma) >"+request.getParameter("raport1")+" order by suma desc";
                                        res4 = stat4.executeQuery(data30);
                                        while (res4.next()) {
                                  %>
                                  <tbody>  
                                      <tr >                    
                                          <td style="font-weight: bold;"><%=res4.getString("imie")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("nazwisko")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("telefon")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("email")%></td>
                                          <td style="font-weight: bold;"><%=res4.getFloat("suma")%></td>

                                    </td>
                                      </tr>
                                  </tbody>
                                  <%} stat4.close(); res4.close(); conn.close();  %> 
                              </table>


                                    <%}else if(Boolean.valueOf(request.getParameter("bkRaport2"))){%>
                                <table style=""  id="myTable" class="table table-striped">
                                  <thead>
                                      <tr>
                                          <th>Platforma</th> 
                                          <th>Imie</th>
                                          <th>Nazwisko</th>
                                          <th>telefon</th>
                                          <th>Email</th>
                                          <th>Suma</th>
                                          

                                      </tr>
                                  </thead>
                                  <%
                                    conn = PolaczenieDB.getConnection();    
                                    stat4 = conn.createStatement();
                                    String data30 = "select p.platforma, k.imie, k.nazwisko, k.telefon, k.email, sum(zk.suma) as suma from konto k join zk zk on k.id_konto=zk.id_konto join zp zp on zp.id_zp=zk.id_zp join produkt p on p.id_produktu=zp.id_produktu where platforma ='"+request.getParameter("raport2")+"' group by(p.platforma, k.imie, k.nazwisko, k.telefon, k.email) order by suma desc";
                                        res4 = stat4.executeQuery(data30);
                                        while (res4.next()) {
                                  %>
                                  <tbody>  
                                      <tr >          
                                          <td style="font-weight: bold;"><%=res4.getString("platforma")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("imie")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("nazwisko")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("telefon")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("email")%></td>
                                          <td style="font-weight: bold;"><%=res4.getFloat("suma")%></td>

                                    </td>
                                      </tr>
                                  </tbody>
                                  <%} stat4.close(); res4.close(); conn.close();  %> 
                              </table>


                                   <% }else if(Boolean.valueOf(request.getParameter("bkRaport3"))){%> 
                                    <table style=""  id="myTable" class="table table-striped">
                                  <thead>
                                      <tr>

                                          <th>Imie</th>
                                          <th>Nazwisko</th>
                                          <th>telefon</th>
                                          <th>Email</th>
                                          <th>Hasło</th>
                                          

                                      </tr>
                                  </thead>
                                  <%
                                    conn = PolaczenieDB.getConnection();    
                                    stat4 = conn.createStatement();
                                    String data30 = "select imie, nazwisko, telefon, email, haslo from konto where length(haslo) <"+request.getParameter("raport3")+" ";
                                        res4 = stat4.executeQuery(data30);
                                        while (res4.next()) {
                                  %>
                                  <tbody>  
                                      <tr >                    
                                          <td style="font-weight: bold;"><%=res4.getString("imie")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("nazwisko")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("telefon")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("email")%></td>
                                          <td style="font-weight: bold;"><%=res4.getString("haslo")%></td>

                                    </td>
                                      </tr>
                                  </tbody>
                                  <%} stat4.close(); res4.close(); conn.close();  %> 
                              </table>



                                            <%}%>  
                                
                    
                    
                    </div>  
                                     
                                 
                    
                    </div>
<script>
function drukuj() {
    window.print();
}
</script>
                    
                    
                        </div>
                  <div style="height: 100%" id="wykresy" class="col-2">
                          <!--        <button id="myBtn">Open Modal</button>-->
                            <h4 class="wykresy_txt">Klienci</h4>
                            <hr style="border-top: 1px solid #fff;">
                            <h5 style="margin-bottom: 6%;" class="wykresy_txt">Statystyki - wykresy</h5>
                            <div id="test" class="scrollpane">
                                <ul  class="list-group list-group-mine list-group-mine2">
                                    <li  class="list-group-item list-group-item2" id="chart_6">Liczba kont podział na role</li>
                                    <li  class="list-group-item list-group-item2" id="chart_7" >Klient - Najwiecej posiadanych gier</li>
                                    <li  class="list-group-item list-group-item2" id="chart_8">Klient - Którzy najwięcej wydali</li>
                                    <li  class="list-group-item list-group-item2" id="chart_9">Klient - Platforma liczba kupionych gier</li>
                                    <li  class="list-group-item list-group-item2" id="chart_10">Klient - Wysłane wiadomosci</li>
                                </ul>
                            </div>
                          
                            <div class="row">
                                           
                                             <div  id="zxc"class="col">
                                  <div id="close_arrow" class="right_arrow "><i class="fa fa-angle-right"></i></div>
                                     
                                     <input  id="tags2" class="form-control" type="text" placeholder="Wyszukaj klienta" onkeyup="tableFilter_2()">
                                  
                    <div class="scrollpane2">                
                            
                        
                      
                        <table   style="margin-top: 3%;" id="myTable2"  class="table table-striped">
                                  <thead>
                                      <tr>

                                          <th>Imie</th>
                                          <th>Nazwisko</th>
                                          <th>Telefon</th>
                                          <th>Email</th>

                                      </tr>
                                  </thead>
                                  <%
                                    conn = PolaczenieDB.getConnection();    
                                    stat6 = conn.createStatement();
                                    String data13 = "select imie, nazwisko, telefon, email from konto order by email";
                                        res6 = stat6.executeQuery(data13);
                                        while (res6.next()) {
                                  %>
                                  <tbody>  
                                      <tr >                    
                                          <td style="font-weight: bold;"><%=res6.getString("imie")%></td>
                                          <td style="font-weight: bold;"><%=res6.getString("nazwisko")%></td>
                                          <td style="font-weight: bold;"><%=res6.getString("telefon")%></td>
                                          <td style="font-weight: bold;"><%=res6.getString("email")%></td>

                                    </td>
                                      </tr>
                                  </tbody>
                                  <%} stat6.close(); res6.close(); conn.close();  %> 
                              </table>
                                     
                                 </div>  
                                 </div>
                                
                        </div>
                            </div>
                    </div>
                    
                </div>
            </div>

            <script>
                var modal = document.getElementById('modalChart_1');
                var modal_2 = document.getElementById('modalChart_2');
                var modal_3 = document.getElementById('modalChart_3');
                var modal_4 = document.getElementById('modalChart_4');
                var modal_5 = document.getElementById('modalChart_5');
                
                var modal_6 = document.getElementById('modalChart_6');
                var modal_7 = document.getElementById('modalChart_7');
                var modal_8 = document.getElementById('modalChart_8');
                var modal_9 = document.getElementById('modalChart_9');
                var modal_10 = document.getElementById('modalChart_10');
              
                var btn = document.getElementById("chart_1");
                var btn_2 = document.getElementById("chart_2");
                var btn_3 = document.getElementById("chart_3");
                var btn_4 = document.getElementById("chart_4");
                var btn_5 = document.getElementById("chart_5");
                
                var btn_6 = document.getElementById("chart_6");
                var btn_7 = document.getElementById("chart_7");
                var btn_8 = document.getElementById("chart_8");
                var btn_9 = document.getElementById("chart_9");
                var btn_10 = document.getElementById("chart_10");
                
                var span = document.getElementsByClassName("close1")[0];
                btn.onclick = function () {
                    modal.style.display = "block";
                }
                btn_2.onclick = function () {
                    modal_2.style.display = "block";
                }
                btn_3.onclick = function () {
                    modal_3.style.display = "block";
                }
                btn_4.onclick = function () {
                    modal_4.style.display = "block";
                }
                  btn_5.onclick = function () {
                    modal_5.style.display = "block";
                }
                  btn_6.onclick = function () {
                    modal_6.style.display = "block";
                }
                 btn_7.onclick = function () {
                    modal_7.style.display = "block";
                }
                 btn_8.onclick = function () {
                    modal_8.style.display = "block";
                }
                 btn_9.onclick = function () {
                    modal_9.style.display = "block";
                }
                 btn_10.onclick = function () {
                    modal_10.style.display = "block";
                }
                
                span.onclick = function () {
                    modal.style.display = "none";
                    modal_2.style.display = "none";
                    modal_3.style.display = "none";
                    modal_4.style.display = "none";
                    modal_5.style.display = "none";
                    modal_6.style.display = "none";
                    modal_7.style.display = "none";
                    modal_8.style.display = "none";
                    modal_9.style.display = "none";
                    modal_10.style.display = "none";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                     if (event.target == modal_2) {
                        modal_2.style.display = "none";
                    } if (event.target == modal_3) {
                        modal_3.style.display = "none";
                    }
                    if (event.target == modal_4) {
                        modal_4.style.display = "none";
                    }
                    if (event.target == modal_5) {
                        modal_5.style.display = "none";
                    }
                    if (event.target == modal_6) {
                        modal_6.style.display = "none";
                    }
                    if (event.target == modal_7) {
                        modal_7.style.display = "none";
                    }
                     if (event.target == modal_8) {
                        modal_8.style.display = "none";
                    }
                    if (event.target == modal_9) {
                        modal_9.style.display = "none";
                    }
                    if (event.target == modal_10) {
                        modal_10.style.display = "none";
                    }
                }
            </script>

                   <%
                    conn = PolaczenieDB.getConnection();
                    stat = conn.createStatement();
                    stat2 = conn.createStatement();
                    String data = "select p.nazwa,  count(p.id_produktu) as liczba from produkt p join klucze k on p.id_produktu=k.id_produktu where k.czy_zuzyty = false group by (p.nazwa,p.id_produktu) order by (nazwa)";
                    res = stat.executeQuery(data);
                    res2 = stat2.executeQuery(data);
                    int ite = 0;
                %>
            
            <script>
                new Chart(document.getElementById("chart1"), {
                    type: 'horizontalBar',
                    data: {
                        labels: [<%while (res.next()) {
                                          ite++;
                                          out.print('"' + res.getString("nazwa") + '"' + ",");
                                      }
                                      res.close();%>],
                        datasets: [
                            {
                                data: [<%while (res2.next()) {
                                              out.print(res2.getInt("liczba") + ",");
                                          }
                                          res2.close();
                                          conn.close();%>,0],
                                label: "Dostepnych kluczy",
                                backgroundColor: [<% for (int i = 0; i < ite; i++) {
                                              int r = random.nextInt(170);
                                              int g = random.nextInt(170);
                                              int b = random.nextInt(170);
                                              String colorCode = String.format("#%02x%02x%02x", r, g, b);
                                              out.print('"' + colorCode + '"' + ",");
                                          }%>
                                ]
                            }
                        ]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: 'Liczba dostępnych kluczy w grze'
                        }
                    }
                });
            </script>
            
                 <%
                    
                    conn = PolaczenieDB.getConnection();
                    stat = conn.createStatement();
                    stat2 = conn.createStatement();
                    String data2 = "select p.nazwa, count(*) as liczba from klucze k join produkt p on k.id_produktu=p.id_produktu where k.czy_zuzyty = true group by(p.nazwa) order by liczba desc";
                    res = stat.executeQuery(data2);
                    res2 = stat2.executeQuery(data2);
                    int ite2 = 0;
                  
                %>
            
            
                       <script>
                new Chart(document.getElementById("chart2"), {
                    type: 'bar',
                    data: {
                        labels: [<%while (res.next()) {
                                          ite2++;
                                          out.print('"' + res.getString("nazwa") + '"' + ",");
                                      }
                                      res.close();%>],
                        datasets: [
                            {
                                data: [<%while (res2.next()) {
                                              out.print(res2.getInt("liczba") + ",");
                                          }
                                          res2.close();
                                          conn.close();%>0],
                                label: "Sprzedanych egzemplarzy",
                                backgroundColor: [<% for (int i = 0; i < ite2; i++) {
                                              int r = random.nextInt(170);
                                              int g = random.nextInt(170);
                                              int b = random.nextInt(170);
                                              String colorCode = String.format("#%02x%02x%02x", r, g, b);
                                              out.print('"' + colorCode + '"' + ",");
                                          }%>
                                ]
                            }
                        ]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: 'Najlepiej sprzedająca się gra'
                        }
                    }
                });
            </script>
            
                 <%
                    
                    conn = PolaczenieDB.getConnection();
                    stat = conn.createStatement();
                    stat2 = conn.createStatement();
                    String data3 = "select platforma, count(*) as liczba from  produkt group by(platforma) order by liczba desc";
                    res = stat.executeQuery(data3);
                    res2 = stat2.executeQuery(data3);
                    int ite3 = 0;
                  
                %>
            
            
                       <script>
                                        new Chart(document.getElementById("chart3"), {
                                  type: 'doughnut',
                                  data: {
                                    labels: [<%while (res.next()) {
                                          ite3++;
                                          out.print('"' + res.getString("platforma") + '"' + ",");
                                      }
                                      res.close();%>],
                                    datasets: [
                                      {
                                        label: "Population (millions)",
                                        backgroundColor: [<% for (int i = 0; i < ite3; i++) {
                                              int r = random.nextInt(222);
                                              int g = random.nextInt(222);
                                              int b = random.nextInt(222);
                                              String colorCode = String.format("#%02x%02x%02x", r, g, b);
                                              out.print('"' + colorCode + '"' + ",");
                                          }%>],
                                        data: [<%while (res2.next()) {
                                              out.print(res2.getInt("liczba") + ",");
                                          }
                                          res2.close();
                                          conn.close();%>,0]
                                      }
                                    ]
                                  },
                                  options: {
                                    title: {
                                      display: true,
                                      text: 'Liczba gier od danego producenta - platforma'
                                    }
                                  }
                              });
            </script>
            
                       <%
                    
                    conn = PolaczenieDB.getConnection();
                    stat = conn.createStatement();
                    stat2 = conn.createStatement();
                    String data4 = "select kategoria, count(*) as liczba from  produkt group by(kategoria) order by liczba desc";
                    res = stat.executeQuery(data4);
                    res2 = stat2.executeQuery(data4);
                    int ite4 = 0;
                  
                %>
                
                             <script>
                                        new Chart(document.getElementById("chart4"), {
                                  type: 'pie',
                                  data: {
                                    labels: [<%while (res.next()) {
                                          ite4++;
                                          out.print('"' + res.getString("kategoria") + '"' + ",");
                                      }
                                      res.close();%>],
                                    datasets: [
                                      {
                                        label: "Liczba",
                                        backgroundColor: [<% for (int i = 0; i < ite4; i++) {
                                              int r = random.nextInt(222);
                                              int g = random.nextInt(222);
                                              int b = random.nextInt(222);
                                              String colorCode = String.format("#%02x%02x%02x", r, g, b);
                                              out.print('"' + colorCode + '"' + ",");
                                          }%>],
                                        data: [<%while (res2.next()) {
                                              out.print(res2.getInt("liczba") + ",");
                                          }
                                          res2.close();
                                          conn.close();%>,0]
                                      }
                                    ]
                                  },
                                  options: {
                                    title: {
                                      display: true,
                                      text: 'Liczba gier od danego producenta - platforma'
                                    }
                                  }
                              });
            </script>
            
                             <%
                    
                    conn = PolaczenieDB.getConnection();
                    stat = conn.createStatement();
                    stat2 = conn.createStatement();
                    String data5 = "select nazwa, cena as liczba from  produkt order by cena desc";
                    res = stat.executeQuery(data5);
                    res2 = stat2.executeQuery(data5);
                    int ite5 = 0;
                  
                %>
                
                      <script>
                         new Chart(document.getElementById("chart5"), {
                    type: 'horizontalBar',
                    data: {
                        labels: [<%while (res.next()) {
                                          ite5++;
                                          out.print('"' + res.getString("nazwa") + '"' + ",");
                                      }
                                      res.close();%>],
                        datasets: [
                            {
                                data: [<%while (res2.next()) {
                                              out.print(res2.getInt("liczba") + ",");
                                          }
                                          res2.close();
                                          conn.close();%>0],
                                label: "Cena ",
                                backgroundColor: [<% for (int i = 0; i < ite5; i++) {
                                              int r = random.nextInt(170);
                                              int g = random.nextInt(170);
                                              int b = random.nextInt(170);
                                              String colorCode = String.format("#%02x%02x%02x", r, g, b);
                                              out.print('"' + colorCode + '"' + ",");
                                          }%>
                                ]
                            }
                        ]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: 'Gry według ceny (zł)'
                        }
                    }
                });
            </script>
            <!--  WYKRESY DLA KONT   -->
            
                         <%
                    conn = PolaczenieDB.getConnection();
                    stat = conn.createStatement();
                    stat2 = conn.createStatement();
                    String data20 = "select u.ranga, count(*) as liczba from konto k join uprawnienia u on k.id_uprawnienia=u.id_uprawnienia group by (u.ranga, k.id_uprawnienia)";
                    res = stat.executeQuery(data20);
                    res2 = stat2.executeQuery(data20);
                    int ite20 = 0;
                %>
            
            <script>
                new Chart(document.getElementById("chart6"), {
                    type: 'horizontalBar',
                    data: {
                        labels: [<%while (res.next()) {
                                          ite20++;
                                          out.print('"' + res.getString("ranga") + '"' + ",");
                                      }
                                      res.close();%>],
                        datasets: [
                            {
                                data: [<%while (res2.next()) {
                                              out.print(res2.getInt("liczba") + ",");
                                          }
                                          res2.close();
                                          conn.close();%>,0],
                                label: "Liczba osob",
                                backgroundColor: [<% for (int i = 0; i < ite20; i++) {
                                              int r = random.nextInt(255);
                                              int g = random.nextInt(255);
                                              int b = random.nextInt(255);
                                              String colorCode = String.format("#%02x%02x%02x", r, g, b);
                                              out.print('"' + colorCode + '"' + ",");
                                          }%>
                                ]
                            }
                        ]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: 'Liczba kont podział na role'
                        }
                    }
                });
            </script>
            
                     <%
                    
                    conn = PolaczenieDB.getConnection();
                    stat = conn.createStatement();
                    stat2 = conn.createStatement();
                    String data21 = "select k.email, count(*) as liczba from konto k join zk zk on k.id_konto=zk.id_konto join zp zp on zp.id_zp=zk.id_zp group by(k.email) order by liczba desc";
                    res = stat.executeQuery(data21);
                    res2 = stat2.executeQuery(data21);
                    int ite21 = 0;
                  
                %>
            
            
                       <script>
                new Chart(document.getElementById("chart7"), {
                    type: 'bar',
                    data: {
                        labels: [<%while (res.next()) {
                                          ite21++;
                                          out.print('"' + res.getString("email") + '"' + ",");
                                      }
                                      res.close();%>],
                        datasets: [
                            {
                                data: [<%while (res2.next()) {
                                              out.print(res2.getInt("liczba") + ",");
                                          }
                                          res2.close();
                                          conn.close();%>0],
                                label: "Kupionych egzemplarzy",
                                backgroundColor: [<% for (int i = 0; i < ite21; i++) {
                                              int r = random.nextInt(170);
                                              int g = random.nextInt(170);
                                              int b = random.nextInt(170);
                                              String colorCode = String.format("#%02x%02x%02x", r, g, b);
                                              out.print('"' + colorCode + '"' + ",");
                                          }%>
                                ]
                            }
                        ]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: 'Klient - najwiecej gier'
                        }
                    }
                });
            </script>
            
                      <%
                    
                    conn = PolaczenieDB.getConnection();
                    stat = conn.createStatement();
                    stat2 = conn.createStatement();
                    String data22 = "select k.email,sum(zk.suma) as liczba  from konto k join zk zk on k.id_konto=zk.id_konto join zp zp on zp.id_zp=zk.id_zp group by(k.email) order by liczba desc";
                    res = stat.executeQuery(data22);
                    res2 = stat2.executeQuery(data22);
                    int ite22 = 0;
                  
                %>
            
            
                       <script>
                new Chart(document.getElementById("chart8"), {
                    type: 'bar',
                    data: {
                        labels: [<%while (res.next()) {
                                          ite22++;
                                          out.print('"' + res.getString("email") + '"' + ",");
                                      }
                                      res.close();%>],
                        datasets: [
                            {
                                data: [<%while (res2.next()) {
                                              out.print(res2.getFloat("liczba") + ",");
                                          }
                                          res2.close();
                                          conn.close();%>0],
                                label: "Suma",
                                backgroundColor: [<% for (int i = 0; i < ite22; i++) {
                                              int r = random.nextInt(170);
                                              int g = random.nextInt(170);
                                              int b = random.nextInt(170);
                                              String colorCode = String.format("#%02x%02x%02x", r, g, b);
                                              out.print('"' + colorCode + '"' + ",");
                                          }%>
                                ]
                            }
                        ]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: 'Klient - Którzy najwięcej wydali (zł)'
                        }
                    }
                });
            </script>
            
                           <%
                    
                    conn = PolaczenieDB.getConnection();
                    stat = conn.createStatement();
                    stat2 = conn.createStatement();
                    String data23 = "select p.platforma, count(*) as liczba  from konto k join zk zk on k.id_konto=zk.id_konto join zp zp on zp.id_zp=zk.id_zp join produkt p on p.id_produktu=zp.id_produktu group by(p.platforma) order by liczba desc";
                    res = stat.executeQuery(data23);
                    res2 = stat2.executeQuery(data23);
                    int ite23 = 0;
                  
                %>
            
            
                       <script>
                                        new Chart(document.getElementById("chart9"), {
                                  type: 'doughnut',
                                  data: {
                                    labels: [<%while (res.next()) {
                                          ite23++;
                                          out.print('"' + res.getString("platforma") + '"' + ",");
                                      }
                                      res.close();%>],
                                    datasets: [
                                      {
                                        label: "Suma sprzedanych egzemplarzy",
                                        backgroundColor: [<% for (int i = 0; i < ite23; i++) {
                                              int r = random.nextInt(222);
                                              int g = random.nextInt(222);
                                              int b = random.nextInt(222);
                                              String colorCode = String.format("#%02x%02x%02x", r, g, b);
                                              out.print('"' + colorCode + '"' + ",");
                                          }%>],
                                        data: [<%while (res2.next()) {
                                              out.print(res2.getInt("liczba") + ",");
                                          }
                                          res2.close();
                                          conn.close();%>,0]
                                      }
                                    ]
                                  },
                                  options: {
                                    title: {
                                      display: true,
                                      text: 'Klient - Platforma liczba kupionych gier'
                                    }
                                  }
                              });
            </script>
     
                           <%
                    conn = PolaczenieDB.getConnection();
                    stat = conn.createStatement();
                    stat2 = conn.createStatement();
                    String data24 = "select k.email, count(*) as liczba from konto k join poczta p on p.id_konto=k.id_konto group by(k.email)";
                    res = stat.executeQuery(data24);
                    res2 = stat2.executeQuery(data24);
                    int ite24 = 0;
                %>
            
            <script>
                new Chart(document.getElementById("chart10"), {
                    type: 'horizontalBar',
                    data: {
                        labels: [<%while (res.next()) {
                                          ite24++;
                                          out.print('"' + res.getString("email") + '"' + ",");
                                      }
                                      res.close();%>],
                        datasets: [
                            {
                                data: [<%while (res2.next()) {
                                              out.print(res2.getInt("liczba") + ",");
                                          }
                                          res2.close();
                                          conn.close();%>,0],
                                label: "w liczbie ",
                                backgroundColor: [<% for (int i = 0; i < ite24; i++) {
                                              int r = random.nextInt(255);
                                              int g = random.nextInt(255);
                                              int b = random.nextInt(255);
                                              String colorCode = String.format("#%02x%02x%02x", r, g, b);
                                              out.print('"' + colorCode + '"' + ",");
                                          }%>
                                ]
                            }
                        ]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: 'Klient - Wysłane wiadomosci(suma)'
                        }
                    }
                });
            </script>
                
    </body>

</html>