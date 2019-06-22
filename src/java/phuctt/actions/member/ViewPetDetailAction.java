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
import phuctt.daos.TypeDAO;
import phuctt.dtos.PetDTO;
import phuctt.dtos.TypeDTO;

/**
 *
 * @author Thien Phuc
 */
public class ViewPetDetailAction {

    private long id;
    private PetDTO dto;
    private String mess;
    private List<TypeDTO> listType;

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

    public ViewPetDetailAction() {
    }

    public String execute() {
        String label = FAIL;
        try {
            PetDAO dao = new PetDAO();

            Map<String, Object> session = ActionContext.getContext().getSession();
            String username = (String) session.get("USERNAME");

            if (dao.belongTo(username, id)) {
                dto = dao.findByID(id);
                
                TypeDAO typeDao = new TypeDAO();
                listType = typeDao.searchByLikeName("");
                
                label = SUCCESS;
            } else {
                mess = "You don't have right to access this Pet";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "Error";
        }
        return label;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public PetDTO getDto() {
        return dto;
    }

    public void setDto(PetDTO dto) {
        this.dto = dto;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public List<TypeDTO> getListType() {
        return listType;
    }

    public void setListType(List<TypeDTO> listType) {
        this.listType = listType;
    }

}
