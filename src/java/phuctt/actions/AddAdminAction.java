/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import phuctt.daos.AccountDAO;
import phuctt.dtos.AccountDTO;

/**
 *
 * @author Thien Phuc
 */
public class AddAdminAction {
    private String username, password, conPassword, fullname, gender, mess;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    public AddAdminAction() {
    }
    
    public String execute() throws Exception {
        String label = FAIL;
        try {
            AccountDTO dto = new AccountDTO(username, password, fullname, "admin", gender.equalsIgnoreCase("male"));
            AccountDAO dao = new AccountDAO();
            
            if (dao.signUp(dto)) {
                mess = "Add new admin successfully";
                label = SUCCESS;
            } else {
                mess = "Add new admin failed!";
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                mess = "Username is existed!";
            } else {
                e.printStackTrace();
            }
        }
        return label;
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

    public String getConPassword() {
        return conPassword;
    }

    public void setConPassword(String conPassword) {
        this.conPassword = conPassword;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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
