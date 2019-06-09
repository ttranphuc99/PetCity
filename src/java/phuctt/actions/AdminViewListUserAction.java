/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import java.util.ArrayList;
import java.util.List;
import phuctt.daos.AccountDAO;
import phuctt.dtos.AccountDTO;

/**
 *
 * @author Thien Phuc
 */
public class AdminViewListUserAction {

    private String fullname, phone, mess;
    private int page, numOfPage;
    private List<AccountDTO> listUser;

    public AdminViewListUserAction() {
        fullname = "";
        phone = "";
        page = 1;
    }

    public String execute() throws Exception {
        String label = "success";
        try {
            if (page < 1) {
                page = 1;
            }
            AccountDAO dao = new AccountDAO();

            int recordCount = dao.searchByLikeNamePhone(fullname, phone, "member");
            numOfPage = (int) Math.ceil(recordCount * 1.0 / 10);

            if (recordCount > 0) {
                if (recordCount < (page - 1) * 10) {
                    page = 1;
                }
                listUser = dao.searchByLikeNamePhone(fullname, phone, "member", page);
            } else {
                listUser = new ArrayList<>();
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "Error";
        }
        return label;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public List<AccountDTO> getListUser() {
        return listUser;
    }

    public void setListUser(List<AccountDTO> listUser) {
        this.listUser = listUser;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

}
