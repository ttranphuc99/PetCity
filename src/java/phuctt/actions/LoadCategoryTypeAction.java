/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import java.util.List;
import phuctt.daos.CategoryDAO;
import phuctt.daos.TypeDAO;
import phuctt.dtos.CategoryDTO;
import phuctt.dtos.TypeDTO;

/**
 *
 * @author Thien Phuc
 */
public class LoadCategoryTypeAction {
    private List<CategoryDTO> listCategory;
    private List<TypeDTO> listType;
    private String mess;
    private String locationPlace;
    
    public LoadCategoryTypeAction() {
    }
    
    public String execute() {
        String label = "fail";
        try {
            CategoryDAO cateDao = new CategoryDAO();
            listCategory = cateDao.searchByLikeName("");
            
            TypeDAO typeDao = new TypeDAO();
            listType = typeDao.searchByLikeName("");
            label = locationPlace;
        } catch (Exception e) {
            mess = "Error DB";
            e.printStackTrace();
        }
        return label;
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

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public String getLocationPlace() {
        return locationPlace;
    }

    public void setLocationPlace(String locationPlace) {
        this.locationPlace = locationPlace;
    }
}
