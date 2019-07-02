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
public class ActiveUserAction {
    private String id, mess, role;
    
    public ActiveUserAction() {
    }
    
    public String execute() {
        String label = role;
        try {
            AccountDAO dao = new AccountDAO();
            
            if (dao.active(id)) {
                mess = "Active user " +id+ " successfully";
            } else {
                mess = "Active failed";
            }
        } catch (Exception e) {
            Logger.log("Error at ActiveUserAction: " + e.getMessage());
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
