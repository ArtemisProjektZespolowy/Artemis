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
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.PolaczenieDB;
import system.rejestracji.RegisterBean;
import system.rejestracji.RegisterDao;

/**
 *
 * @author Iluvris
 */
@WebServlet(name = "obslugaWiadomosciServlet", urlPatterns = {"/obslugaWiadomosci"})
public class obslugaWiadomosciServlet extends HttpServlet {

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
        
//           out.println(req.getParameter("widok"));
//           out.println(req.getParameter("widok2"));
if(req.getParameter("widok2") == null){}else{
      switch (req.getParameter("widok2")) {
          case "glowna":
              session.setAttribute("typ_wiadomosci", "glowna");
                  req.getRequestDispatcher(PAGE).include(req, resp);
                    return;
          case "spolecznosc":
              session.setAttribute("typ_wiadomosci", "spolecznosc");
                 req.getRequestDispatcher(PAGE).include(req, resp);
                    return;
          case "informacje":
              session.setAttribute("typ_wiadomosci", "informacje");
                  req.getRequestDispatcher(PAGE).include(req, resp);
                    return;
          case "support":
              session.setAttribute("typ_wiadomosci", "support");
                  req.getRequestDispatcher(PAGE).include(req, resp);
                    return;
          default:
              break;
      }
        }
        if(req.getParameter("widok") == null){
           req.getRequestDispatcher(PAGE).include(req, resp);
                  return;
                    
        }
        
        if(req.getParameter("widok").equals("NowaWiadomosc")){ // wchodzimy do okna tworzenia wiadomosci
            
            req.setAttribute("KontrolerWiodku", "nw");
            req.getRequestDispatcher(PAGE).include(req, resp);
            return;
        }else if(req.getParameter("widok").equals("wyslijWiadomosc")){  // wysylanie wiadomosci
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
            
            nowa.setTytul(req.getParameter("tytul"));
            nowa.setStatus_nadawcy(true);
            nowa.setStatus_odbiorcy(false);
            nowa.setData_zgloszenia(Timestamp.valueOf(data_zgloszenia));
            nowa.setData_zamkniecia(null);
            nowa.setTyp_wiadomosci(typ_wiadomosci.glowna.toString());
            nowa.setRodzaj_problemu(null);
            nowa.setEmail_nadawcy(String.valueOf(session.getAttribute("User")));
            nowa.setEmail_odbiorcy(req.getParameter("email_odbiorcy"));
            nowa.setId_konto((Integer)session.getAttribute("id_konta"));
            nowa.setStatus_wiadomosci(false);
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
              obj.setEmail_odbiorcy_k(req.getParameter("email_odbiorcy"));
              obj.setData_wyslania(Timestamp.valueOf(data_zgloszenia));
              obj.setTresc_wiadomosci(req.getParameter("text_wiadomosci"));
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

//                    req.setAttribute("KontrolerWiodku", null);
//                    req.getRequestDispatcher(PAGE).include(req, resp);
//                    return;
        }
        
    
     
        req.setAttribute("id_wiadomosci", req.getParameter("id_wiadomosci")); // przypisanie id każdej wiadomosci
      
