/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.actions.guest;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import phuctt.daos.AccountDAO;
import phuctt.log.Logger;

/**
 *
 * @author Thien Phuc
 */
public class LoginAction {

    private String username, password;
    private String mess;
    private static final String ADMIN = "admin";
    private static final String MEMBER = "member";
    private static final String FAIL = "fail";

    public LoginAction() {
    }

    public String execute() {
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
                } else if (result[0].equals("member")) {
                    session.put("ROLE", "member");
                    label = MEMBER;
                } else {
                    session.clear();
                    mess = "Your account is not support!";
                }
            } else {
                mess = "Invalid username or password";
            }
        } catch (Exception e) {
            Logger.log("ERROR at LoginAction : " + e.getMessage());
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

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }
}
