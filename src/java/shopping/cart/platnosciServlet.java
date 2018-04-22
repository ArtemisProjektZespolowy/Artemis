/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdk.nashorn.internal.ir.BreakNode;
import src.PolaczenieDB;
import system.rejestracji.RegisterBean;
import shopping.cart.Cart2;

/**
 *
 * @author Iluvris
 */
@WebServlet(name = "platnosciServlet", urlPatterns = {"/platnosci"})
public class platnosciServlet extends HttpServlet {
     static Connection conn;
    static  PreparedStatement pst;
     static  PreparedStatement pst2;
     ResultSet res = null;
     Statement stat = null;
     
     private static final String INDEX = "index.jsp";
     private static final String PAGE2 = "orderSuccess.jsp";
     private static final String LOGIN = "sign_in.jsp";
     private static final String PAYMENTS = "payments.jsp";
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        HttpSession session = req.getSession();
        
       
        
        if(session.getAttribute("User") == null){// sprawdzam czy uzytkownik jest zalogowany
            req.getRequestDispatcher(LOGIN).forward(req, resp);
            
        }else{  // przejscie do platnosci 
            req.getRequestDispatcher(PAYMENTS).forward(req, resp); 
        }

    }

}
