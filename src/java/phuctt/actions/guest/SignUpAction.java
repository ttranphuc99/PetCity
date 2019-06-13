/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import phuctt.daos.AccountDAO;
import phuctt.dtos.AccountDTO;

/**
 *
 * @author Thien Phuc
 */
public class SignUpAction {

    private String username, password, confirm, fullname, gender;
    private String mess;
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";

    public SignUpAction() {
    }

    public String execute() throws Exception {
        String label = FAIL;
        try {
            boolean isValid = true;
            if (!confirm.equals(password)) {
                isValid = false;
                mess = "Confirm password is not matching";
            }

            if (isValid) {

                AccountDAO dao = new AccountDAO();
                AccountDTO dto = new AccountDTO(username, password, fullname, "member", gender.equalsIgnoreCase("male"));

                if (dao.signUp(dto)) {
                    label = SUCCESS;
                } else {
                    mess = "Sign Up Failed!";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (e.getMessage().contains("duplicate")) {
                mess = "Username is existed!";
            } else {
                e.printStackTrace();
            }
        }
        return label;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }
    
}
