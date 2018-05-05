/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product.manager;

import src.DBUtils;
import product.manager.Product;
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
public class ProductDAO {
    public static void add(String name, String releaseDateString, String category, String platform, double price, String publisher, String description, String image){
        try {
            PreparedStatement ps = DBUtils.getPreparedStatement("insert into produkt (nazwa, data_wydania, kategoria, platforma, cena, wydawca, opis, obraz) values(?,?,?,?,?,?,?,?)");
            ps.setString(1, name);
            LocalDate releaseDate = LocalDate.parse(releaseDateString);
            ps.setObject(2, releaseDate);
            ps.setString(3, category);
            ps.setString(4, platform);
            ps.setDouble(5, price);
            ps.setString(6, publisher);
            ps.setString(7, description);
            ps.setString(8, image);
            ps.executeUpdate();
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static List<Product> getAll(){
        List<Product> ls = new LinkedList<>();
        
        try {
            ResultSet rs = DBUtils.getPreparedStatement("select * from produkt ORDER BY id_produktu").executeQuery();
            while(rs.next()){
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getObject(3, LocalDate.class), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getString(7),rs.getString(8),rs.getString(9));
                ls.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return ls;
    }
    
    public static List<Product> getProductById(int id){
        List<Product> ls = new LinkedList<>();
        System.out.println(id);
        String sql = "select * from produkt where id_produktu = " +id;
        try {
            ResultSet rs = DBUtils.getPreparedStatement(sql).executeQuery();
            while(rs.next()){
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getObject(3, LocalDate.class), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getString(7),rs.getString(8),rs.getString(9));
                ls.add(p);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return ls;
    }
    
    public static void edit(int id, String name, String releaseDateString, String category, String platform, double price, String publisher, String description, String image){
        try {
            String sql = "update produkt SET nazwa = ?, data_wydania = ?, kategoria = ?, platforma = ?, cena = ?, wydawca = ?, opis = ?, obraz = ?" + " where id_produktu = ?";
            PreparedStatement ps= DBUtils.getPreparedStatement(sql);
            ps.setString(1, name);
            LocalDate releaseDate = LocalDate.parse(releaseDateString);
            ps.setObject(2, releaseDate);
            ps.setString(3, category);
            ps.setString(4, platform);
            ps.setDouble(5, price);
            ps.setString(6, publisher);
            ps.setString(7, description);
            ps.setString(8, image);
            ps.setInt(9, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static void delete(int id){
        try {
            String sql = "delete FROM produkt where id_produktu = ?";
            PreparedStatement ps = DBUtils.getPreparedStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
