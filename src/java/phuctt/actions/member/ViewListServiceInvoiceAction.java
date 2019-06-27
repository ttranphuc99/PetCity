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
import phuctt.daos.InvoiceServiceDAO;
import phuctt.dtos.InvoiceServiceDTO;

/**
 *
 * @author Thien Phuc
 */
public class ViewListServiceInvoiceAction {
    private String mess;
    private long page, numOfPage;
    private List<InvoiceServiceDTO> listServiceInvoice;

    private static final String ADMIN = "admin";
    private static final String MEMBER = "member";
    private static final String FAIL = "fail";
    
    public ViewListServiceInvoiceAction() {
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

            InvoiceServiceDAO dao = new InvoiceServiceDAO();

            if (role.equalsIgnoreCase("member")) {
                long recordCount = dao.getListInvoiceOfMember(username);
                numOfPage = (long) Math.ceil(recordCount * 1.0 / 5);

                if (recordCount > 0) {
                    if (recordCount < (page - 1) * 5) {
                        page = 1;
                    }
                    listServiceInvoice = dao.getListInvoiceOfMember(username, page);
                } else {
                    listServiceInvoice = new ArrayList<>();
                }
                label = MEMBER;
            } else if (role.equalsIgnoreCase("admin")) {
//                long recordCount = dao.adminGetListInvoice();
//                numOfPage = (long) Math.ceil(recordCount * 1.0 / 5);
//                
//                if (recordCount > 0) {
//                    if (recordCount < (page - 1) * 5) {
//                        page = 1;
//                    }
//                    listAccessoryInvoice = dao.adminGetListInvoice(page);
//                } else {
//                    listAccessoryInvoice = new ArrayList<>();
//                }
                label = ADMIN;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public List<InvoiceServiceDTO> getListServiceInvoice() {
        return listServiceInvoice;
    }

    public void setListServiceInvoice(List<InvoiceServiceDTO> listServiceInvoice) {
        this.listServiceInvoice = listServiceInvoice;
    }
    
}
