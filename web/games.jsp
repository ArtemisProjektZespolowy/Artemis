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

        <title>Games</title>

     

       
    </head>
    <!-- NAVBAR
    ================================================== -->

    <body style="background-color:#7c6767;">

    <jsp:include page="header.jsp"/>
    
        <%
               

                                    Connection conn = null;
                                    Statement stat = null;
                                    ResultSet res = null;


                                
            
            try {
                    
               
            conn = PolaczenieDB.getConnection();
            stat = conn.createStatement();
            
        

        %>
      <%
                        String data = "select * from produkt";
                        res = stat.executeQuery(data);
                            
                        while (res.next()) {
                    %>
    
	
      <div class="col-sm-4">
        <div class="panel panel-default">
            <div class="panel-thumbnail"><img src="<%=res.getString("obraz")%>" class="img-responsive"></div>
          <div class="panel-body" style="text-align: center;">
              <p class="lead" ><%=res.getString("nazwa")%>(<%=res.getString("kategoria")%>)</p>
       
            <p>
             
              <form  action="shoppingcart" name="formBuy" method="post">
              <button style="font-weight: bold" class="btn btn-info" id="" name="btnBuy" value="<%=res.getInt("id_produktu")%>">Buy<b> &nbsp; <%=res.getDouble("cena")%>&nbsp;USD</b></button>
              </form>
              
            </p>
          </div>
        </div>
      </div><!--/col-->
         
      <%
            
                    }
            conn.close();

 } catch (Exception e) {
    response.sendRedirect("serverError.jsp");
                }
                %>
     
    
    
    
    <br>
    
    <div class="clearfix"></div>
    <hr>
       <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Artemis 2017</p>
                </div>
            </div>
        </footer>
  </div><!--/main row-->
</div><!--/main-->

</body>
</html>
