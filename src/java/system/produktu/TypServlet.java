/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.produktu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Patryk
 */
@WebServlet(name = "TypServlet", urlPatterns = {"/typ"})
public class TypServlet extends HttpServlet {
    private static final String PAGE = "index.jsp";    
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch(request.getParameter("id")){
            case "Najpopularniejsze":
                request.setAttribute("zapytanie", "select * from produkt order by random()");
                
                break;
            case "Nowości":
                request.setAttribute("zapytanie","select * from produkt order by data_wydania desc");
                break;
            case "Gry z platformy Steam":
                request.setAttribute("zapytanie","select * from produkt where platforma='Steam' order by random()");
                break;
            case "Gry poniżej 40zł":
                request.setAttribute("zapytanie","select * from produkt where cena<=40 order by random()");
                break;
            default:
                request.getRequestDispatcher(PAGE).forward(request, response);
                break;
        }
        request.setAttribute("name", request.getParameter("id"));
        request.getRequestDispatcher("typ.jsp").forward(request, response); // Forward to JSP page to display them in a HTML table.
        

    }
}
