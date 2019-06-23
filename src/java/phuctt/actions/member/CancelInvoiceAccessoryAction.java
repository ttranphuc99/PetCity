/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.daos.InvoiceAccessoryDAO;

/**
 *
 * @author Thien Phuc
 */
public class CancelInvoiceAccessoryAction {
    private String mess;
    private long id;
    
    public CancelInvoiceAccessoryAction() {
    }
    
    public String execute() {
        String label = "success";
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            
            String username = (String) session.get("USERNAME");
            
            InvoiceAccessoryDAO dao = new InvoiceAccessoryDAO();
            
            if (dao.belongTo(username, id)) {
                if (dao.cancelInvoice(id)) {
                    mess = "Cancel invoice ID: " + id + " successfully";
                } else {
                    mess = "Cancel invoice ID: " + id + " failed";
                }
            } else {
                mess = "You don't have right to cancel this invoice";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "Error";
        }
        return label;
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
    
}
