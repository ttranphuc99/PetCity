/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import java.util.List;
import phuctt.daos.AccessoryDAO;
import phuctt.dtos.AccessoryDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class AjaxLoadMoreAccessoryAction {
    private int forType, categoryID, page;
    private List<AccessoryDTO> list;
    private boolean more;
    
    public AjaxLoadMoreAccessoryAction() {
    }
    
    public String execute() {
        try {
            AccessoryDAO dao = new AccessoryDAO();
            
            list = dao.loadNumTopAccessory(5, forType, categoryID, page);
            
            int recordCount = dao.loadNumTopAccessory(forType, categoryID);
            int numOfPage = (int) Math.ceil(recordCount*1.0 / 5);
            
            more = page < numOfPage;
        } catch (Exception e) {
            Logger.log("ERROR at AjaxLoadMoreAccessoryAction : " + e.getMessage());
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public List<AccessoryDTO> getList() {
        return list;
    }

    public void setList(List<AccessoryDTO> list) {
        this.list = list;
    }

    public boolean isMore() {
        return more;
    }

    public void setMore(boolean more) {
        this.more = more;
    }
    
    
}
