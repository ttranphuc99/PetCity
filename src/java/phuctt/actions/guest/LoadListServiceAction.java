/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import java.util.List;
import phuctt.daos.ServiceDAO;
import phuctt.dtos.ServiceDTO;

/**
 *
 * @author Thien Phuc
 */
public class LoadListServiceAction {
    private List<ServiceDTO> list;
    private int type;
    
    private String mess;
    
    public LoadListServiceAction() {
        type = 1;
    }
    
    public String execute() {
        try {
            ServiceDAO dao = new ServiceDAO();
            list = dao.loadServiceToPage(type);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    public List<ServiceDTO> getList() {
        return list;
    }

    public void setList(List<ServiceDTO> list) {
        this.list = list;
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
}
