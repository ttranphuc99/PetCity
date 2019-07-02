/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import java.util.ArrayList;
import java.util.List;
import phuctt.daos.PetDAO;
import phuctt.dtos.PetDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class AdminViewListPetAction {
    private int page, numOfPage;
    private List<PetDTO> list;
    private String name, mess;
    
    public AdminViewListPetAction() {
        page = 1;
        name = "";
    }
    
    public String execute() {
        try {
            if (page < 1) page = 1;
            
            PetDAO dao = new PetDAO();
            
            int recordCount = dao.searchName(name);
            numOfPage = (int) Math.ceil(recordCount * 1.0 / 5);

            if (recordCount > 0) {
                if (recordCount < (page - 1) * 5) {
                    page = 1;
                }
                list = dao.searchName(name, page);
            } else {
                list = new ArrayList<>();
                mess = "Not found";
            }
        } catch (Exception e) {
            Logger.log("ERROR at AdminViewListPetAction : " + e.getMessage());
        }
        return "success";
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

    public List<PetDTO> getList() {
        return list;
    }

    public void setList(List<PetDTO> list) {
        this.list = list;
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
    
    
}
