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
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

    static Connection conn;
    static PreparedStatement pst;
    static PreparedStatement pst2;
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

        PrintWriter out = resp.getWriter();

        if (req.getParameter("rodzaj_platnosci") != null) {// system zamawiania
         

            int status = 0;
            int statusOrdfer = 0;

            String sumConvert;
            String id_klientConvert;
            double sumOrder = 0;
            int id_seria_zamowienia = 0;
            int id_klentaSession = 0;
            int id_id_zap = 0;

            int getEmail = 0;
            String sessionEmail;

//                 PrintWriter out = resp.getWriter();
//        
//            sumConvert = String.valueOf(session.getAttribute("sumOreder"));
//            sumOrder = Double.parseDouble(sumConvert);
//       out.println(sumOrder);
//                        req.getRequestDispatcher(PAGE).include(req, resp);

            try {

                conn = PolaczenieDB.getConnection();
                stat = conn.createStatement();
                res = stat.executeQuery("select max(id_zP) AS maxValue from zP");
                res.next();
                id_seria_zamowienia = res.getInt("maxValue") + 1;
                conn.close();
//              out.println(res.getInt("LargestPrice"));
              req.getRequestDispatcher("serverError.jsp").forward(req, resp);
             
            } catch (Exception e) {
              req.getRequestDispatcher(LOGIN).forward(req, resp);
              return;
            }

            try {
//            List<Cart2> list = (List<Cart2>) session.getAttribute("list");
                Map<Integer, Integer> koszyk = (Map<Integer, Integer>) session.getAttribute("koszyk");

                Set<Map.Entry<Integer, Integer>> entrySet = koszyk.entrySet();
                for (Iterator iterator = entrySet.iterator(); iterator.hasNext();) {
                    Map.Entry<Integer, String> entry = (Map.Entry<Integer, String>) iterator.next();
                    String value = entry.getValue();
                    for (int i = 0; i < Integer.parseInt(entry.getValue()); i++) {
                        conn = PolaczenieDB.getConnection();

                        String id_produktu_list = String.valueOf(entry.getKey());

                        int id_produktu = Integer.parseInt(id_produktu_list);

                        pst = conn.prepareStatement("insert into zP(id_zP,id_produktu) values(?,?)");

                        pst.setInt(1, id_seria_zamowienia);
                        pst.setInt(2, id_produktu);
                        status = pst.executeUpdate();
                        conn.close();
                    }
                       out.println(entry.getValue());
                }

//            for (int i = 0; i < koszyk.size(); i++) {
//                conn = PolaczenieDB.getConnection();
//
//                String id_produktu_list = String.valueOf(list.get(i));
//
//                int id_produktu = Integer.parseInt(id_produktu_list);
//
//                pst = conn.prepareStatement("insert into zamP(id_zamowieniaP,id_produkt) values(?,?)");
//
//                pst.setInt(1, id_seria_zamowienia);
//                pst.setInt(2, id_produktu);
//                status = pst.executeUpdate();
//                conn.close();
//            }
            } catch (Exception ex) {
               req.getRequestDispatcher(LOGIN).include(req, resp);
               return;
            }
            req.getRequestDispatcher(LOGIN).include(req, resp);
            return;

//                try {
//
//              conn = PolaczenieDB.getConnection(); 
//              stat = conn.createStatement();
//              res = stat.executeQuery("select max(id_zap) AS maxValue from zamP");
//              res.next();
//              id_id_zap = res.getInt("maxValue");
//              conn.close();
//              
//              sessionEmail = String.valueOf(session.getAttribute("getEmail"));
//              
//              conn = PolaczenieDB.getConnection(); 
//              stat = conn.createStatement();
//              res = stat.executeQuery("select id_klient from klient where email='"+sessionEmail+"'");
//              res.next();
//              getEmail = res.getInt("id_klient");
//              conn.close();
//              
//              
//              
////              out.println(id_id_zap);
////              out.println(getEmail);
////              out.println(id_seria_zamowienia);
////              out.println(sumOrder);
//              
//              req.getRequestDispatcher(INDEX).include(req, resp);
//
//              conn = PolaczenieDB.getConnection();
//
//              pst2 = conn.prepareStatement("insert into zamK(id_zap,id_klient,id_zamowieniaK,suma) values(?,?,?,?)");
//
//              pst2.setInt(1, id_id_zap);
//              pst2.setInt(2, getEmail);
//              pst2.setInt(3, id_seria_zamowienia );
//              pst2.setDouble(4, sumOrder);
//              statusOrdfer = pst2.executeUpdate();
//              conn.close();
//              if(statusOrdfer > 0){
//                  
//                req.getRequestDispatcher(PAGE2).forward(req, resp);
//              }else{
//                  
//              }
//
//                
//          } catch (Exception e) {
////              out.println("syf");
//        }
//          
        } else {//jezeli rodzaj platnosci jest null 

            req.getRequestDispatcher(INDEX).forward(req, resp);
        }

    }

}
