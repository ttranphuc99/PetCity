/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.dtos.ServiceDTO;

/**
 *
 * @author Thien Phuc
 */
public class BookServiceAction {
    private int id;
    private String mess;
    private ServiceDTO dto;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public BookServiceAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            String username = (String) session.get("USERNAME");
            
            if (username == null) {
                mess = "You must login to book service";
            } else {
                
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public ServiceDTO getDto() {
        return dto;
    }

    public void setDto(ServiceDTO dto) {
        this.dto = dto;
    }
    
    
}
