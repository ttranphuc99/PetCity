/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import java.util.List;
import phuctt.daos.AccessoryDAO;
import phuctt.daos.CategoryDAO;
import phuctt.daos.TypeDAO;
import phuctt.dtos.AccessoryDTO;
import phuctt.dtos.CategoryDTO;
import phuctt.dtos.TypeDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class AdminViewDetailAccessoryAction {
    private long id;
    private AccessoryDTO dto;
    private String mess;
    private List<CategoryDTO> listCategory;
    private List<TypeDTO> listType;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    public AdminViewDetailAccessoryAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            CategoryDAO cateDao = new CategoryDAO();
            listCategory = cateDao.searchByLikeName("");
            
            TypeDAO typeDao = new TypeDAO();
            listType = typeDao.searchByLikeName("");
            
            AccessoryDAO dao = new AccessoryDAO();
            dto = dao.findById(id);
            
            if (dto != null) {
                label = SUCCESS;
            }
        } catch (Exception e) {
            Logger.log("ERROR at AdminViewDetailAccessoryAction : " + e.getMessage());
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

    public AccessoryDTO getDto() {
        return dto;
    }

    public void setDto(AccessoryDTO dto) {
        this.dto = dto;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public List<CategoryDTO> getListCategory() {
        return listCategory;
    }

    public void setListCategory(List<CategoryDTO> listCategory) {
        this.listCategory = listCategory;
    }

    public List<TypeDTO> getListType() {
        return listType;
    }

    public void setListType(List<TypeDTO> listType) {
        this.listType = listType;
    }
    
}
