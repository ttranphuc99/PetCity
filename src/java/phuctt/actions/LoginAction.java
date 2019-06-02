/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.daos.AccountDAO;

/**
 *
 * @author Thien Phuc
 */
public class LoginAction {

    private String username, password;
    private String errorMess, mess;
    private static final String ADMIN = "admin";
    private static final String USER = "user";
    private static final String FAIL = "fail";

    public LoginAction() {
    }

    public String execute() throws Exception {
        String label = FAIL;
        try {
            AccountDAO dao = new AccountDAO();
            String[] result = dao.checkLogin(username, password);
            if (result != null) {
                Map session = ActionContext.getContext().getSession();
                session.put("USERNAME", username);
                session.put("FULLNAME", result[1]);
                mess = "Login Succesfully!";
                if (result[0].equals("admin")) {
                    session.put("ROLE", result[0]);
                    label = ADMIN;
                } else if (result[0].equals("user")) {
                    session.put("ROLE", "user");
                    label = USER;
                } else {
                    session.clear();
                    errorMess = "Your account is not support!";
                    mess = "";
                }
            } else {
                errorMess = "Invalid username or password";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return label;
        }
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

    public String getErrorMess() {
        return errorMess;
    }

    public void setErrorMess(String errorMess) {
        this.errorMess = errorMess;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
}
