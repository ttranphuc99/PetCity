/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import phuctt.daos.InvoiceServiceDAO;
import phuctt.daos.StaffDAO;
import phuctt.log.Logger;

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
            InvoiceServiceDAO invoice = new InvoiceServiceDAO();
            if (invoice.isStaffCanBeDelete(id)) {
                StaffDAO dao = new StaffDAO();

                if (dao.delete(id)) {
                    mess = "Delete staff ID: " + id + " successfully";
                } else {
                    mess = " Delete fail";
                }
            } else {
                mess = "Staff is doing service, cannot delete now!";
            }

        } catch (Exception e) {
            Logger.log("ERROR at DeleteStaffAction : " + e.getMessage());
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
