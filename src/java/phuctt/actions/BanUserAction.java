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
public class BanUserAction {
    private String id, mess;
    
    public BanUserAction() {
    }
    
    public String execute() {
        String label = "success";
        try {
            AccountDAO dao = new AccountDAO();
            
            if (dao.delete(id)) {
                mess = "Ban user " +id+ " successfully";
            } else {
                mess = "Ban failed";
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
