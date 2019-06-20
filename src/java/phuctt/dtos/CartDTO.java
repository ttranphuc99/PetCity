/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.dtos;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Thien Phuc
 */
public class CartDTO implements Serializable {
    private String username;
    private HashMap<Long, AccessoryDTO> cart;

    public CartDTO() {
        cart = new HashMap<>();
    }

    public List<AccessoryDTO> getList() {
        return new ArrayList<>(cart.values());
    }
    
    public boolean isEmpty() {
        return cart.isEmpty();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public HashMap<Long, AccessoryDTO> getCart() {
        return cart;
    }
    
    public void addToCart(AccessoryDTO dto) {
        if (cart.containsKey(dto.getId())) {
            AccessoryDTO dtoInCart = cart.get(dto.getId());
            int quantity = dtoInCart.getQuantity() + 1;
            dtoInCart.setQuantity(quantity);
        } else {
            dto.setQuantity(1);
            cart.put(dto.getId(), dto);
        }
    }
    
    public void removeFromCart(Long id) {
        cart.remove(id);
    }
    
    public float getTotal() {
        float total = 0;
        for (AccessoryDTO dto : cart.values()) {
            total += dto.getQuantity() * dto.getPrice();
        }
        return total;
    }
    
    public void update(long id, int quantity) {
        if (cart.containsKey(id)) {
            cart.get(id).setQuantity(quantity);
        }
    }
    
    public boolean contain(long id) {
        return cart.containsKey(id);
    }
    
    public AccessoryDTO getItem(long id) {
        return cart.get(id);
    }
    
    public int getTotalQuantity() {
        int quantity = 0;
        for (AccessoryDTO dto : cart.values()) {
            quantity += dto.getQuantity();
        }
        return quantity;
    }
}
