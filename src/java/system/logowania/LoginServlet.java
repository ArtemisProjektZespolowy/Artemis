/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.logowania;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Iluvris
 */

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
private static final String PAGE = "sign_in.jsp";




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
        session.invalidate();
//        List<Cart2> list = (List<Cart2>) session.getAttribute("list");
//        list.clear();
        
        boolean error = false;
        resp.setContentType("text/html");
    
        if(email.trim().isEmpty()){
            req.setAttribute("errMessageEmail", "Enter email");
        }
        
        if(haslo.trim().isEmpty()){
            req.setAttribute("errMessageHaslo", "Enter password");
        }
        
        LoginBean loginBean = new LoginBean();
        
        loginBean.setEmail(email);
        loginBean.setHaslo(haslo);

        LoginDao loginDao = new LoginDao();

        try {
            String userValidate = loginDao.authenticateUser(loginBean);

            if (userValidate.equals("Admin") || userValidate.equals("Pracownik") || userValidate.equals("User") ) {
              session = req.getSession(); //Creating a session
                session.setAttribute("User", String.valueOf(email)); //setting session attribute
                session.setAttribute("permissions", String.valueOf(userValidate));
                if((userValidate.equals("User")))
                        session.setMaxInactiveInterval(10 * 60);

                req.getRequestDispatcher("index.jsp").forward(req, resp);
                 } 
             else {
                req.setAttribute("errMessageLogowanie", userValidate);
                

                
            }
        } catch (IOException e1) {
            req.setAttribute("errConn", "error with database connection");
        } catch (Exception e2) {
            req.setAttribute("errConn", "error with database connection");
        }
        
        
      
     req.getRequestDispatcher(PAGE).include(req, resp);
        
    }

    

}
