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
public class NowaBean {
    String tytul;
    Boolean status_nadawcy;
    Boolean status_odbiorcy;
    Timestamp data_zgloszenia;
    Timestamp data_zamkniecia;
    String typ_wiadomosci;
    String rodzaj_problemu;
    String email_nadawcy;
    String email_odbiorcy;
    int id_konto;
    Boolean status_wiadomosci;

    public String getTytul() {
        return tytul;
    }

    public void setTytul(String tytul) {
        this.tytul = tytul;
    }

    public Boolean getStatus_nadawcy() {
        return status_nadawcy;
    }

    public void setStatus_nadawcy(Boolean status_nadawcy) {
        this.status_nadawcy = status_nadawcy;
    }

    public Boolean getStatus_odbiorcy() {
        return status_odbiorcy;
    }

    public void setStatus_odbiorcy(Boolean status_odbiorcy) {
        this.status_odbiorcy = status_odbiorcy;
    }

    public Timestamp getData_zgloszenia() {
        return data_zgloszenia;
    }

    public void setData_zgloszenia(Timestamp data_zgloszenia) {
        this.data_zgloszenia = data_zgloszenia;
    }

    public Timestamp getData_zamkniecia() {
        return data_zamkniecia;
    }

    public void setData_zamkniecia(Timestamp data_zamkniecia) {
        this.data_zamkniecia = data_zamkniecia;
    }

    public String getTyp_wiadomosci() {
        return typ_wiadomosci;
    }

    public void setTyp_wiadomosci(String typ_wiadomosci) {
        this.typ_wiadomosci = typ_wiadomosci;
    }

    public String getRodzaj_problemu() {
        return rodzaj_problemu;
    }

    public void setRodzaj_problemu(String rodzaj_problemu) {
        this.rodzaj_problemu = rodzaj_problemu;
    }

    public String getEmail_nadawcy() {
        return email_nadawcy;
    }

    public void setEmail_nadawcy(String email_nadawcy) {
        this.email_nadawcy = email_nadawcy;
    }

    public String getEmail_odbiorcy() {
        return email_odbiorcy;
    }

    public void setEmail_odbiorcy(String email_odbiorcy) {
        this.email_odbiorcy = email_odbiorcy;
    }

    public int getId_konto() {
        return id_konto;
    }

    public void setId_konto(int id_konto) {
        this.id_konto = id_konto;
    }

    public Boolean getStatus_wiadomosci() {
        return status_wiadomosci;
    }

    public void setStatus_wiadomosci(Boolean status_wiadomosci) {
        this.status_wiadomosci = status_wiadomosci;
    }

   
   
    
    
}




  