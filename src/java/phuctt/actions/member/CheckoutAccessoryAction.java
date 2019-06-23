/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import phuctt.daos.AccessoryDAO;
import phuctt.daos.AccountDAO;
import phuctt.daos.InvoiceAccessoryDAO;
import phuctt.dtos.AccessoryDTO;
import phuctt.dtos.AccountDTO;

/**
 *
 * @author Thien Phuc
 */
public class CheckoutAccessoryAction {
    
    private String mess;
    private List<Long> id;
    private List<Integer> quantity;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private static final String ERROR = "error";
    
    public CheckoutAccessoryAction() {
    }
    
    public String execute() {
        String label = ERROR;
        try {
            System.out.println(id);
            System.out.println(quantity);
            
            Map<String, Object> session = ActionContext.getContext().getSession();
            
            String username = (String) session.get("USERNAME");
            
            AccountDTO account = (new AccountDAO()).getAccountByID(username);
            String address = account.getAddress();
            String phone = account.getPhone();
            
            if (address == null || phone == null || address.trim().isEmpty() || phone.trim().isEmpty()) {
                label = FAIL;
                mess = "You must update address and phone number to checkout";
            } else {
                List<AccessoryDTO> list = new ArrayList<>();
                AccessoryDTO dto;
                AccessoryDAO dao = new AccessoryDAO();
                
                for (int i = 0; i < id.size(); i++) {
                    dto = dao.findById(id.get(i));
                    dto.setQuantity(quantity.get(i));
                    list.add(dto);
                }
                
                InvoiceAccessoryDAO invoiceDAO = new InvoiceAccessoryDAO();
                
                if (invoiceDAO.insert(list, username)) {
                    label = SUCCESS;
                    mess = "Checkout successfully";
                    session.remove("CART");
                } else {
                    mess = "Checkout fail";
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
    
    
    
}
