/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import java.util.ArrayList;
import java.util.List;
import phuctt.daos.AccessoryDAO;
import phuctt.dtos.AccessoryDTO;

/**
 *
 * @author Thien Phuc
 */
public class AdminViewListAccessoryAction {

    private String page, searchName, mess;
    private String type, category;
    private List<AccessoryDTO> listAccessory;

    public AdminViewListAccessoryAction() {
        type = "-1";
        category = "-1";
        searchName = "";
    }

    public String execute() {
        String label = "success";
        try {
            int type = Integer.parseInt(this.type);
            int category = Integer.parseInt(this.category);
            int page = Integer.parseInt(this.page);
            System.out.println("page " + page);
            System.out.println("type " + type);
            System.out.println("category " + category);

            AccessoryDAO dao = new AccessoryDAO();

            if (type > 0 && category > 0) {
                int recordCount = dao.search(searchName, category, type);

                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 10) {
                        page = 1;
                    }
                    listAccessory = dao.search(searchName, category, type, page);
                } else {
                    listAccessory = new ArrayList<>();
                }
            } else if (type > 0) {
                int recordCount = dao.searchNameType(searchName, type);

                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 10) {
                        page = 1;
                    }
                    listAccessory = dao.searchNameType(searchName, type, page);
                } else {
                    listAccessory = new ArrayList<>();
                }
            } else if (category > 0) {
                int recordCount = dao.searchNameCate(searchName, category);

                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 10) {
                        page = 1;
                    }
                    listAccessory = dao.searchNameCate(searchName, category, page);
                } else {
                    listAccessory = new ArrayList<>();
                }
            } else {
                int recordCount = dao.searchName(searchName);
                System.out.println("count " + recordCount);
                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 10) {
                        page = 1;
                    }
                    System.out.println("page2" + this.page);
                    listAccessory = dao.searchName(searchName, page);
                } else {
                    listAccessory = new ArrayList<>();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "Error";
        }
        return label;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}
