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
import phuctt.dtos.AccountDTO;

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
            
            String sql = "SELECT role, fullname FROM Account WHERE username = ? AND password = ? AND isDelete = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setBoolean(3, false);
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
    
    public boolean signUp(AccountDTO dto) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "INSERT INTO Account(username, password, fullname, isDelete, gender, role) VALUES(?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getUsername());
            ps.setString(2, dto.getPassword());
            ps.setString(3, dto.getFullname());
            ps.setBoolean(4, dto.isDelete());
            ps.setBoolean(5, dto.isGender());
            ps.setString(6, dto.getRole());
            
            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public AccountDTO getAccountByID(String username) throws SQLException, ClassNotFoundException {
        AccountDTO dto = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT fullname, address, phone, gender FROM Account WHERE username = ? AND isDelete = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setBoolean(2, false);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                String fullname = rs.getString("fullname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                boolean gender = rs.getBoolean("gender");
                
                dto = new AccountDTO(username, "", fullname, address, phone, "", false, gender);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public boolean update(AccountDTO dto) throws ClassNotFoundException, SQLException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "UPDATE Account SET fullname = ?, address = ?, phone = ?, gender = ? WHERE username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getFullname());
            ps.setString(2, dto.getAddress());
            ps.setString(3, dto.getPhone());
            ps.setBoolean(4, dto.isGender());
            ps.setString(5, dto.getUsername());
            
            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean changePassword(String username, String newPassword) throws ClassNotFoundException, SQLException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "UPDATE Account SET password = ? WHERE username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            
            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
