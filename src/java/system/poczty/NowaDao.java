/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.poczty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import src.PolaczenieDB;

/**
 *
 * @author Iluvris
 */
public class NowaDao {
    
    
         static Connection conn;
    static  PreparedStatement pst;
    
    
    public static int daneWiadomosci(NowaBean n) {
       
        
     

        
        
       int status = 0;

        try {
            conn = PolaczenieDB.getConnection();
             pst = conn.prepareStatement("insert into poczta(tytul, status_nadawcy, status_odbiorcy, data_zgloszenia, data_zamkniecia, typ_wiadomosci, rodzaj_problemu, email_nadawcy, email_odbiorcy, id_konto, status_wiadomosci)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            pst.setString(1, n.getTytul());
            pst.setBoolean(2, n.getStatus_nadawcy());
            pst.setBoolean(3, n.getStatus_odbiorcy());
            pst.setTimestamp(4, n.getData_zgloszenia());
            pst.setTimestamp(5, n.getData_zamkniecia());
            pst.setString(6, n.getTyp_wiadomosci());
            pst.setString(7, n.getRodzaj_problemu());
            pst.setString(8, n.getEmail_nadawcy());
            pst.setString(9, n.getEmail_odbiorcy());
            pst.setInt(10, n.getId_konto());
            pst.setBoolean(11, n.getStatus_wiadomosci());
            status = pst.executeUpdate();
            conn.close();
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        return status;
    }
    
    
}
