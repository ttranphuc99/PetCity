/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import java.util.ArrayList;
import java.util.List;
import phuctt.daos.ServiceDAO;
import phuctt.dtos.ServiceDTO;

/**
 *
 * @author Thien Phuc
 */
public class AdminViewListServiceAction {
    private String name, mess;
    private int page, numOfPage;
    private List<ServiceDTO> listService;
    
    public AdminViewListServiceAction() {
        name = "";
        page = 1;
    }
    
    public String execute() {
        String label = "success";
        try {
            if (page < 1) page = 1;
            
            ServiceDAO dao = new ServiceDAO();
            
            int recordCount = dao.searchName(name);
            numOfPage = (int) Math.ceil(recordCount * 1.0 / 5);
            
            if (recordCount > 0) {
                if (recordCount < (page - 1) * 5) {
                    page = 1;
                }
                listService = dao.searchName(name, page);
            } else {
                listService = new ArrayList<>();
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getNumOfPage() {
        return numOfPage;
    }

    public void setNumOfPage(int numOfPage) {
        this.numOfPage = numOfPage;
    }

    public List<ServiceDTO> getListService() {
        return listService;
    }

    public void setListService(List<ServiceDTO> listService) {
        this.listService = listService;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
    
}
