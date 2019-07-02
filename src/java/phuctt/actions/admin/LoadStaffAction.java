/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import java.util.List;
import phuctt.daos.StaffDAO;
import phuctt.dtos.StaffDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class LoadStaffAction {
    private List<StaffDTO> listStaff;
    private String locationPlace, mess;
    
    public LoadStaffAction() {
    }
    
    public String execute() {
        System.out.println("load staff");
        String label = "fail";
        try {
            StaffDAO dao = new StaffDAO();
            listStaff = dao.searchByLikeName("");
            System.out.println(listStaff);
            label = locationPlace;
        } catch (Exception e) {
            mess = "Error DB";
            Logger.log("ERROR at LoadStaffAction : " + e.getMessage());
        }
        return label;
    }

    public List<StaffDTO> getListStaff() {
        return listStaff;
    }

    public void setListStaff(List<StaffDTO> listStaff) {
        this.listStaff = listStaff;
    }

    public String getLocationPlace() {
        return locationPlace;
    }

    public void setLocationPlace(String locationPlace) {
        this.locationPlace = locationPlace;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
    
}
