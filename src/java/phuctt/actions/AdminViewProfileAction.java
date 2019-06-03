/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import phuctt.daos.AccountDAO;
import phuctt.dtos.AccountDTO;

/**
 *
 * @author Thien Phuc
 */
public class AdminViewProfileAction {
    private String username, mess;
    private AccountDTO dto;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public AdminViewProfileAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            AccountDAO dao = new AccountDAO();
            dto = dao.getAccountByID(username);
            
            if (dto != null) label = SUCCESS;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return label;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public AccountDTO getDto() {
        return dto;
    }

    public void setDto(AccountDTO dto) {
        this.dto = dto;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
}
