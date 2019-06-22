/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.daos.PetDAO;
import phuctt.dtos.AccountDTO;
import phuctt.dtos.PetDTO;
import phuctt.dtos.TypeDTO;

/**
 *
 * @author Thien Phuc
 */
public class AddPetAction {
    private String name, gender, mess;
    private int type, birthYear;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public AddPetAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            String username = (String) session.get("USERNAME");
            
            AccountDTO owner = new AccountDTO();
            owner.setUsername(username);
            
            TypeDTO typeDto = new TypeDTO();
            typeDto.setId(type);
            
            PetDTO dto = new PetDTO(name, owner, birthYear, typeDto, gender.equalsIgnoreCase("male"));
            
            PetDAO dao = new PetDAO();
            if (dao.insert(dto)) {
                label = SUCCESS;
                mess = "Add pet successfully!";
            } else {
                mess = "Add pet failed!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "Error";
        }
        return label;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
}
