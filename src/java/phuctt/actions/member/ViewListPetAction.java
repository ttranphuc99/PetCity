/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.member;

import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import phuctt.daos.PetDAO;
import phuctt.dtos.PetDTO;

/**
 *
 * @author Thien Phuc
 */
public class ViewListPetAction {
    private String name, mess;
    private int page, numOfPage;
    private List<PetDTO> listPet;
    
    public ViewListPetAction() {
        name = "";
        page = 1;
    }
    
    public String execute() {
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            
            String username = (String) session.get("USERNAME");
            
            if (page < 1) page = 1;
            
            PetDAO dao = new PetDAO();
            
            int recordCount = dao.searchName(name, username);
            numOfPage = (int) Math.ceil(recordCount * 1.0 / 5);

            if (recordCount > 0) {
                if (recordCount < (page - 1) * 5) {
                    page = 1;
                }
                listPet = dao.searchName(name,username, page);
            } else {
                listPet = new ArrayList<>();
                mess = "Not found";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
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

    public List<PetDTO> getListPet() {
        return listPet;
    }

    public void setListPet(List<PetDTO> listPet) {
        this.listPet = listPet;
    }
    
}
