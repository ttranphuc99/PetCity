/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import phuctt.daos.StaffDAO;
import phuctt.dtos.StaffDTO;

/**
 *
 * @author Thien Phuc
 */
public class AdminViewDetailStaffAction {
    private int id;
    private String mess;
    private StaffDTO dto;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public AdminViewDetailStaffAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            StaffDAO dao = new StaffDAO();
            
            dto = dao.findByID(id);
            
            if (dto != null) {
                dto.setId(id);
                label = SUCCESS;
            } else {
                mess = "Error found";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "Error";
        }
        return label;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public StaffDTO getDto() {
        return dto;
    }

    public void setDto(StaffDTO dto) {
        this.dto = dto;
    }
    
}
