/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuctt.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import phuctt.dbs.DBConnection;

/**
 *
 * @author Thien Phuc
 */
public class AccountDAO implements Serializable {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws SQLException {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public String[] checkLogin(String username, String password) throws SQLException, ClassNotFoundException {
        String[] result = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT role, fullname FROM Account WHERE username = ? AND password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                result = new String[2];
                result[0] = rs.getString("role");
                result[1] = rs.getString("fullname");
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}