/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import phuctt.daos.AccessoryDAO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class DeleteAccessoryAction {
    private long id;
    private String mess;
    
    public DeleteAccessoryAction() {
    }
    
    public String execute() {
        String label = "success";
        try {
            AccessoryDAO dao = new AccessoryDAO();
            if (dao.delete(id)) {
                mess = "Delete " +id+ " successfully";
            } else {
                mess = "delete fail";
            }
        } catch (Exception e) {
            Logger.log("ERROR at DeleteAccessoryAction : " + e.getMessage());
            mess = "Error";
        }
        return label;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
    
}
