/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.daos.AccessoryDAO;
import phuctt.dtos.AccessoryDTO;
import phuctt.dtos.CartDTO;

/**
 *
 * @author Thien Phuc
 */
public class AddAccessoryToCartAction {

    private long id;
    private String mess;
    private boolean success;
    private int quantityInCart;

    public AddAccessoryToCartAction() {
    }

    public String execute() {
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            CartDTO cart = (CartDTO) session.get("CART");

            if (cart == null) {
                cart = new CartDTO();
                String username = (String) session.get("USERNAME");
                if (username != null) {
                    cart.setUsername(username);
                }
                session.put("CART", cart);
            }

            AccessoryDAO dao = new AccessoryDAO();

            AccessoryDTO dto = dao.findById(id);

            if (dto == null) {
                success = false;
                mess = "Accessory is not available!";
            } else {
                int curQuantity = dto.getQuantity();
                if (curQuantity <= 0) {
                    success = false;
                    mess = "Sorry. Not enough accessories in warehouse to buy.";
                } else {
                    AccessoryDTO item = new AccessoryDTO();
                    item.setId(id);
                    item.setPrice(dto.getPrice());

                    cart.addToCart(dto);

                    item = cart.getItem(id);
                    success = true;
                    mess = "Add to cart successfully";
                }
            }
            quantityInCart = cart.getTotalQuantity();
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
            mess = "Add to cart failed";
        }
        return "success";
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public int getQuantityInCart() {
        return quantityInCart;
    }

    public void setQuantityInCart(int quantityInCart) {
        this.quantityInCart = quantityInCart;
    }

}
