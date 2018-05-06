/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.konta;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import src.PolaczenieDB;


/**
 *
 * @author Patryk
 */
@WebServlet(name = "DaneServlet", urlPatterns = {"/changedane"})
public class DaneServlet extends HttpServlet {


    private static final String PAGE = "changemydata.jsp";
    private static final String PAGE2 = "serverError.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(PAGE);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

             // przygotowanie polaczenia
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        HttpSession session = req.getSession();
        
        // zabezpieczenie przez redundancja danych
        Boolean insert = true;

        // kodowanie znaków przy odbieraniu i wysyłaniu wartości
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        String imie = req.getParameter("imie");
        String nazwisko = req.getParameter("nazwisko");
        String telefon = req.getParameter("telefon");
        String kod_pocztowy = req.getParameter("kod_pocztowy");
        String miasto = req.getParameter("miasto");
        String nr_domu = req.getParameter("nr_domu");
        String ulica = req.getParameter("ulica");
        String email = req.getParameter("email");
        String haslo = req.getParameter("haslo");
        String id_konta = session.getAttribute("id_konta").toString();
        String email_konta = session.getAttribute("User").toString();
        String telefon_konta = session.getAttribute("telefon_konta").toString();
        //po przedladowaniu strony dane z formularza nie zostana utracone
        
        req.setAttribute("imie", imie);
        req.setAttribute("nazwisko", nazwisko);
        req.setAttribute("telefon", telefon);
        req.setAttribute("kod_pocztowy", kod_pocztowy);
        req.setAttribute("miasto", miasto);
        req.setAttribute("nr_domu", nr_domu);
        req.setAttribute("ulica", ulica);
        req.setAttribute("email", email);
        req.setAttribute("theemail",haslo);
        
        try {
            //tworzenia połaczenia
            con = PolaczenieDB.getConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select telefon, email from konto");



           while (resultSet.next()) {
                String sprawdzTelefon = resultSet.getString("telefon");
                String sprawdzEmail = resultSet.getString("email");
               
               if (email.equals(sprawdzEmail)) {
                    if(email.equals(email_konta))
                        continue;
                    req.setAttribute("emailDB", email);
                    req.setAttribute("zajetyEmail", "Adres e-mail jest już zajęty!");
                    insert = false;
                    break;
                    
                }else if(telefon.equals(sprawdzTelefon)){
                    if(telefon.equals(telefon_konta))
                        continue;
                    req.setAttribute("telefonDB", telefon);
                    req.setAttribute("zajetyTelefon", "Numer telefonu jest już zajęty!");
                    insert = false;
                    break;
                }
               
            }

            con.close();
           
          

        } catch (Exception e) {
        }
        if (insert == true) {
            KontoBean obj = new KontoBean();
            obj.setImie(imie);
            obj.setNazwisko(nazwisko);
            obj.setTelefon(telefon);
            obj.setKod_pocztowy(kod_pocztowy);
            obj.setMiasto(miasto);
            obj.setNr_domu(nr_domu);
            obj.setUlica(ulica);
            obj.setEmail(email);
            obj.setHaslo(haslo);
            obj.setCurrent_email(email_konta);
            int status = 0;  
                
                if(session.getAttribute("accpass").equals(haslo)){
                status = DaneDao.updateDane(obj, session);

            if (status > 0) {
                
                req.setAttribute("updateDaneSucces", "Zmiana danych przebiegła pomyślnie!");
                req.setAttribute("imie", "");
                req.setAttribute("nazwisko", "");
                req.setAttribute("telefon", "");
                req.setAttribute("kod_pocztowy", "");
                req.setAttribute("miasto", "");
                req.setAttribute("nr_domu", "");
                req.setAttribute("ulica", "");
                req.setAttribute("email", "");
                session.removeAttribute("User");
                session.setAttribute("User", email);
                session.removeAttribute("telefon_konta");
                session.setAttribute("telefon_konta", telefon);
                req.getRequestDispatcher(PAGE).include(req, resp); 
            }else {
                req.setAttribute("updateDaneFail", "Nie udało się zmienić danych");
                 req.getRequestDispatcher(PAGE).include(req, resp); 
            }
            
            }else{   
            req.setAttribute("updateDaneFail", "Uwierzytelnianie nie powiodło się!");
            req.getRequestDispatcher(PAGE).include(req, resp);
        }
        

        
        
    }

    }
}
