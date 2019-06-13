/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;

/**
 *
 * @author Thien Phuc
 */
public class LogoutAction {
    private String mess;
    public LogoutAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session != null) {
            session.clear();
            mess = "Logout successfully!";
        }
        return "success";
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
}
