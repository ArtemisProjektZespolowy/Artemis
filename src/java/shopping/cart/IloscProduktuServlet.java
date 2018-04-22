/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.PolaczenieDB;

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
        int dostepna_ilosc = 0;
        //        PrintWriter out = resp.getWriter();

        
        
        try {
            Connection conn = PolaczenieDB.getConnection();
            Statement stat2 = conn.createStatement();
            ResultSet res2 = null;

            Map<Integer, Integer> koszyk = (Map<Integer, Integer>) session.getAttribute("koszyk");

            Set<Map.Entry<Integer, Integer>> entrySet = koszyk.entrySet();
            for (Iterator iterator = entrySet.iterator(); iterator.hasNext();) {
                Map.Entry<Integer, Integer> entry = (Map.Entry<Integer, Integer>) iterator.next();

                if (req.getParameter("minus") != null && req.getParameter("plus") == null) {
                    int minus = Integer.parseInt(req.getParameter("minus"));
                    if (entry.getKey().equals(minus)) {
                        baseIlosc = entry.getValue();
                        if (baseIlosc == 1) {
                            koszyk.replace(entry.getKey(), 1);
                            req.getRequestDispatcher(PAGE).include(req, resp);
                            return;
                        }else if(baseIlosc == 0){
                            koszyk.replace(entry.getKey(), 0);
                            req.getRequestDispatcher(PAGE).include(req, resp);
                            return;
                        }
                        baseIlosc--;
                        koszyk.replace(entry.getKey(), baseIlosc);
                        req.getRequestDispatcher(PAGE).include(req, resp);
                    }
                } else {
                }
                if (req.getParameter("plus") != null && req.getParameter("minus") == null) {

                    String data2 = "select count(k.id_produktu) as dostepnosc  from klucze k join produkt p on k.id_produktu=p.id_produktu where  (p.id_produktu = " + req.getParameter("plus") + " and czy_zuzyty = false)";

                    res2 = stat2.executeQuery(data2);
                    res2.next();

                    dostepna_ilosc = res2.getInt("dostepnosc");
                    baseIlosc = entry.getValue();
                    baseIlosc++;
                    int plus = Integer.parseInt(req.getParameter("plus"));
                    if (dostepna_ilosc <= baseIlosc) {
                        if (entry.getKey().equals(plus)) {
                            koszyk.replace(entry.getKey(), dostepna_ilosc);
                            req.getRequestDispatcher(PAGE).include(req, resp);
                                res2.close();
                                conn.close();
                           return;
                        }
                    } 

                        if (entry.getKey().equals(plus)) {
                            koszyk.replace(entry.getKey(), baseIlosc);
                            req.getRequestDispatcher(PAGE).include(req, resp);
                                res2.close();
                conn.close();
                            return;
                        
                    }
            
                } else {
                }

                if (req.getParameter("inputUpdate") != null && req.getParameter("suppID") != null && req.getParameter("minus") == null && req.getParameter("plus") == null) {

                    int suppID = Integer.parseInt(req.getParameter("suppID"));

                    if (!req.getParameter("inputUpdate").matches("[0-9]+")) {
                        koszyk.replace(suppID, 1);
                        req.getRequestDispatcher(PAGE).include(req, resp);
                        return;
                    }
                    int inputUpdate = Integer.parseInt(req.getParameter("inputUpdate"));

                    if (inputUpdate <= 1) {
                        koszyk.replace(suppID, 1);
                        req.getRequestDispatcher(PAGE).include(req, resp);
                        return;
                    } else if (entry.getKey().equals(suppID)) {
                    String data2 = "select count(k.id_produktu) as dostepnosc  from klucze k join produkt p on k.id_produktu=p.id_produktu where  (p.id_produktu = " + suppID + " and czy_zuzyty = false)";

                    res2 = stat2.executeQuery(data2);
                    res2.next();

                    dostepna_ilosc = res2.getInt("dostepnosc");
                    
                    if(dostepna_ilosc < inputUpdate ){
                         if (entry.getKey().equals(suppID)) {
                            koszyk.replace(entry.getKey(), dostepna_ilosc);
                            req.getRequestDispatcher(PAGE).include(req, resp);

                        }
                    }else{
                      
                        koszyk.replace(entry.getKey(), inputUpdate);
                        req.getRequestDispatcher(PAGE).include(req, resp);
                    }
                        
                        
                    res2.close();
                    conn.close();
                      
                    } else {
                    }

                } else {
                }

            }

            session.setAttribute("delCard", null);

        } catch (Exception ex) {
            System.out.println(ex);
        }

    }
}
