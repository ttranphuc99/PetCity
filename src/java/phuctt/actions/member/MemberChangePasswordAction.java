/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import phuctt.daos.AccountDAO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class MemberChangePasswordAction {
    private String oldPassword, newPassword, conPassword, username;
    private String mess;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public MemberChangePasswordAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            AccountDAO dao = new AccountDAO();
            String[] check = dao.checkLogin(username, oldPassword);
            
            if (check != null) {
                if (dao.changePassword(username, newPassword)) {
                    label = SUCCESS;
                    mess = "Change password successfully!";
                } else {
                    mess = "Change password failed!";
                }
            } else {
                mess = "Wrong old password!";
            }
        } catch (Exception e) {
            Logger.log("ERROR at MemberChangePasswordAction : " + e.getMessage());
        }
        return label;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConPassword() {
        return conPassword;
    }

    public void setConPassword(String conPassword) {
        this.conPassword = conPassword;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
}
