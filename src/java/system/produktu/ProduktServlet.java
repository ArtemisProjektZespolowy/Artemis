/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.produktu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.PolaczenieDB;

/**
 *
 * @author Patryk
 */
@WebServlet(name = "ProduktServlet", urlPatterns = {"/more"})
public class ProduktServlet extends HttpServlet {

//    Connection conn = PolaczenieDB.getConnection();
//    Statement statement = conn.createStatement();
//    ResultSet resultSet = statement.executeQuery("select email, haslo, u.ranga from konto k join uprawnienia u on k.id_uprawnienia=u.id_uprawnienia");
//    static PreparedStatement pst;
    
    ProduktService produktService = new ProduktService();
    
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Produkt> produkty = produktService.getProdukty();
        boolean isProductinDatabase = produktService.find(request.getParameter("id"));
        if(isProductinDatabase){
        request.setAttribute("produkt.id", request.getParameter("id")); // Store products in request scope.
        request.getRequestDispatcher("product.jsp").forward(request, response);
        }
        else{
        request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }
    
}


