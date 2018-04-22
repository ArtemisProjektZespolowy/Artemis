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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
@WebServlet(name = "ZamowienieServlet", urlPatterns = {"/zamowienie"})
public class ZamowienieServlet extends HttpServlet {

    static Connection conn;
    static PreparedStatement pst;
    static PreparedStatement pst2;
    static PreparedStatement pst3;
    ResultSet res = null;
    Statement stat = null;
    Statement stat2 = null;
    ResultSet res2 = null;

    private static final String INDEX = "index.jsp";
    private static final String ERROR = "serverError.jsp";
    private static final String LOGIN = "sign_in.jsp";
    private static final String PAYMENTS = "payments.jsp";
    private static final String SUCCESS = "order_success.jsp";

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

            sumConvert = String.valueOf(session.getAttribute("sumOreder"));
            sumOrder = Double.parseDouble(sumConvert);

            try {

                conn = PolaczenieDB.getConnection();
                stat = conn.createStatement();
                res = stat.executeQuery("select max(seria_zamowienia) AS maxValue from zP");
                res.next();
                id_seria_zamowienia = res.getInt("maxValue") + 1;
                conn.close();
//              out.println(res.getInt("LargestPrice"));

            } catch (Exception e) {
                req.getRequestDispatcher(ERROR).forward(req, resp);
                return;
            }

            try {

                Map<Integer, Integer> koszyk = (Map<Integer, Integer>) session.getAttribute("koszyk");

                Set<Map.Entry<Integer, Integer>> entrySet = koszyk.entrySet();
                for (Iterator iterator = entrySet.iterator(); iterator.hasNext();) {
                    Map.Entry<Integer, Integer> entry = (Map.Entry<Integer, Integer>) iterator.next();

                    conn = PolaczenieDB.getConnection();
                    stat2 = conn.createStatement();
                    String data = "select kod from klucze k join  produkt p on k.id_produktu=p.id_produktu where k.czy_zuzyty =false and p.id_produktu=" + entry.getKey() + "";
                    res2 = stat2.executeQuery(data);

                    for (int i = 0; i < entry.getValue(); i++) {

                        res2.next();
                        String s = res2.getString("kod");

                        conn = PolaczenieDB.getConnection();
                        pst3 = conn.prepareCall("UPDATE klucze SET czy_zuzyty=? where kod='" + s + "'");
                        pst3.setBoolean(1, true);

                        int wynik = pst3.executeUpdate();
                        pst3.close();
                        conn.close();

                        conn = PolaczenieDB.getConnection();
                        pst = conn.prepareStatement("insert into zP(seria_zamowienia,id_produktu,kod_gry) values(?,?,?)");
                        pst.setInt(1, id_seria_zamowienia);
                        pst.setInt(2, entry.getKey());
                        pst.setString(3, s);
                        status = pst.executeUpdate();
                        conn.close();
                    }
                    res2.close();
                    conn.close();

                }

            } catch (Exception ex) {
                req.getRequestDispatcher(ERROR).include(req, resp);
                return;
            }

            // operacje na tablicy zK
            try {

                conn = PolaczenieDB.getConnection();
                stat = conn.createStatement();
                res = stat.executeQuery("select max(id_zp) AS maxValue from zP");
                res.next();
                id_id_zap = res.getInt("maxValue");
                conn.close();

                sessionEmail = String.valueOf(session.getAttribute("User"));

                conn = PolaczenieDB.getConnection();
                stat = conn.createStatement();
                res = stat.executeQuery("select id_konto from konto where email='" + sessionEmail + "'");
                res.next();
                getEmail = res.getInt("id_konto");
                conn.close();

                String data_zamowienia = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
                conn = PolaczenieDB.getConnection();

                pst2 = conn.prepareStatement("insert into zK(id_zp,id_konto,id_zk,suma,data_zamowienia, rodzaj_platnosci) values(?,?,?,?,?,?)");

                pst2.setInt(1, id_id_zap);
                pst2.setInt(2, getEmail);
                pst2.setInt(3, id_seria_zamowienia);
                pst2.setDouble(4, sumOrder);
                pst2.setTimestamp(5, Timestamp.valueOf(data_zamowienia));
                pst2.setString(6, req.getParameter("rodzaj_platnosci"));
                statusOrdfer = pst2.executeUpdate();
                conn.close();
                if (statusOrdfer > 0) {
                    Map<Integer, Integer> koszyk = (Map<Integer, Integer>) session.getAttribute("koszyk");
                    koszyk.clear();
                    req.getRequestDispatcher(SUCCESS).forward(req, resp);
                    return;
                } else {
                    req.getRequestDispatcher(ERROR).forward(req, resp);
                    return;
                }

            } catch (Exception e) {
//              out.println("syf");
            }
            req.getRequestDispatcher(ERROR).include(req, resp);
            return;

        } else {//jezeli rodzaj platnosci jest null 

            req.getRequestDispatcher(PAYMENTS).forward(req, resp);
        }

    }
}
