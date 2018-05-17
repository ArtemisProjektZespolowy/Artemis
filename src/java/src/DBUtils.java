/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Bartek
 */
public class DBUtils {

    public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException {
        PreparedStatement ps = null;
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://sigma.pwsz.krosno.pl:5432/projekt_zespołowy_Artemis";
        String user = "postgres";
        String pass = "26!D$196eF85";

        Connection con = DriverManager.getConnection(url, user, pass);
        ps = con.prepareStatement(sql);

        return ps;
    }
}
