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
@WebServlet(name = "KategoriaServlet", urlPatterns = {"/kategoria"})
public class KategoriaServlet extends HttpServlet {

//    Connection conn = PolaczenieDB.getConnection();
//    Statement statement = conn.createStatement();
//    ResultSet resultSet = statement.executeQuery("select email, haslo, u.ranga from konto k join uprawnienia u on k.id_uprawnienia=u.id_uprawnienia");
//    static PreparedStatement pst;
    
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String kat = request.getParameter("id");
        request.setAttribute("kategoria", kat);
        request.getRequestDispatcher("category.jsp").forward(request, response); // Forward to JSP page to display them in a HTML table.
    }
    
}


