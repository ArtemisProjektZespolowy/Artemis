/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.logowania;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import system.logowania.LoginBean;
import src.PolaczenieDB;

public class LoginDao {

    public SessionData authenticateUser(LoginBean loginBean) {
        String email = loginBean.getEmail();
        String haslo = loginBean.getHaslo();
        SessionData sessionData = new SessionData();
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String emailDB = "";
        String hasloDB = "";
        String rangaDB = "";
        String telefonDB = "";
        int IdDB = 0;

        try {
            con = PolaczenieDB.getConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select id_konto, email, haslo, telefon, u.ranga from konto k join uprawnienia u on k.id_uprawnienia=u.id_uprawnienia");

            while (resultSet.next()) {
                emailDB = resultSet.getString("email");
                hasloDB = resultSet.getString("haslo");
                rangaDB = resultSet.getString("ranga");
                telefonDB = resultSet.getString("telefon");
                IdDB = resultSet.getInt("id_konto");
                

                if (email.equals(emailDB) && haslo.equals(hasloDB)) {
                    
                    sessionData.setId_konta(IdDB);
                    sessionData.setEmail_konta(emailDB);
                    sessionData.setTelefon_konta(telefonDB);
                    sessionData.setUprawnienia_konta(rangaDB);
                    sessionData.setHaslo_konta(hasloDB);
                    return sessionData;
                } 
            }
             con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessionData;
    }
}
