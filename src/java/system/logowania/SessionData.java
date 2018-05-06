/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system.logowania;

/**
 *
 * @author Patryk
 */
public class SessionData {
    
    private int id_konta;
    private String email_konta;
    private String telefon_konta;
    private String uprawnienia_konta;
    private String haslo_konta;

    public int getId_konta() {
        return id_konta;
    }

    public void setId_konta(int id_konta) {
        this.id_konta = id_konta;
    }

    public String getEmail_konta() {
        return email_konta;
    }

    public void setEmail_konta(String email_konta) {
        this.email_konta = email_konta;
    }

    public String getTelefon_konta() {
        return telefon_konta;
    }

    public void setTelefon_konta(String telefon_konta) {
        this.telefon_konta = telefon_konta;
    }

    public String getUprawnienia_konta() {
        return uprawnienia_konta;
    }

    public void setUprawnienia_konta(String uprawnienia_konta) {
        this.uprawnienia_konta = uprawnienia_konta;
    }

    public String getHaslo_konta() {
        return haslo_konta;
    }

    public void setHaslo_konta(String haslo_konta) {
        this.haslo_konta = haslo_konta;
    }
    
    
    
}
