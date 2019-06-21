/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import phuctt.daos.AccountDAO;
import phuctt.dtos.AccountDTO;

/**
 *
 * @author Thien Phuc
 */
public class UpdateProfileAction {
    private AccountDTO dto;
    private String username, fullname, address, phone, gender, mess;
    
    public UpdateProfileAction() {
    }
    
    public String execute() {
        try {
            AccountDAO dao = new AccountDAO();
            dto = new AccountDTO(username, phone, fullname, address, phone, "member", false, gender.equalsIgnoreCase("male"));
            
            if (dao.update(dto)) {
                mess = "Update profile successfully!";
            } else {
                mess = "Update failed!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "Error";
        }
        return "success";
    }

    public AccountDTO getDto() {
        return dto;
    }

    public void setDto(AccountDTO dto) {
        this.dto = dto;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
}
