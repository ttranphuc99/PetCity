/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.dtos;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Thien Phuc
 */
public class InvoiceAccessoryDTO implements Serializable {
    private Timestamp createdTime;
    private String buyerUsername, adminConfirm;
    private int status;

    public InvoiceAccessoryDTO() {
    }

    public InvoiceAccessoryDTO(Timestamp createdTime, String buyerUsername, String adminConfirm, int status) {
        this.createdTime = createdTime;
        this.buyerUsername = buyerUsername;
        this.adminConfirm = adminConfirm;
        this.status = status;
    }

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    public String getBuyerUsername() {
        return buyerUsername;
    }

    public void setBuyerUsername(String buyerUsername) {
        this.buyerUsername = buyerUsername;
    }

    public String getAdminConfirm() {
        return adminConfirm;
    }

    public void setAdminConfirm(String adminConfirm) {
        this.adminConfirm = adminConfirm;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
