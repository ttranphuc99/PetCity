/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import java.util.ArrayList;
import java.util.List;
import phuctt.daos.AccessoryDAO;
import phuctt.dtos.AccessoryDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class SearchNameAccessoryAction {

    private String search, mess, action;
    private List<AccessoryDTO> result;
    private int page, numOfPage;

    private static final String JSON = "json";
    private static final String PAGE = "page";

    public SearchNameAccessoryAction() {
        page = 1;
        action = "";
    }

    public String execute() {
        String label = JSON;
        try {
            AccessoryDAO dao = new AccessoryDAO();

            int recordCount = dao.searchName(search);
            numOfPage = (int) Math.ceil(recordCount * 1.0 / 5);

            if (recordCount > 0) {
                if (recordCount < (page - 1) * 5) {
                    page = 1;
                }
                result = dao.searchName(search, page);

                if (action.equalsIgnoreCase("page")) {
                    if (page == 1) {
                        page++;
                        result.addAll(dao.searchName(search, page));
                    }
                    label = PAGE;
                }
            } else {
                result = new ArrayList<>();
            }
        } catch (Exception e) {
            Logger.log("ERROR at SearchNameAccessoryAction : " + e.getMessage());
        }

        return label;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public List<AccessoryDTO> getResult() {
        return result;
    }

    public void setResult(List<AccessoryDTO> result) {
        this.result = result;
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

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

}
