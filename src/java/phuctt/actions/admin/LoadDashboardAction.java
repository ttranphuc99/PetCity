/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import phuctt.daos.AccessoryDAO;
import phuctt.daos.AccountDAO;
import phuctt.daos.InvoiceAccessoryDAO;
import phuctt.daos.InvoiceServiceDAO;
import phuctt.daos.PetDAO;
import phuctt.daos.ServiceDAO;
import phuctt.daos.StaffDAO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class LoadDashboardAction {
    private long totalAccessory, totalAccessoryInvoice, confirmAccessoryInvoice, cancelAccessoryInvoice;
    private long totalService, totalServiceInvoice, confirmServiceInvoice, cancelServiceInvoice;
    
    private int totalStaff, availableStaff;
    private long totalPet, totalCat, totalDog, totalHamster;
    private long totalMem, totalAd;
    
    private String mess;
    
    public LoadDashboardAction() {
    }
    
    public String execute() throws Exception {
        try {
            totalAccessory = (new AccessoryDAO()).searchName("");
            totalAccessoryInvoice = (new InvoiceAccessoryDAO()).getTotalInvoice();
            confirmAccessoryInvoice = (new InvoiceAccessoryDAO()).getTotalInvoice(1);
            cancelAccessoryInvoice = (new InvoiceAccessoryDAO()).getTotalInvoice(-1);
            
            totalService = (new ServiceDAO()).searchName("");
            totalServiceInvoice = (new InvoiceServiceDAO()).getTotalInvoice();
            confirmServiceInvoice = (new InvoiceServiceDAO()).getTotalInvoice(1);
            cancelServiceInvoice = (new InvoiceServiceDAO()).getTotalInvoice(-1);
            
            totalStaff = (new StaffDAO()).searchName("");
            availableStaff = (new StaffDAO()).getTotalAvailableStaff();
            
            totalPet = (new PetDAO()).searchName("");
            totalDog = (new PetDAO()).getTotalType(1);
            totalCat = (new PetDAO()).getTotalType(2);
            totalHamster = (new PetDAO()).getTotalType(3);
            
            totalMem = (new AccountDAO()).getTotalRole("member");
            totalAd = (new AccountDAO()).getTotalRole("admin");
        } catch (Exception e) {
            Logger.log("ERROR at LoadDashboardAction : " + e.getMessage());
            mess = "Error";
        }
        
        return "success";
    }

    public long getTotalAccessory() {
        return totalAccessory;
    }

    public void setTotalAccessory(long totalAccessory) {
        this.totalAccessory = totalAccessory;
    }

    public long getTotalAccessoryInvoice() {
        return totalAccessoryInvoice;
    }

    public void setTotalAccessoryInvoice(long totalAccessoryInvoice) {
        this.totalAccessoryInvoice = totalAccessoryInvoice;
    }

    public long getConfirmAccessoryInvoice() {
        return confirmAccessoryInvoice;
    }

    public void setConfirmAccessoryInvoice(long confirmAccessoryInvoice) {
        this.confirmAccessoryInvoice = confirmAccessoryInvoice;
    }

    public long getCancelAccessoryInvoice() {
        return cancelAccessoryInvoice;
    }

    public void setCancelAccessoryInvoice(long cancelAccessoryInvoice) {
        this.cancelAccessoryInvoice = cancelAccessoryInvoice;
    }

    public long getTotalService() {
        return totalService;
    }

    public void setTotalService(long totalService) {
        this.totalService = totalService;
    }

    public long getTotalServiceInvoice() {
        return totalServiceInvoice;
    }

    public void setTotalServiceInvoice(long totalServiceInvoice) {
        this.totalServiceInvoice = totalServiceInvoice;
    }

    public long getConfirmServiceInvoice() {
        return confirmServiceInvoice;
    }

    public void setConfirmServiceInvoice(long confirmServiceInvoice) {
        this.confirmServiceInvoice = confirmServiceInvoice;
    }

    public long getCancelServiceInvoice() {
        return cancelServiceInvoice;
    }

    public void setCancelServiceInvoice(long cancelServiceInvoice) {
        this.cancelServiceInvoice = cancelServiceInvoice;
    }

    public int getTotalStaff() {
        return totalStaff;
    }

    public void setTotalStaff(int totalStaff) {
        this.totalStaff = totalStaff;
    }

    public int getAvailableStaff() {
        return availableStaff;
    }

    public void setAvailableStaff(int availableStaff) {
        this.availableStaff = availableStaff;
    }

    public long getTotalPet() {
        return totalPet;
    }

    public void setTotalPet(long totalPet) {
        this.totalPet = totalPet;
    }

    public long getTotalCat() {
        return totalCat;
    }

    public void setTotalCat(long totalCat) {
        this.totalCat = totalCat;
    }

    public long getTotalDog() {
        return totalDog;
    }

    public void setTotalDog(long totalDog) {
        this.totalDog = totalDog;
    }

    public long getTotalHamster() {
        return totalHamster;
    }

    public void setTotalHamster(long totalHamster) {
        this.totalHamster = totalHamster;
    }

    public long getTotalMem() {
        return totalMem;
    }

    public void setTotalMem(long totalMem) {
        this.totalMem = totalMem;
    }

    public long getTotalAd() {
        return totalAd;
    }

    public void setTotalAd(long totalAd) {
        this.totalAd = totalAd;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
    
}
