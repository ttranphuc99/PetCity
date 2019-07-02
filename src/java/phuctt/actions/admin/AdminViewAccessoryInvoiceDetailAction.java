/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import java.util.List;
import phuctt.daos.InvoiceAccessoryDAO;
import phuctt.dtos.AccessoryDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class AdminViewAccessoryInvoiceDetailAction {

    private int page;
    private int status;
    private long id;
    private List<AccessoryDTO> listAccessory;
    private float total;

    public AdminViewAccessoryInvoiceDetailAction() {
    }

    public String execute() {
        try {
            System.out.println("Page: " + page);
            InvoiceAccessoryDAO dao = new InvoiceAccessoryDAO();
            listAccessory = dao.getDetailInvoice(id);
            total = 0;
            for (AccessoryDTO accessoryDTO : listAccessory) {
                total += accessoryDTO.getPrice() * accessoryDTO.getQuantity();
            }
        } catch (Exception e) {
            Logger.log("ERROR at AdminViewAccessoryInvoiceDetailAction : " + e.getMessage());
        }
        return "success";
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
