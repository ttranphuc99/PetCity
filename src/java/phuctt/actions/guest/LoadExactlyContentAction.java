/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import java.util.List;
import phuctt.daos.AccessoryDAO;
import phuctt.dtos.AccessoryDTO;

/**
 *
 * @author Thien Phuc
 */
public class LoadExactlyContentAction {
    private int forType, categoryID, numOfPage;
    private List<AccessoryDTO> list;
    
    public LoadExactlyContentAction() {
    }
    
    public String execute() {
        try {
            AccessoryDAO dao = new AccessoryDAO();
            
            list = dao.loadTopMostBuy(5, forType, categoryID);
            
            int recordCount = dao.loadNumTopAccessory(forType, categoryID);
            numOfPage = (int) Math.ceil(recordCount*1.0 / 5);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    public int getForType() {
        return forType;
    }

    public void setForType(int forType) {
        this.forType = forType;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getNumOfPage() {
        return numOfPage;
    }

    public void setNumOfPage(int numOfPage) {
        this.numOfPage = numOfPage;
    }

    public List<AccessoryDTO> getList() {
        return list;
    }

    public void setList(List<AccessoryDTO> list) {
        this.list = list;
    }
    
}
