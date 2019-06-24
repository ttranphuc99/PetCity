/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.daos.InvoiceAccessoryDAO;

/**
 *
 * @author Thien Phuc
 */
public class UpdateStatusAccessoryInvoiceAction {
    private String mess;
    private long id;
    private int status;
    
    public UpdateStatusAccessoryInvoiceAction() {
    }
    
    public String execute() {
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            String username = (String) session.get("USERNAME");
            
            InvoiceAccessoryDAO dao = new InvoiceAccessoryDAO();
            
            if (dao.updateStatus(id, status, username)) {
                mess = "Update status for Invoice ID: " +id+ " successfully";
            } else {
                mess = "Update status for Invoice ID: " +id+ " failed";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "Error";
        }
        return "success";
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
