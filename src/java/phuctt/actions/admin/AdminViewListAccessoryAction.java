/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import java.util.ArrayList;
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
public class AdminViewListAccessoryAction {

    private String searchName, mess;
    private int page, type, category;
    private List<AccessoryDTO> listAccessory;
    private List<CategoryDTO> listCategory;
    private List<TypeDTO> listType;
    private int numOfPage;

    public AdminViewListAccessoryAction() {
        type = -1;
        category = -1;
        searchName = "";
        page = 1;
    }

    public String execute() {
        String label = "success";
        try {
            if (page < 1) page = 1;
            AccessoryDAO dao = new AccessoryDAO();

            if (type > 0 && category > 0) {
                int recordCount = dao.search(searchName, category, type);
                numOfPage = (int) Math.ceil(recordCount*1.0 / 5);
                
                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 5) {
                        page = 1;
                    }
                    listAccessory = dao.search(searchName, category, type, page);
                } else {
                    listAccessory = new ArrayList<>();
                }
            } else if (type > 0) {
                int recordCount = dao.searchNameType(searchName, type);
                numOfPage = (int) Math.ceil(recordCount*1.0 / 5);

                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 5) {
                        page = 1;
                    }
                    listAccessory = dao.searchNameType(searchName, type, page);
                } else {
                    listAccessory = new ArrayList<>();
                }
            } else if (category > 0) {
                int recordCount = dao.searchNameCate(searchName, category);
                numOfPage = (int) Math.ceil(recordCount*1.0 / 5);

                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 5) {
                        page = 1;
                    }
                    listAccessory = dao.searchNameCate(searchName, category, page);
                } else {
                    listAccessory = new ArrayList<>();
                }
            } else {
                int recordCount = dao.searchName(searchName);
                numOfPage = (int) Math.ceil(recordCount*1.0 / 5);
                
                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 5) {
                        page = 1;
                    }
                    listAccessory = dao.searchName(searchName, page);
                } else {
                    listAccessory = new ArrayList<>();
                }
            }
            
            CategoryDAO cateDao = new CategoryDAO();
            listCategory = cateDao.searchByLikeName("");
            
            TypeDAO typeDao = new TypeDAO();
            listType = typeDao.searchByLikeName("");
        } catch (Exception e) {
            Logger.log("ERROR at AdminViewListAccessoryAction : " + e.getMessage());
            mess = "Error";
        }
        return label;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public List<AccessoryDTO> getListAccessory() {
        return listAccessory;
    }

    public void setListAccessory(List<AccessoryDTO> listAccessory) {
        this.listAccessory = listAccessory;
    }

    public String getSearchName() {
        return searchName;
    }

    public void setSearchName(String searchName) {
        this.searchName = searchName;
    }

    public int getNumOfPage() {
        return numOfPage;
    }

    public void setNumOfPage(int numOfPage) {
        this.numOfPage = numOfPage;
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
