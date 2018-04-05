/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.produktu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import src.PolaczenieDB;

/**
 *
 * @author Patryk
 */
public class ProduktDao {
    private Connection conn;
	
	public ProduktDao(){
		conn = PolaczenieDB.getConnection();
	}
        public List<Produkt> getProdukty(){
            
            List<Produkt> produkty = new ArrayList<Produkt>();
            try{
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM Produkt");
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				Produkt produkt = new Produkt();
				produkt.setId(rs.getInt(1));
				produkt.setNazwa(rs.getString(2));
				produkt.setData_wydania(rs.getDate(3));
                                produkt.setKategoria(rs.getString(4));
                                produkt.setPlatforma(rs.getString(5));
                                produkt.setCena(rs.getDouble(6));
                                produkt.setWydawca(rs.getString(7));
                                produkt.setOpis(rs.getString(8));
                                produkt.setObraz(rs.getString(9));
				produkty.add(produkt);
			}
		}catch(SQLException ex){
			Logger.getLogger(ProduktDao.class.getSimpleName()).log(Level.SEVERE, ex.getMessage());
		}
		return produkty;
        }
}
