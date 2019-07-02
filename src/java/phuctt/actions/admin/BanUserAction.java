/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import phuctt.daos.AccountDAO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class BanUserAction {
    private String id, mess, role;
    
    public BanUserAction() {
    }
    
    public String execute() {
        String label = role;
        try {
            AccountDAO dao = new AccountDAO();
            
            if (dao.delete(id)) {
                mess = "Ban user " +id+ " successfully";
            } else {
                mess = "Ban failed";
            }
        } catch (Exception e) {
            Logger.log("ERROR at BanUserAction : " + e.getMessage());
            mess = "Error";
        }
        return label;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
}
