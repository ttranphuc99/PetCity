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
public class InvoiceServiceDTO implements Serializable {
    private long id;
    private Timestamp createTime;
    private String adminConfirm, doingDate;
    private PetDTO pet;
    private StaffDTO staffDoing;
    private ServiceDTO service;
    private float price, timeStart, duration;
    private int status;

    public InvoiceServiceDTO() {
    }

    public InvoiceServiceDTO(Timestamp createTime, String adminConfirm, String doingDate, PetDTO pet, StaffDTO staffDoing, ServiceDTO service, float price, float timeStart, float duration, int status) {
        this.createTime = createTime;
        this.adminConfirm = adminConfirm;
        this.doingDate = doingDate;
        this.pet = pet;
        this.staffDoing = staffDoing;
        this.service = service;
        this.price = price;
        this.timeStart = timeStart;
        this.duration = duration;
        this.status = status;
    }

    
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getAdminConfirm() {
        return adminConfirm;
    }

    public void setAdminConfirm(String adminConfirm) {
        this.adminConfirm = adminConfirm;
    }

    public String getDoingDate() {
        return doingDate;
    }

    public void setDoingDate(String doingDate) {
        this.doingDate = doingDate;
    }

    public PetDTO getPet() {
        return pet;
    }

    public void setPet(PetDTO pet) {
        this.pet = pet;
    }

    public StaffDTO getStaffDoing() {
        return staffDoing;
    }

    public void setStaffDoing(StaffDTO staffDoing) {
        this.staffDoing = staffDoing;
    }

    public ServiceDTO getService() {
        return service;
    }

    public void setService(ServiceDTO service) {
        this.service = service;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(float timeStart) {
        this.timeStart = timeStart;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public float getDuration() {
        return duration;
    }

    public void setDuration(float duration) {
        this.duration = duration;
    }
    
    
}
