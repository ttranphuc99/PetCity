/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.admin;

import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import phuctt.daos.InvoiceServiceDAO;
import phuctt.dtos.InvoiceServiceDTO;
import phuctt.dtos.StaffDTO;

/**
 *
 * @author Thien Phuc
 */
public class UpdateInvoiceServiceAction {

    private long id;
    private int staff, status;
    private String mess;
    private int page;

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

    public UpdateInvoiceServiceAction() {
    }

    public String execute() {
        String label = FAIL;
        try {
            Map<String, Object> session = ActionContext.getContext().getSession();
            String username = (String) session.get("USERNAME");
            InvoiceServiceDAO dao = new InvoiceServiceDAO();

            if (staff != -1) {
                InvoiceServiceDTO service = dao.findById(id);

                List<StaffDTO> listStaff = dao.adminListStaffAvailableForService(service);

                boolean flag = false;
                for (int i = 0; i < listStaff.size(); i++) {
                    if (listStaff.get(i).getId() == staff) {
                        flag = true;
                        break;
                    }
                }

                if (flag && status == 1) {
                    if (dao.update(id, staff, status, username)) {
                        label = SUCCESS;
                        mess = "Update successfully";
                    } else {
                        mess = "Update fail";
                    }
                } else {
                    if (status != 1) {
                        mess = "Error retrieve form control";
                    } else {
                        mess = "Staff is not available";
                    }
                }
            } else {
                if (dao.update(id, staff, status, username)) {
                    label = SUCCESS;
                    mess = "Update successfully";
                } else {
                    mess = "Update fail";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            mess = "Error";
        }
        return label;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getStaff() {
        return staff;
    }

    public void setStaff(int staff) {
        this.staff = staff;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
}
