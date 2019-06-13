/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import phuctt.daos.ServiceStaffDAO;
import phuctt.daos.StaffDAO;

/**
 *
 * @author Thien Phuc
 */
public class DeleteStaffAction {
    private int id;
    private String mess;
    
    public DeleteStaffAction() {
    }
    
    public String execute() {
        String label = "success";
        try {
            StaffDAO dao = new StaffDAO();
            
            if (dao.delete(id)) {
                ServiceStaffDAO dao2 = new ServiceStaffDAO();
                dao2.deleteStaff(id);
                mess = "Delete staff ID: " + id + " successfully";
            } else {
                mess = " Delete fail";
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
