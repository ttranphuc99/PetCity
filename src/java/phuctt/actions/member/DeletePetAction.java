/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.daos.PetDAO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class DeletePetAction {
    private long id;
    private String mess;
    
    public DeletePetAction() {
    }
    
    public String execute() {
        try {
            PetDAO dao = new PetDAO();
            
            Map<String, Object> session = ActionContext.getContext().getSession();
            String username = (String) session.get("USERNAME");
            
            if (dao.belongTo(username, id)) {
                if (dao.delete(id)) {
                    mess = "Delete pet successfully!";
                } else {
                    mess = "Delete failed";
                }
            } else {
                mess = "You don't have access to delete this pet";
            }
        } catch (Exception e) {
            Logger.log("ERROR at DeletePetAction : " + e.getMessage());
            mess = "Error";
        }
        return "success";
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
    
}
