/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.daos.AccountDAO;
import phuctt.dtos.AccountDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class LoadProfileAction {

    private AccountDTO dto;
    private String username;
    private String mess;

    public LoadProfileAction() {

    }

    public String execute() {
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            username = (String) session.get("USERNAME");
            
            AccountDAO dao = new AccountDAO();
            dto = dao.getAccountByID(username);
        } catch (Exception e) {
            Logger.log("ERROR at LoadProfileAction : " + e.getMessage());
        }
        return "success";
    }

    public AccountDTO getDto() {
        return dto;
    }

    public void setDto(AccountDTO dto) {
        this.dto = dto;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    
}
