/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import phuctt.daos.StaffDAO;

/**
 *
 * @author Thien Phuc
 */
public class AvailableStaffAction {
    private int id;
    private String mess;
    private String status;
    
    public AvailableStaffAction() {
    }
    
    public String execute() {
        String label = "success";
        try {
            StaffDAO dao = new StaffDAO();
            
            if (dao.setAvailableStaff(id, status.equals("true"))) {
                mess = "Set staff id: " + id + " successfully";
            } else {
                mess = "Set failed";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "Error";
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
