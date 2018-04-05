/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.poczty;

import java.sql.Timestamp;

/**
 *
 * @author Iluvris
 */
public class OdpowedzBean {
    
    String email_nadawcy_k;
    String email_odbiorcy_k;
    Timestamp data_wyslania;
    String tresc_wiadomosci;
    int id_wiadomosci;

    public String getEmail_nadawcy_k() {
        return email_nadawcy_k;
    }

    public void setEmail_nadawcy_k(String email_nadawcy_k) {
        this.email_nadawcy_k = email_nadawcy_k;
    }

    public String getEmail_odbiorcy_k() {
        return email_odbiorcy_k;
    }

    public void setEmail_odbiorcy_k(String email_odbiorcy_k) {
        this.email_odbiorcy_k = email_odbiorcy_k;
    }

    public Timestamp getData_wyslania() {
        return data_wyslania;
    }

    public void setData_wyslania(Timestamp data_wyslania) {
        this.data_wyslania = data_wyslania;
    }

    public String getTresc_wiadomosci() {
        return tresc_wiadomosci;
    }

    public void setTresc_wiadomosci(String tresc_wiadomosci) {
        this.tresc_wiadomosci = tresc_wiadomosci;
    }

    public int getId_wiadomosci() {
        return id_wiadomosci;
    }

    public void setId_wiadomosci(int id_wiadomosci) {
        this.id_wiadomosci = id_wiadomosci;
    }
    
    
    
}
