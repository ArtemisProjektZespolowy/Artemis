/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static shopping.cart.OrderServlet.conn;
import src.PolaczenieDB;

/**
 *
 * @author Iluvris
 */
@WebServlet(name = "DeleteProductCard", urlPatterns = {"/deleteCard"})
public class DeleteProductCard extends HttpServlet {

    private static final String PAGE = "shoppingCard.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        


        
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();

        int id_del = 0;

        int del = Integer.parseInt(req.getParameter("cardID"));

        try {
            Map<Bean_ID,Bean_Ilosc> koszyk = (Map<Bean_ID,Bean_Ilosc>) session.getAttribute("koszyk");

                  Set<Map.Entry<Bean_ID, Bean_Ilosc>> entrySet = koszyk.entrySet();
         for (Iterator iterator = entrySet.iterator(); iterator.hasNext();) {
             Entry<Integer, Integer> entry = (Map.Entry<Integer, Integer>) iterator.next();
         
       
         if(entry.getKey().equals(del)) 
             {
                 iterator.remove(); 
             }  
            
               
         }
            session.setAttribute("delCard", null);

        } catch (Exception ex) {
            System.out.println(ex);
        }

        req.getRequestDispatcher(PAGE).include(req, resp);

    }

}
