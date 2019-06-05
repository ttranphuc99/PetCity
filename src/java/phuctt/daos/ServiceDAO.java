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
import java.sql.Statement;
import phuctt.dbs.DBConnection;
import phuctt.dtos.ServiceDTO;

/**
 *
 * @author Thien Phuc
 */
public class ServiceDAO implements Serializable {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws SQLException {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public int add(ServiceDTO dto) throws SQLException, ClassNotFoundException {
        int id = -1;
        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO Service(name, forType, duration, price, description, isDelete) VALUES(?,?,?,?,?,?)";
            
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, dto.getName());
            ps.setInt(2, dto.getType().getId());
            ps.setFloat(3, dto.getDuration());
            ps.setFloat(4, dto.getPrice());
            ps.setString(5, dto.getDescription());
            ps.setBoolean(6, false);
            
            boolean check = ps.executeUpdate() > 0;
            
            if (check) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    id = rs.getInt(1);
                }
            }
        } finally {
            closeConnection();
        }
        return id;
    }
    
    public boolean updateImage(int id, String image) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE Service SET image = ? WHERE serviceID = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, image);
            ps.setInt(2, id);
            
            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
