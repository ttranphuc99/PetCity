/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import phuctt.daos.InvoiceAccessoryDAO;
import phuctt.dtos.AccessoryDTO;

/**
 *
 * @author Thien Phuc
 */
public class ViewAccessoryCartDetailAction {
    private String mess;
    private long invoiceID;
    private List<AccessoryDTO> listAccessory;
    private float total;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public ViewAccessoryCartDetailAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            InvoiceAccessoryDAO dao = new InvoiceAccessoryDAO();
            
            Map<String, Object> session = ActionContext.getContext().getSession();
            String username = (String) session.get("USERNAME");
            
            if (dao.belongTo(username, invoiceID)) {
                listAccessory = dao.getDetailInvoice(invoiceID);
                total = 0;
                for (AccessoryDTO accessoryDTO : listAccessory) {
                    total += accessoryDTO.getPrice() * accessoryDTO.getQuantity();
                }
                label = SUCCESS;
            } else {
                mess = "You don't have right to view this invoice";
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

    public long getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(long invoiceID) {
        this.invoiceID = invoiceID;
    }

    public List<AccessoryDTO> getListAccessory() {
        return listAccessory;
    }

    public void setListAccessory(List<AccessoryDTO> listAccessory) {
        this.listAccessory = listAccessory;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
    
}
