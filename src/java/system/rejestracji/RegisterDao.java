/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.rejestracji;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import src.PolaczenieDB;


/**
 *
 * @author Iluvris
 */
public class RegisterDao {
    
    static Connection conn;
    static  PreparedStatement pst;
    
    
    public static int insertRegister(RegisterBean u) {
       
        
        
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
             pst = conn.prepareStatement("insert into konto(imie, nazwisko, telefon, kod_pocztowy, miasto, nr_mieszkania, ulica, email, haslo, data_rejestracji, id_uprawnienia) values(?, ?, ?, ?, ?, ?, ?, ?, ?, '"+modifiedDate+"', 3)");
           
            
            
            pst.setString(1, u.getImie());
            pst.setString(2, u.getNazwisko());
            pst.setString(3, u.getTelefon());
            pst.setString(4, u.getKod_pocztowy());
            pst.setString(5, u.getMiasto());
            pst.setString(6, u.getNr_domu());
            pst.setString(7, u.getUlica());
            pst.setString(8, u.getEmail());
            pst.setString(9, u.getHaslo());

            status = pst.executeUpdate();
            conn.close();
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        return status;
    }
}
