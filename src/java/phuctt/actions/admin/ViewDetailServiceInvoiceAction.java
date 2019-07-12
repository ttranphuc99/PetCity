/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import phuctt.daos.InvoiceServiceDAO;
import phuctt.dtos.InvoiceServiceDTO;
import phuctt.dtos.StaffDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class ViewDetailServiceInvoiceAction {
    private String mess;
    private long id;
    private InvoiceServiceDTO dto;
    private int page;
    private List<StaffDTO> listStaff;
    
    private static final String ADMIN = "admin";
    private static final String MEMBER = "member";
    private static final String FAIL = "fail";
    
    public ViewDetailServiceInvoiceAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            System.out.println(page);
            InvoiceServiceDAO dao = new InvoiceServiceDAO();
            
            dto = dao.findById(id);
            
            if (dto != null) {
                Map<String, Object> session = ActionContext.getContext().getSession();
                String role = (String) session.get("ROLE");
                
                if (role.equalsIgnoreCase("member")) {
                    label = MEMBER;
                } else {
                    listStaff = dao.adminListStaffAvailableForService(dto);
                    label = ADMIN;
                }
            } else {
                mess = "Not found!";
            }
        } catch (Exception e) {
            Logger.log("ERROR at ViewDetailServiceInvoiceAction : " + e.getMessage());
        }
        return label;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public InvoiceServiceDTO getDto() {
        return dto;
    }

    public void setDto(InvoiceServiceDTO dto) {
        this.dto = dto;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public List<StaffDTO> getListStaff() {
        return listStaff;
    }

    public void setListStaff(List<StaffDTO> listStaff) {
        this.listStaff = listStaff;
    }
    
    
}