        int id_wiadomosci = Integer.parseInt( req.getParameter("id_wiadomosci"));
        String data_wyslania = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
        String email_nadawcy = String.valueOf(session.getAttribute("User"));
        
        
        
        
        if(null== req.getParameter("widok")){   
            req.setAttribute("KontrolerWiodku", null);
            req.getRequestDispatcher(PAGE).include(req, resp);
             return;
        }else switch (req.getParameter("widok")) { // otwieramy wiadomość - skończone
          case "OknoWiadomosci":
              try {
                  
             
              conn = PolaczenieDB.getConnection(); 
              statement = conn.createStatement();
              resultSet = statement.executeQuery("select email_nadawcy, email_odbiorcy, status_nadawcy, status_odbiorcy from poczta where id_wiadomosci="+id_wiadomosci+"");
              resultSet.next();
              String email_nadawcy2 = resultSet.getString("email_nadawcy");
              String email_odbiorcy2 = resultSet.getString("email_odbiorcy");
              Boolean status_nadawcy = resultSet.getBoolean("status_nadawcy");
              Boolean status_odbiorcy = resultSet.getBoolean("status_odbiorcy");
              resultSet.close();
              conn.close();
              
              if((!(email_nadawcy2.equals(session.getAttribute("User"))) && (status_nadawcy == true && status_odbiorcy == false))){
              
              
                   try {
                
                conn = PolaczenieDB.getConnection(); 
                ps = conn.prepareCall("UPDATE poczta SET status_nadawcy=?, status_odbiorcy=? where id_wiadomosci="+id_wiadomosci+"");
                ps.setBoolean(1, true);
                ps.setBoolean(2, true);
                int wynik = ps.executeUpdate();
                ps.close();
                conn.close();
                if(wynik > 0){
                 req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                 req.getRequestDispatcher(PAGE).include(req, resp);
                 return;
                }else{
                    req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                    req.getRequestDispatcher(PAGE3).include(req, resp);
                    return;
                }
                 } catch (Exception e) {
                      req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                    req.getRequestDispatcher(PAGE3).include(req, resp);
                    return;
            }
              }else if((!(email_odbiorcy2.equals(session.getAttribute("User"))) && (status_nadawcy == false && status_odbiorcy == true))){
                   try {
                
                conn = PolaczenieDB.getConnection(); 
                ps = conn.prepareCall("UPDATE poczta SET status_nadawcy=?, status_odbiorcy=? where id_wiadomosci="+id_wiadomosci+"");
                ps.setBoolean(1, false);
                ps.setBoolean(2, false);
                int wynik = ps.executeUpdate();
                ps.close();
                conn.close();
                if(wynik > 0){
                 req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                 req.getRequestDispatcher(PAGE).include(req, resp);
                 return;
                }else{
                    req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                    req.getRequestDispatcher(PAGE3).include(req, resp);
                    return;
                }
                 } catch (Exception e) {
                      req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                    req.getRequestDispatcher(PAGE3).include(req, resp);
                    return;
            }
              }else{
                 req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                 req.getRequestDispatcher(PAGE).include(req, resp); 
                 return;
              
              }
               } catch (Exception e) {
                      req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                 req.getRequestDispatcher(PAGE3).include(req, resp); 
                 return;
              }
             
          case "wyslijOdpowiedz": // wywyłamy odpwoiedź - nie skończone bez aktualizacji statusów zmiana tf na ft
              try {
                  
                 
              conn = PolaczenieDB.getConnection(); 
              statement = conn.createStatement();
              resultSet = statement.executeQuery("select email_nadawcy, email_odbiorcy, status_nadawcy, status_odbiorcy from poczta where id_wiadomosci="+id_wiadomosci+"");
              resultSet.next();
              String email_nadawcy2 = resultSet.getString("email_nadawcy");
              String email_odbiorcy2 = resultSet.getString("email_odbiorcy");
              Boolean status_nadawcy = resultSet.getBoolean("status_nadawcy");
              Boolean status_odbiorcy = resultSet.getBoolean("status_odbiorcy");
              resultSet.close();
              conn.close();
              
                     if((session.getAttribute("User").equals(email_odbiorcy2) && (status_nadawcy == true && status_odbiorcy == true) || session.getAttribute("User").equals(email_odbiorcy2) && (status_nadawcy == false && status_odbiorcy == false) || session.getAttribute("User").equals(email_odbiorcy2) && (status_nadawcy == false && status_odbiorcy == true))){
                         
                               try {
                
                conn = PolaczenieDB.getConnection(); 
                ps = conn.prepareCall("UPDATE poczta SET status_nadawcy=?, status_odbiorcy=? where id_wiadomosci="+id_wiadomosci+"");
                ps.setBoolean(1, false);
                ps.setBoolean(2, true);
                int wynik = ps.executeUpdate();
                ps.close();
                conn.close();
                if(wynik > 0){
                    
                    
                     OdpowedzBean obj = new OdpowedzBean();
              obj.setEmail_nadawcy_k(email_nadawcy);
              obj.setEmail_odbiorcy_k(req.getParameter("email_odbiorcy"));
              obj.setData_wyslania(Timestamp.valueOf(data_wyslania));
              obj.setTresc_wiadomosci(req.getParameter("text_odpowedzi"));
              obj.setId_wiadomosci(id_wiadomosci);
              int status = OdpowiedzDao.daneOdpowiedzi(obj);
              if (status > 0) {
                  req.setAttribute("KontrolerWiodku", null);
                  req.getRequestDispatcher(PAGE).include(req, resp);
                  return;  
              }else {
                  req.setAttribute("registerFail", "Nie udało się wysłać odpowiedzi");
                  req.getRequestDispatcher(PAGE3).include(req, resp);
                  return;
              }
                    
                    
                    
               
                }else{
                    req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                    req.getRequestDispatcher(PAGE3).include(req, resp);
                    return;
                }
                 } catch (Exception e) {
                      req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                    req.getRequestDispatcher(PAGE3).include(req, resp);
                    return;
                         
                 }
         
              }else if((session.getAttribute("User").equals(email_nadawcy2) && (status_nadawcy == false && status_odbiorcy == false)) || session.getAttribute("User").equals(email_nadawcy2) && (status_nadawcy == true && status_odbiorcy == true) || session.getAttribute("User").equals(email_nadawcy2) && (status_nadawcy == true && status_odbiorcy == false)){
                  
                              try {
                
                conn = PolaczenieDB.getConnection(); 
                ps = conn.prepareCall("UPDATE poczta SET status_nadawcy=?, status_odbiorcy=? where id_wiadomosci="+id_wiadomosci+"");
                ps.setBoolean(1, true);
                ps.setBoolean(2, false);
                int wynik = ps.executeUpdate();
                ps.close();
                conn.close();
                if(wynik > 0){
                    
              OdpowedzBean obj = new OdpowedzBean();
              obj.setEmail_nadawcy_k(email_nadawcy);
              obj.setEmail_odbiorcy_k(req.getParameter("email_odbiorcy"));
              obj.setData_wyslania(Timestamp.valueOf(data_wyslania));
              obj.setTresc_wiadomosci(req.getParameter("text_odpowedzi"));
              obj.setId_wiadomosci(id_wiadomosci);
              int status = OdpowiedzDao.daneOdpowiedzi(obj);
              if (status > 0) {
                  req.setAttribute("KontrolerWiodku", null);
                  req.getRequestDispatcher(PAGE).include(req, resp);
                  return;  
              }else {
                  req.setAttribute("registerFail", "Nie udało się wysłać odpowiedzi");
                  req.getRequestDispatcher(PAGE3).include(req, resp);
                  return;
              }
                 
                    
                
                }else{
                    req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                    req.getRequestDispatcher(PAGE3).include(req, resp);
                    return;
                }
                 } catch (Exception e) {
                      req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                    req.getRequestDispatcher(PAGE3).include(req, resp);
                    return;
                         
                 }
                  
              }else{
              
              req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                    req.getRequestDispatcher(PAGE2).include(req, resp);
              }
              
             } catch (Exception e) {
                     req.setAttribute("KontrolerWiodku", "otwarcie_wiadomosci");
                    req.getRequestDispatcher(PAGE3).include(req, resp);
                    return;
                    
              }
              
              
        
              
              
             
          default:
              break;
      }
      
        
//        out.println(req.getParameter("id_wiadomosci"));
         
        
   
  
       
    }

}
