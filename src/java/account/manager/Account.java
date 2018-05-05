/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.manager;

import java.time.LocalDate;

/**
 *
 * @author Bartek
 */
public class Account {
    
    private int id;
    private String name;
    private String surname;
    private String phone;
    private String code;
    private String town;
    private String number;
    private String street;
    private String email;
    private String password;
    private LocalDate registrationDate;
    private int permissionId;
    
    public Account(int id, String name, String surname, String phone, String code, String town, String number, String street, String email, String password, LocalDate registrationDate, int permissionId) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.phone = phone;
        this.code = code;
        this.town = town;
        this.number = number;
        this.street = street;
        this.email = email;
        this.password = password;
        this.registrationDate = registrationDate;
        this.permissionId = permissionId;
    }
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public String getSurname() {
        return surname;
    }
    public void setSurname(String surname) {
        this.surname = surname;
    }
    
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    
    public String getTown() {
        return town;
    }
    public void setTown(String town) {
        this.town = town;
    }
    
    public String getNumber() {
        return number;
    }
    public void setNumber(String number){
        this.number = number;
    }
    
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    
    public LocalDate getRegistrationDate() {
        return registrationDate;
    }
    public void setRegistrationDate(LocalDate registrationDate) {
        this.registrationDate = registrationDate;
    }
    
    public int getPermissionId() {
        return permissionId;
    }
    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }
    
    
    
}
