/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.sql.*;

public class PolaczenieDB implements DanePolaczenia{
    
    static Connection connection = null;
    
    public static Connection getConnection() {
    
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(connURL, username, pass);
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return connection;
    }
    
}
