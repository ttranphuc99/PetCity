/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import phuctt.daos.PetDAO;
import phuctt.daos.ServiceDAO;
import phuctt.dtos.PetDTO;
import phuctt.dtos.ServiceDTO;

/**
 *
 * @author Thien Phuc
 */
public class ViewServiceDetailAction {
    private int id;
    private String mess, error;
    private ServiceDTO dto;
    private List<PetDTO> listPet;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public ViewServiceDetailAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            String username = (String) session.get("USERNAME");
            
            if (username == null) {
                mess = "You must login to book service";
            } else {
                ServiceDAO dao = new ServiceDAO();
                dto = dao.findByID(id);
                System.out.println(dto);
                PetDAO petDao = new PetDAO();
                listPet = petDao.getAllPetByUser(username, dto.getType().getId());
                
                label = SUCCESS;
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

    public List<PetDTO> getListPet() {
        return listPet;
    }

    public void setListPet(List<PetDTO> listPet) {
        this.listPet = listPet;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    
}
