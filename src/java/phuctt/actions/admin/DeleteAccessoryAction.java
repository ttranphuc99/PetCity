/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import phuctt.daos.AccessoryDAO;

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
            e.printStackTrace();
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
