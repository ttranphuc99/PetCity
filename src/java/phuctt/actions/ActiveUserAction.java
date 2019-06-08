/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import phuctt.daos.AccountDAO;

/**
 *
 * @author Thien Phuc
 */
public class ActiveUserAction {
    private String id, mess;
    
    public ActiveUserAction() {
    }
    
    public String execute() {
        String label = "success";
        try {
            AccountDAO dao = new AccountDAO();
            
            if (dao.active(id)) {
                mess = "Active user " +id+ " successfully";
            } else {
                mess = "Active failed";
            }
        } catch (Exception e) {
            e.printStackTrace();
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
}
