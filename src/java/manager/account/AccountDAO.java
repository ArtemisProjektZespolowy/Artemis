/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager.account;

import src.DBUtils;
import manager.account.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.time.LocalDate;
/**
 *
 * @author Bartek
 */
public class AccountDAO {
    public static void add(String name, String surname, String phone, String code, String town, String number, String street, String email, String password, String registrationDateString, int permissionId){
        try {
            PreparedStatement ps = DBUtils.getPreparedStatement("insert into konto (imie, nazwisko, telefon, kod_pocztowy, miasto, nr_mieszkania, ulica, email, haslo, data_rejestracji, id_uprawnienia) values(?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setString(3, phone);
            ps.setString(4, code);
            ps.setString(5, town);
            ps.setString(6, number);
            ps.setString(7, street);
            ps.setString(8, email);
            ps.setString(9, password);
            LocalDate registrationDate = LocalDate.parse(registrationDateString);
            ps.setObject(10, registrationDate);
            ps.setInt(11, permissionId);
            ps.executeUpdate();
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static List<Account> getAll(){
        List<Account> ls = new LinkedList<>();
        
        try {
            ResultSet rs = DBUtils.getPreparedStatement("select * from konto ORDER BY id_konto").executeQuery();
            while(rs.next()){
                Account p = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getObject(11, LocalDate.class),rs.getInt(12));
                ls.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return ls;
    }
    
    public static List<Account> getAccountById(int id){
        List<Account> ls = new LinkedList<>();
        System.out.println(id);
        String sql = "select * from konto where id_konto = " +id;
        try {
            ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
            while(rs.next()){
                Account p = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getObject(11, LocalDate.class),rs.getInt(12));
                ls.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return ls;
    }
    
    public static void edit(int id, String name, String surname, String phone, String code, String town, String number, String street, String email, String password, String registrationDateString, int permissionId) {
        try {
            String sql = "update konto SET imie = ?, nazwisko = ?, telefon = ?, kod_pocztowy = ?, miasto = ?, nr_mieszkania = ?, ulica = ?, email = ?, haslo = ?, data_rejestracji = ?, id_uprawnienia = ?" + " where id_konto = ?";
            PreparedStatement ps= DBUtils.getPreparedStatement(sql);
            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setString(3, phone);
            ps.setString(4, code);
            ps.setString(5, town);
            ps.setString(6, number);
            ps.setString(7, street);
            ps.setString(8, email);
            ps.setString(9, password);
            LocalDate registrationDate = LocalDate.parse(registrationDateString);
            ps.setObject(10, registrationDate);
            ps.setInt(11, permissionId);
            ps.setInt(12, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static void delete(int id){
        try {
            String sql = "delete FROM konto where id_konto = ?";
            PreparedStatement ps = DBUtils.getPreparedStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
