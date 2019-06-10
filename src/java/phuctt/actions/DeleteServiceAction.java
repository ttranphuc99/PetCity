/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import phuctt.daos.ServiceDAO;
import phuctt.daos.ServiceStaffDAO;

/**
 *
 * @author Thien Phuc
 */
public class DeleteServiceAction {
    private int id;
    private String mess;
    
    public DeleteServiceAction() {
    }
    
    public String execute() {
        String label = "success";
        try {
            ServiceDAO dao = new ServiceDAO();
            
            if (dao.delete(id)) {
                ServiceStaffDAO dao2 = new ServiceStaffDAO();
                dao2.deleteService(id);
                mess = "Delete service id: " +id+ " successfully!";
            } else {
                mess = "Delete fail";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "error";
        }
        return label;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
}
