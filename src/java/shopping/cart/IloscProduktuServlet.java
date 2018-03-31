/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Iluvris
 */
@WebServlet(name = "IloscProduktuServlet", urlPatterns = {"/iloscproduktu"})
public class IloscProduktuServlet extends HttpServlet {

    private static final String PAGE = "shoppingCard.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();

        int baseIlosc = 0;
        PrintWriter out = resp.getWriter();
        
         
        
        try {
            Map<Integer, Integer> koszyk = (Map<Integer, Integer>) session.getAttribute("koszyk");

            Set<Map.Entry<Integer, Integer>> entrySet = koszyk.entrySet();
            for (Iterator iterator = entrySet.iterator(); iterator.hasNext();) {
                Map.Entry<Integer, Integer> entry = (Map.Entry<Integer, Integer>) iterator.next();

                if (req.getParameter("minus") != null ) {
                    int minus = Integer.parseInt(req.getParameter("minus"));
                    if (entry.getKey().equals(minus)) {
                        baseIlosc = entry.getValue();
                        if (baseIlosc == 1) {
                            koszyk.replace(entry.getKey(), 1);
                            req.getRequestDispatcher(PAGE).include(req, resp);
                            return;
                        }
                        baseIlosc--;
                        koszyk.replace(entry.getKey(), baseIlosc);
                        req.getRequestDispatcher(PAGE).include(req, resp);
                    }
                } else {
                }
                if (req.getParameter("plus") != null) {
                        
                    baseIlosc = entry.getValue();
                    baseIlosc++;
                    int plus = Integer.parseInt(req.getParameter("plus"));
                    if (entry.getKey().equals(plus)) {
                        koszyk.replace(entry.getKey(), baseIlosc);
                        req.getRequestDispatcher(PAGE).include(req, resp);
                        
                      
                    }
                        
                } else {
                }
                
                if (req.getParameter("inputUpdate") != null && req.getParameter("suppID") != null && req.getParameter("minus") == null && req.getParameter("plus") == null) {
                    
                          int suppID = Integer.parseInt(req.getParameter("suppID"));
                          
                          if(!req.getParameter("inputUpdate").matches("[0-9]+")){
                                koszyk.replace(suppID, 1);
                            req.getRequestDispatcher(PAGE).include(req, resp);
                            return;
                          }
                          int inputUpdate = Integer.parseInt(req.getParameter("inputUpdate"));

                         if(inputUpdate <= 1){
                            koszyk.replace(suppID, 1);
                            req.getRequestDispatcher(PAGE).include(req, resp);
                            return;
                        }else if(entry.getKey().equals(suppID)){
                            koszyk.replace(entry.getKey(), inputUpdate);
                            req.getRequestDispatcher(PAGE).include(req, resp);
                        }else{  
                        }
                         
                           
                        }else{}
                    
                        
                    
                    
                
                
                
            }
            
            
            session.setAttribute("delCard", null);
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
  
       
    }
}
