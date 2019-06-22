/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import java.util.List;
import phuctt.daos.PetDAO;
import phuctt.daos.TypeDAO;
import phuctt.dtos.PetDTO;
import phuctt.dtos.TypeDTO;

/**
 *
 * @author Thien Phuc
 */
public class UpdatePetAction {
    private long id;
    private String name, gender, mess;
    private int type, birthYear;
    private PetDTO dto;
    private List<TypeDTO> listType;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public UpdatePetAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            TypeDTO typeDto = new TypeDTO();
            typeDto.setId(type);
            
            dto = new PetDTO(name, null, birthYear, typeDto, gender.equalsIgnoreCase("male"));
            dto.setId(id);
            
            PetDAO dao = new PetDAO();
            
            if (dao.update(dto)) {
                mess = "Update successfully";
                label = SUCCESS;
            } else {
                TypeDAO typeDao = new TypeDAO();
                listType = typeDao.searchByLikeName("");
                mess = "Update fail";
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

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public PetDTO getDto() {
        return dto;
    }

    public void setDto(PetDTO dto) {
        this.dto = dto;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }

    public List<TypeDTO> getListType() {
        return listType;
    }

    public void setListType(List<TypeDTO> listType) {
        this.listType = listType;
    }
    
    
}
