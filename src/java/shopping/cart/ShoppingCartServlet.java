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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
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
@WebServlet(name = "ShoppingCartServlet", urlPatterns = {"/shoppingcart"})
public class ShoppingCartServlet extends HttpServlet {

    private static final String PAGE = "shoppingCard.jsp";
    private static final String PAGE2 = "shoppingCard.jsp";
    private static final String PAGE3 = "emptyCard.jsp";

    static Connection conn;
    static PreparedStatement pst;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(PAGE);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        List<Integer> list = (List<Integer>) session.getAttribute("list");

        Map<Integer, Integer> koszyk = (Map<Integer, Integer>) session.getAttribute("koszyk"); // towrzymy mapę dla id_produktu i ilosci

        int id_product1 = Integer.parseInt(req.getParameter("btnBuy"));
        if (koszyk == null) {
            koszyk = new TreeMap<>();
        }
        if(koszyk.containsKey(id_product1)){
            req.getRequestDispatcher(PAGE).forward(req, resp);
        }else{
            koszyk.put(id_product1, 1);
             session.setAttribute("koszyk", koszyk);
        req.getRequestDispatcher(PAGE).forward(req, resp);
        }
        

       

//        if (true) {  // kiedy dodajemy gry do koszyka
//            int id_product = Integer.parseInt(req.getParameter("btnBuy"));
//            if (list == null) {
//                list = new ArrayList<>();
//
//            }
//
//            list.add(id_product);
//
//            session.setAttribute("list", list);
//            req.getRequestDispatcher(PAGE).forward(req, resp);
//        }

//
//        if (Boolean.valueOf(req.getParameter("iconCard")) == true) { // kiedy przechodzimy do koszyka jeśli lista jest pusta
//            if (list == null) {
//                list = new ArrayList<>();
//            }
//            if (list.isEmpty()) {
//                req.setAttribute("emptyCard", "Your shoping card is empty :(");
//
//                req.getRequestDispatcher(PAGE3).forward(req, resp);
//            }
//
//        }
//
//        if (Boolean.valueOf(req.getParameter("iconCard")) == true && !koszyk.isEmpty()) { // do koszyka lista cos zawiera
//            req.setAttribute("anyGame", true);
//            req.getRequestDispatcher(PAGE2).forward(req, resp);
//        }
//
//        for (int i = 0; i < list.size(); i++) {
////            out.println("Name " + list.get(i));
//        }

    }

}
