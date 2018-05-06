    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.konta;

import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import src.PolaczenieDB;

/**
 *
 * @author Patryk
 */
public class DaneDao {
    static Connection conn;
    static  PreparedStatement pst;

    
    
    public static int updateDane(KontoBean u, HttpSession session) {
       int status = 0;

        try {
            conn = PolaczenieDB.getConnection();
             pst = conn.prepareStatement("update konto set imie=?, nazwisko=?, telefon=?, kod_pocztowy=?, miasto=?, nr_mieszkania=?, ulica=?, email=? where id_konto = "+session.getAttribute("id_konta")+";");       
            pst.setString(1, u.getImie());
            pst.setString(2, u.getNazwisko());
            pst.setString(3, u.getTelefon());
            pst.setString(4, u.getKod_pocztowy());
            pst.setString(5, u.getMiasto());
            pst.setString(6, u.getNr_domu());
            pst.setString(7, u.getUlica());
            pst.setString(8, u.getEmail());

            status = pst.executeUpdate();
            conn.close();
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        return status;
    }
    
    public static int updatePass(KontoBean u, HttpSession session) {
        int status = 0;

        try {
            conn = PolaczenieDB.getConnection();
             pst = conn.prepareStatement("update konto set haslo=? where id_konto = "+session.getAttribute("id_konta")+";");       
            pst.setString(1, u.getHaslo());

            status = pst.executeUpdate();
            conn.close();
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        return status;
}
    
}
    
    
