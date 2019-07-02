/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import java.util.List;
import phuctt.daos.ServiceDAO;
import phuctt.daos.ServiceStaffDAO;
import phuctt.daos.StaffDAO;
import phuctt.daos.TypeDAO;
import phuctt.dtos.ServiceDTO;
import phuctt.dtos.StaffDTO;
import phuctt.dtos.TypeDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class AdminViewDetailServiceAction {
    private int id;
    private String mess;
    private ServiceDTO dto;
    private List<StaffDTO> listStaff;
    private List<Integer> listStaffDoing;
    private List<TypeDTO> listType;
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    public AdminViewDetailServiceAction() {
    }
    
    public String execute() {
        String label = FAIL;
        try {
            ServiceDAO dao = new ServiceDAO();
            
            dto = dao.findByID(id);
            
            if (dto != null) {
                listType = (new TypeDAO()).searchByLikeName("");
                listStaff = (new StaffDAO()).searchByLikeName("");
                listStaffDoing = (new ServiceStaffDAO()).findByService(id);
                
                for (int i = 0; i < listStaff.size(); i++) {
                    if(listStaffDoing.contains(listStaff.get(i).getId())) {
                        listStaff.get(i).setDelete(true);
                    } else {
                        listStaff.get(i).setDelete(false);
                    }
                }
                label = SUCCESS;
            } else {
                mess = " Not found!";
            }
        } catch (Exception e) {
            Logger.log("ERROR at AdminViewDetailServiceAction : " + e.getMessage());
            mess = "error";
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

    public List<StaffDTO> getListStaff() {
        return listStaff;
    }

    public void setListStaff(List<StaffDTO> listStaff) {
        this.listStaff = listStaff;
    }

    public List<TypeDTO> getListType() {
        return listType;
    }

    public void setListType(List<TypeDTO> listType) {
        this.listType = listType;
    }

    public List<Integer> getListStaffDoing() {
        return listStaffDoing;
    }

    public void setListStaffDoing(List<Integer> listStaffDoing) {
        this.listStaffDoing = listStaffDoing;
    }
    
    
}
