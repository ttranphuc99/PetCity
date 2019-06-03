/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.dtos;

import java.io.Serializable;

/**
 *
 * @author Thien Phuc
 */
public class AccountDTO implements Serializable {
    private String username, password, fullname, address, phone, role;
    private boolean delete, gender;

    public AccountDTO() {
    }

    public AccountDTO(String username, String password, String fullname, String role, boolean gender) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.role = role;
        this.gender = gender;
        this.delete = false;
    }

    public AccountDTO(String username, String password, String fullname, String address, String phone, String role, boolean delete, boolean gender) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.address = address;
        this.phone = phone;
        this.role = role;
        this.delete = delete;
        this.gender = gender;
    }
    
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isDelete() {
        return delete;
    }

    public void setDelete(boolean delete) {
        this.delete = delete;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }
    
    
}
