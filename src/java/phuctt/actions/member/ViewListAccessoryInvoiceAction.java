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
import phuctt.daos.InvoiceAccessoryDAO;
import phuctt.dtos.InvoiceAccessoryDTO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class ViewListAccessoryInvoiceAction {

    private String mess;
    private long page, numOfPage;
    private List<InvoiceAccessoryDTO> listAccessoryInvoice;

    private static final String ADMIN = "admin";
    private static final String MEMBER = "member";
    private static final String FAIL = "fail";

    public ViewListAccessoryInvoiceAction() {
        page = 1;
    }

    public String execute() {
        String label = FAIL;
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();

            String username = (String) session.get("USERNAME");
            String role = (String) session.get("ROLE");

            if (page < 1) {
                page = 1;
            }

            InvoiceAccessoryDAO dao = new InvoiceAccessoryDAO();

            if (role.equalsIgnoreCase("member")) {
                long recordCount = dao.getAllMember(username);
                numOfPage = (long) Math.ceil(recordCount * 1.0 / 5);

                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 5) {
                        page = 1;
                    }
                    listAccessoryInvoice = dao.getAllMember(username, page);
                } else {
                    listAccessoryInvoice = new ArrayList<>();
                }
                label = MEMBER;
            } else if (role.equalsIgnoreCase("admin")) {
                long recordCount = dao.adminGetListInvoice();
                numOfPage = (long) Math.ceil(recordCount * 1.0 / 5);
                
                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 5) {
                        page = 1;
                    }
                    listAccessoryInvoice = dao.adminGetListInvoice(page);
                } else {
                    listAccessoryInvoice = new ArrayList<>();
                }
                label = ADMIN;
            }
        } catch (Exception e) {
            Logger.log("ERROR at ViewListAccessoryInvoiceAction : " + e.getMessage());
            mess = "Error";
        }
        return label;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public long getPage() {
        return page;
    }

    public void setPage(long page) {
        this.page = page;
    }

    public long getNumOfPage() {
        return numOfPage;
    }

    public void setNumOfPage(long numOfPage) {
        this.numOfPage = numOfPage;
    }

    public List<InvoiceAccessoryDTO> getListAccessoryInvoice() {
        return listAccessoryInvoice;
    }

    public void setListAccessoryInvoice(List<InvoiceAccessoryDTO> listAccessoryInvoice) {
        this.listAccessoryInvoice = listAccessoryInvoice;
    }

}
