/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.poczty;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
@WebServlet(name = "obslugaSupportuServlet", urlPatterns = {"/support"})
public class obslugaSupportuServlet extends HttpServlet {
 private static final String PAGE = "message.jsp";
  private static final String PAGE2 = "index.jsp";
  private static final String PAGE3 = "serverError.jsp";
  static Connection conn;
  static PreparedStatement ps = null;
  static Statement statement = null;
  static ResultSet resultSet = null;
   static enum typ_wiadomosci{
    glowna, spolecznosc, informacja, support;
}

  @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(PAGE);
    }
  
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        PrintWriter out = resp.getWriter();
        

         String data_zgloszenia = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

            NowaBean nowa = new NowaBean();
//            out.println(req.getParameter("tytul"));
//            out.println(data_zgloszenia);
//            out.println(typ_wiadomosci.glowna.toString());
//            out.println(String.valueOf(session.getAttribute("User")));
//            out.println(req.getParameter("email_odbiorcy"));
//            out.println((Integer)session.getAttribute("id_konta"));
//            out.println();
//            out.println();

                try {
            
       
              conn = PolaczenieDB.getConnection(); 
              statement = conn.createStatement();
              resultSet = statement.executeQuery("select email from konto where id_uprawnienia=2 ORDER BY RANDOM() LIMIT 1");
              resultSet.next();
              String emial_pracownika = resultSet.getString("email");
              conn.close();
        
            
            nowa.setTytul(req.getParameter("tytul"));
            nowa.setStatus_nadawcy(true);
            nowa.setStatus_odbiorcy(false);
            nowa.setData_zgloszenia(Timestamp.valueOf(data_zgloszenia));
            nowa.setData_zamkniecia(null);
            nowa.setTyp_wiadomosci(typ_wiadomosci.support.toString());
            nowa.setRodzaj_problemu(req.getParameter("rodzaj_problemu"));
            nowa.setEmail_nadawcy(String.valueOf(session.getAttribute("User")));
            nowa.setEmail_odbiorcy(emial_pracownika);
            nowa.setId_konto((Integer)session.getAttribute("id_konta"));
            nowa.setStatus_wiadomosci(true);
              int status = NowaDao.daneWiadomosci(nowa);
              if (status > 0) {
                  try {
                      
                
              conn = PolaczenieDB.getConnection(); 
              statement = conn.createStatement();
              resultSet = statement.executeQuery("select max(id_wiadomosci) AS maxID from poczta;");
              resultSet.next();
              int id_wiadomosci = resultSet.getInt("maxID");
              conn.close();
              
              
                 
              OdpowedzBean obj = new OdpowedzBean();
              
              obj.setEmail_nadawcy_k((String)session.getAttribute("User"));
              obj.setEmail_odbiorcy_k(emial_pracownika);
              obj.setData_wyslania(Timestamp.valueOf(data_zgloszenia));
              obj.setTresc_wiadomosci(req.getParameter("trescWiadomosci"));
              obj.setId_wiadomosci(id_wiadomosci);
              int status2 = OdpowiedzDao.daneOdpowiedzi(obj);
              if (status2 > 0) {
                  req.setAttribute("KontrolerWiodku", null);
                  req.getRequestDispatcher(PAGE).include(req, resp);
                  return;  
              }else {
                  req.setAttribute("registerFail", "Nie udało się wysłać odpowiedzi");
                  req.getRequestDispatcher(PAGE3).include(req, resp);
                  return;
              }
                     }catch (Exception e) {
                    }
                  req.setAttribute("KontrolerWiodku", null);
                  req.getRequestDispatcher(PAGE).include(req, resp);
                  return;  
              }else {
                  req.setAttribute("registerFail", "Nie udało się wysłać odpowiedzi");
                  req.getRequestDispatcher(PAGE3).include(req, resp);
                  return;
              }


        
               } catch (Exception e) {
        }
    
     
   
         
        
   
  
       
    }

}
