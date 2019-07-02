/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.daos.InvoiceServiceDAO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class CancelInvoiceServiceAction {
    private int page;
    private String mess;
    private long id;
    
    private static final String ADMIN = "admin";
    private static final String MEMBER = "member";
    private static final String FAIL = "fail";
    
    public CancelInvoiceServiceAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            String username = (String) session.get("USERNAME");
            String role = (String) session.get("ROLE");
            
            InvoiceServiceDAO dao = new InvoiceServiceDAO();
            if (role.equalsIgnoreCase("admin")) {
                label = ADMIN;
                if (dao.adminCancel(id, username)) {
                    mess = "Cancel invoice successfully";
                } else {
                    mess = "Cancel invoice fail";
                }
            } else if (role.equalsIgnoreCase("member")) {
                label = MEMBER;
                if (dao.memberCancel(id)) {
                    mess = "Cancel invoice successfully";
                } else {
                    mess = "Cancel invoice fail";
                }
            }
        } catch (Exception e) {
            Logger.log("ERROR at CancelInvoiceServiceAction : " + e.getMessage());
            mess = "Error";
        }
        return label;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
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
