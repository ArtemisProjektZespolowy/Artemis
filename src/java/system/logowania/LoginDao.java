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

    public String authenticateUser(LoginBean loginBean) {
        String email = loginBean.getEmail();
        String haslo = loginBean.getHaslo();

        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String emailDB = "";
        String hasloDB = "";
        String rangaDB = "";

        try {
            con = PolaczenieDB.getConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select email, haslo, u.ranga from konto k join uprawnienia u on k.id_uprawnienia=u.id_uprawnienia");

            while (resultSet.next()) {
                emailDB = resultSet.getString("email");
                hasloDB = resultSet.getString("haslo");
                rangaDB = resultSet.getString("ranga");

                if (email.equals(emailDB) && haslo.equals(hasloDB) && rangaDB.equals("Admin")) {
                    return "Admin";
                } else if (email.equals(emailDB) && haslo.equals(hasloDB) && rangaDB.equals("Pracownik")) {
                    return "Pracownik";
                } else if (email.equals(emailDB) && haslo.equals(hasloDB) && rangaDB.equals("User")) {
                    return "User";
                }
            }
             con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
       
        return "Nieprawidłowy email lub hasło.";
    }
}
