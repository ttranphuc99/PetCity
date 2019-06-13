/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import phuctt.daos.AccountDAO;
import phuctt.dtos.AccountDTO;

/**
 *
 * @author Thien Phuc
 */
public class AdminEditProfileAction {
    private String username, fullname, gender;
    private String mess;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public AdminEditProfileAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            AccountDAO dao = new AccountDAO();
            AccountDTO dto = new AccountDTO();
            dto.setUsername(username);
            dto.setFullname(fullname);
            dto.setGender(gender.equalsIgnoreCase("male"));
            
            if (dao.update(dto)) {
                label = SUCCESS;
                mess = "Update successfully!";
            } else {
                mess = "Update Failed!";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return label;
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
