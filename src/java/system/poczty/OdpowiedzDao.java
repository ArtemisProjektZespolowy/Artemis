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
public class OdpowiedzDao {
    
      static Connection conn;
    static  PreparedStatement pst;
    
    
    public static int daneOdpowiedzi(OdpowedzBean u) {
       
        
        
        java.util.Date date = new java.util.Date();
        String modifiedDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
     
        
        
       int status = 0;
//       if(u.getImie().isEmpty() || u.getNazwisko().isEmpty()|| u.getTelefon().isEmpty() || u.getKod_pocztowy().isEmpty() || u.getEmail().isEmpty() || u.getHaslo().isEmpty()){
//           status = 0;
//           return status;
//       }
        try {
            conn = PolaczenieDB.getConnection();
//            pst = conn.prepareStatement("insert into konto(imie,nazwisko,telefon,kod_pocztowy,miasto,nr_mieszkania,ulica,email,haslo,data_rejestracji, id_uprawnienia) values(?,?,?,?,?,?,?,?,?'"+modi12fiedDate+"',3)");
             pst = conn.prepareStatement("insert into baza_wiadomosci(email_nadawcy_k, email_odbiorcy_k, data_wyslania, tresc_wiadomosci, id_wiadomosci) values(?, ?, ?, ?, ?)");

             
            pst.setString(1, u.getEmail_nadawcy_k());
            pst.setString(2, u.getEmail_odbiorcy_k());
            pst.setTimestamp(3, u.getData_wyslania());
            pst.setString(4, u.getTresc_wiadomosci());
            pst.setInt(5, u.getId_wiadomosci());
            status = pst.executeUpdate();
            conn.close();
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        return status;
    }
    
}
