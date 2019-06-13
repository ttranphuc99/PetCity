/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import java.util.ArrayList;
import java.util.List;
import phuctt.daos.StaffDAO;
import phuctt.dtos.StaffDTO;

/**
 *
 * @author Thien Phuc
 */
public class AdminViewListStaffAction {
    private String name, mess;
    private int page, numOfPage;
    private List<StaffDTO> listStaff;
    
    public AdminViewListStaffAction() {
        name = "";
        page = 1;
    }
    
    public String execute() {
        String label = "success";
        try {
            if (page < 1) page = 1;
            
            StaffDAO dao = new StaffDAO();
            
            int recordCount = dao.searchName(name);
            numOfPage = (int) Math.ceil(recordCount * 1.0 / 5);

            if (recordCount > 0) {
                if (recordCount < (page - 1) * 5) {
                    page = 1;
                }
                listStaff = dao.searchName(name, page);
            } else {
                listStaff = new ArrayList<>();
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

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
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

    public List<StaffDTO> getListStaff() {
        return listStaff;
    }

    public void setListStaff(List<StaffDTO> listStaff) {
        this.listStaff = listStaff;
    }
    
}
