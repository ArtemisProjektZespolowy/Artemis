/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.logowania;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import system.logowania.LoginBean;
import system.logowania.LoginDao;
import system.logowania.LogoutServlet;
import javax.servlet.http.HttpSession;
import src.PolaczenieDB;

/**
 *
 * @author Iluvris
 */

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
private static final String PAGE = "sign_in.jsp";
private static final String PAGE2 = "serverError.jsp";





    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.sendRedirect(PAGE);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String haslo = req.getParameter("haslo");
        
      
        
        
        HttpSession session = req.getSession();
//        session.invalidate();
//        List<Cart2> list = (List<Cart2>) session.getAttribute("list");
//        list.clear();
        
        boolean error = false;
        resp.setContentType("text/html");
    
        if(email.trim().isEmpty()){
            req.setAttribute("errMessageEmail", "Wprowadź adres E-mail");
        }
        
        if(haslo.trim().isEmpty()){
            req.setAttribute("errMessageHaslo", "Wprowadź hasło");
        }
        
        LoginBean loginBean = new LoginBean();
        
        loginBean.setEmail(email);
        loginBean.setHaslo(haslo);

        LoginDao loginDao = new LoginDao();

        try {
            SessionData userValidate = loginDao.authenticateUser(loginBean);
            if (userValidate.getUprawnienia_konta().equals("Admin") || userValidate.getUprawnienia_konta().equals("Pracownik") || userValidate.getUprawnienia_konta().equals("User") ) {
              session = req.getSession(); //Creating a session
                session.setAttribute("User", String.valueOf(userValidate.getEmail_konta())); //setting session attribute
                session.setAttribute("id_konta", userValidate.getId_konta());
                session.setAttribute("telefon_konta", String.valueOf(userValidate.getTelefon_konta()));
                session.setAttribute("permissions", String.valueOf(userValidate.getUprawnienia_konta()));
                session.setAttribute("ranga", String.valueOf(userValidate.getUprawnienia_konta()));
                session.setAttribute("accpass",String.valueOf(userValidate.getHaslo_konta()));
                if((userValidate.equals("User")))
                        session.setMaxInactiveInterval(10 * 60);

                req.getRequestDispatcher("index.jsp").forward(req, resp);
                 } 
             else {
                req.setAttribute("errMessageLogowanie", "Podano błędne dane.");
                req.getRequestDispatcher(PAGE).forward(req, resp);
            }

            
        } catch (IOException e1) {
            req.setAttribute("errConn", "error with database connection");
        } catch (Exception e2) {
            req.getRequestDispatcher(PAGE2).forward(req, resp);
        }

}
}
