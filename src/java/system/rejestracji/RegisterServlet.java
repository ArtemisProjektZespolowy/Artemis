/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.rejestracji;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    private static final String PAGE = "register.jsp";
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

        // zabezpieczenie przez redundancja danych
        Boolean insert = true;

        // kodowanie znaków przy odbieraniu i wysyłaniu wartości
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // pobranie paramentów z formularza
        String imie = req.getParameter("imie");
        String nazwisko = req.getParameter("nazwisko");
        String telefon = req.getParameter("telefon");
        String kod_pocztowy = req.getParameter("kod_pocztowy");
        String miasto = req.getParameter("miasto");
        String nr_domu = req.getParameter("nr_domu");
        String ulica = req.getParameter("ulica");
        String email = req.getParameter("email");
        String haslo = req.getParameter("haslo");
       
        //po przedladowaniu strony dane z formularza nie zostana utracone
        req.setAttribute("imie", imie);
        req.setAttribute("nazwisko", nazwisko);
        req.setAttribute("telefon", telefon);
        req.setAttribute("kod_pocztowy", kod_pocztowy);
        req.setAttribute("miasto", miasto);
        req.setAttribute("nr_domu", nr_domu);
        req.setAttribute("ulica", ulica);
        req.setAttribute("email", email);
        
        
        
        
//        if (imie.trim().isEmpty()) {
//            req.setAttribute("errorImie", "Enter name");
//        }
//        if (nazwisko.trim().isEmpty()) {
//            req.setAttribute("errorNazwisko", "Enter surnane");
//        }
//        if (telefon.trim().isEmpty()) {
//            req.setAttribute("errorTelefon", "Enter phone");
//        }
//        if (email.trim().isEmpty()) {
//            req.setAttribute("errorEmail", "Enter email");
//        }
//        if (haslo.trim().isEmpty()) {
//            req.setAttribute("errorHaslo", "Enter password");
//        }
        
        try {
            //tworzenia połaczenia
            con = PolaczenieDB.getConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select telefon, email from konto");
            
          
           
           
           while (resultSet.next()) {
                String sprawdzTelefon = resultSet.getString("telefon");
                String sprawdzEmail = resultSet.getString("email");
               
                if(telefon.contains(sprawdzTelefon)){
                    req.setAttribute("telefonDB", telefon);
                    req.setAttribute("zajetyTelefon", "Podany numer telefonu został już użyty");
                    insert = false;
                    break;
                }else if (email.contains(sprawdzEmail)) {
                    req.setAttribute("emailDB", email);
                    req.setAttribute("zajetyEmail", "Konto o podanym adresie już istnieje");
                    insert = false;
                    break;
                }
               
            }
            con.close();
           
          

        } catch (Exception e) {
        }

        if (insert == true) {
            RegisterBean obj = new RegisterBean();
            obj.setImie(imie);
            obj.setNazwisko(nazwisko);
            obj.setTelefon(telefon);
            obj.setKod_pocztowy(kod_pocztowy);
            obj.setMiasto(miasto);
            obj.setNr_domu(nr_domu);
            obj.setUlica(ulica);
            obj.setEmail(email);
            obj.setHaslo(haslo);

            int status = RegisterDao.insertRegister(obj);

            if (status > 0) {
                req.setAttribute("registetrSucces", "Rejestracja przebiegła pomyślnie");
                req.setAttribute("imie", "");
                req.setAttribute("nazwisko", "");
                req.setAttribute("telefon", "");
                req.setAttribute("kod_pocztowy", "");
                req.setAttribute("miasto", "");
                req.setAttribute("nr_domu", "");
                req.setAttribute("ulica", "");
                req.setAttribute("email", "");
                req.getRequestDispatcher(PAGE).include(req, resp); 
                
            } else {
                req.setAttribute("registerFail", "Rejestracja zakończyła się niepowodzeniem");
                 req.getRequestDispatcher(PAGE2).include(req, resp); 
            }
              
        }else{   
            req.getRequestDispatcher(PAGE).include(req, resp);
        }
      

    }

}
