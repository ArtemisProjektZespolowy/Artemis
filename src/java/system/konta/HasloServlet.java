/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.konta;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.PolaczenieDB;

/**
 *
 * @author Patryk
 */
@WebServlet(name = "HasloServlet", urlPatterns = {"/changepass"})
public class HasloServlet extends HttpServlet {


    private static final String PAGE = "changemypassword.jsp";
    private static final String PAGE2 = "serverError.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(PAGE);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        

        // kodowanie znaków przy odbieraniu i wysyłaniu wartości
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String oldhaslo = req.getParameter("current_haslo");
        String haslo = req.getParameter("haslo");

        //po przedladowaniu strony dane z formularza nie zostana utracone
        

        req.setAttribute("theemail",haslo);

            KontoBean obj = new KontoBean();
            obj.setHaslo(haslo);
            int status = 0;  
                
                if(session.getAttribute("accpass").equals(oldhaslo)){
                status = DaneDao.updatePass(obj, session);

            if (status > 0) {
                
                req.setAttribute("updatePassS", "Zmiana hasła przebiegła pomyślnie!");

                session.setAttribute("accpass", haslo);
                req.getRequestDispatcher(PAGE).include(req, resp); 
            }else {
                req.setAttribute("updatePassS", "Nie udało się zmienić hasła");
                 req.getRequestDispatcher(PAGE).include(req, resp); 
            }
            
            }else{   
            req.setAttribute("updatePassF", "Uwierzytelnianie nie powiodło się!");
            req.getRequestDispatcher(PAGE).include(req, resp);
        }
        

        
        
    }

    }

