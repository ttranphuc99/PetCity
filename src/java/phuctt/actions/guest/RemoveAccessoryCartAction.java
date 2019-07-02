/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.dtos.CartDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class RemoveAccessoryCartAction {
    private String mess;
    private long id;
    
    public RemoveAccessoryCartAction() {
    }
    
    public String execute() {
        String label = "success";
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            CartDTO cart = (CartDTO) session.get("CART");
            
            cart.removeFromCart(id);
            mess = "Remove successfully!";
        } catch (Exception e) {
            Logger.log("ERROR at RemoveAccessoryCartAction : " + e.getMessage());
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
