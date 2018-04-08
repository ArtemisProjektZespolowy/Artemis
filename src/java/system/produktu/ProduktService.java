/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.produktu;

import java.util.List;

/**
 *
 * @author Patryk
 */
public class ProduktService {
    
    private ProduktDao produktDao = new ProduktDao();
	public  List<Produkt> getProdukty(){
		return produktDao.getProdukty();
	}
    
        public boolean find(String id){
            int in = Integer.parseInt(id);
            List<Produkt> produkty = getProdukty();
            
            for(int i = 0; i<produkty.size();i++){
                
                if(produkty.get(i).getId()==in)
                    return true;
            }
            
            return false;
        }
    
}
