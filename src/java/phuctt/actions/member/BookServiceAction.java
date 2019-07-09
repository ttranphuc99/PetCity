/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import com.opensymphony.xwork2.ActionContext;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import phuctt.daos.AccountDAO;
import phuctt.daos.InvoiceServiceDAO;
import phuctt.daos.ServiceDAO;
import phuctt.dtos.AccountDTO;
import phuctt.dtos.InvoiceServiceDTO;
import phuctt.dtos.PetDTO;
import phuctt.dtos.ServiceDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class BookServiceAction {

    private int serviceId;
    private long petId;
    private float timeStart;
    private String doingDate;
    private String error, mess;
    private ServiceDTO dto;

    private static final String FAIL = "fail";
    private static final String SUCCESS = "success";

    public BookServiceAction() {
    }

    public String execute() {
        String label = FAIL;
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();

            String username = (String) session.get("USERNAME");

            AccountDTO account = (new AccountDAO()).getAccountByID(username);

            if (account != null) {
                Timestamp createTime = new Timestamp((new Date()).getTime());
                dto = (new ServiceDAO()).findByID(serviceId);
                float price = dto.getPrice();
                float duration = dto.getDuration();

                PetDTO pet = new PetDTO();
                pet.setId(petId);

                InvoiceServiceDTO invoice = new InvoiceServiceDTO(createTime, null, doingDate, pet, null, dto, price, timeStart, duration, 0);

                InvoiceServiceDAO dao = new InvoiceServiceDAO();

                if (dao.isPetFree(invoice)) {
                    if (!dao.listStaffAvailableForService(invoice).isEmpty()) {
                        if (dao.insert(invoice)) {
                            label = SUCCESS;
                            mess = "Book Successfully";
                        } else {
                            mess = "Book service fail";
                        }
                    } else {
                        error = "No staff available at this time";
                        mess = "Book service fail";
                    }
                } else {
                    error = "Your Pet is not free at this time";
                    mess = "Book service fail";
                }
            } else {
                mess = "Your account is having error! Cannot interact with our system";
            }
        } catch (Exception e) {
            Logger.log("ERROR at BookServiceAction : " + e.getMessage());
            mess = "Error";
        }
        return label;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public long getPetId() {
        return petId;
    }

    public void setPetId(long petId) {
        this.petId = petId;
    }

    public float getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(float timeStart) {
        this.timeStart = timeStart;
    }

    public String getDoingDate() {
        return doingDate;
    }

    public void setDoingDate(String doingDate) {
        this.doingDate = doingDate;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public ServiceDTO getDto() {
        return dto;
    }

    public void setDto(ServiceDTO dto) {
        this.dto = dto;
    }

}
