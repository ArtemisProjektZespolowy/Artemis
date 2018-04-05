/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.produktu;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        Produkt produkt = produktService.find(request.getParameter("id"));
        request.setAttribute("produkt.id", produkt.getId()); // Store products in request scope.
//        request.setAttribute("produkt.nazwa", produkt.getNazwa()); // Store products in request scope
//        request.setAttribute("produkt.data_wydania", produkt.getData_wydania());
//        request.setAttribute("produkt.kategoria", produkt.getKategoria());
//        request.setAttribute("produkt.platforma", produkt.getPlatforma());
//        request.setAttribute("produkt.cena", produkt.getCena());
//        request.setAttribute("produkt.wydawca", produkt.getWydawca());
//        request.setAttribute("produkt.opis", produkt.getOpis());
//        request.setAttribute("produkt.obraz", produkt.getObraz());
        
        request.getRequestDispatcher("product.jsp").forward(request, response); // Forward to JSP page to display them in a HTML table.
        

    }
    
}


