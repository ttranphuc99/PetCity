/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import phuctt.daos.AccessoryDAO;
import phuctt.dtos.AccessoryDTO;
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
    private static final String LOGIN = "login";

    public UpdateAccessoryCartAction() {
    }

    public String execute() {
        String label = SUCCESS;
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();

            CartDTO cart = (CartDTO) session.get("CART");

            AccessoryDTO dto;
            AccessoryDAO dao = new AccessoryDAO();
            boolean valid = true;

            for (int i = 0; i < id.size(); i++) {
                dto = dao.findById(id.get(i));
                if (dto.getQuantity() < quantity.get(i)) {
                    valid = false;
                    String error = "Not enough quantity. Current quantity is " + dto.getQuantity();
                    cart.update(id.get(i), quantity.get(i));
                    cart.setError(id.get(i), error);
                } else {
                    cart.update(id.get(i), quantity.get(i));
                    cart.setError(id.get(i), null);
                }
            }

            if (action.equalsIgnoreCase("update cart")) {
                if (valid) {
                    mess = "Update successfully";
                } else {
                    mess = "Some of your accessories cannot be updated";
                }
            } else {
                if (valid) {
                    if (session.get("USERNAME") != null) {
                        label = CHECKOUT;
                    } else {
                        label = LOGIN;
                        mess = "You must log in to checkout";
                    }
                } else {
                    mess = "Some of your accessories cannot be updated";
                }
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
