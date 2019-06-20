/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import phuctt.dtos.CartDTO;

/**
 *
 * @author Thien Phuc
 */
public class UpdateAccessoryCartAction {
    private String mess;
    private List<Long> id;
    private List<Integer> quantity;
    private String action;
    
    private static final String SUCCESS = "success";
    private static final String CHECKOUT = "checkout";
    public UpdateAccessoryCartAction() {
    }
    
    public String execute() {
        String label = SUCCESS;
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            
            CartDTO cart = (CartDTO) session.get("CART");
            
            for (int i = 0; i < id.size(); i++) {
                cart.update(id.get(i), quantity.get(i));
            }
            
            if (action.equalsIgnoreCase("update cart")) {
                mess = "Update successfully";
            } else {
                
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

    public List<Long> getId() {
        return id;
    }

    public void setId(List<Long> id) {
        this.id = id;
    }

    public List<Integer> getQuantity() {
        return quantity;
    }

    public void setQuantity(List<Integer> quantity) {
        this.quantity = quantity;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
    
}
