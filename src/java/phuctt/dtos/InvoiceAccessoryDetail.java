/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.dtos;

import java.io.Serializable;

/**
 *
 * @author Thien Phuc
 */
public class InvoiceAccessoryDetail implements Serializable {
    private long accessoryID, invoiceID;
    private int quantity;
    private float subPrice;

    public InvoiceAccessoryDetail() {
    }

    public InvoiceAccessoryDetail(long accessoryID, long invoiceID, int quantity, float subPrice) {
        this.accessoryID = accessoryID;
        this.invoiceID = invoiceID;
        this.quantity = quantity;
        this.subPrice = subPrice;
    }

    public long getAccessoryID() {
        return accessoryID;
    }

    public void setAccessoryID(long accessoryID) {
        this.accessoryID = accessoryID;
    }

    public long getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(long invoiceID) {
        this.invoiceID = invoiceID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getSubPrice() {
        return subPrice;
    }

    public void setSubPrice(float subPrice) {
        this.subPrice = subPrice;
    }
    
    
}
