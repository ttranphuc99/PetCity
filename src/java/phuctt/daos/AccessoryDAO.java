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
import phuctt.dtos.AccessoryDTO;

/**
 *
 * @author Thien Phuc
 */
public class AccessoryDAO implements Serializable {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws SQLException {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public long add(AccessoryDTO dto) throws SQLException, ClassNotFoundException {
        long id = -1;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "INSERT INTO Accessory(name, brand, price, description, categoryID, quantity, isDelete, forType, image) VALUES(?,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, dto.getName());
            ps.setString(2, dto.getBrand());
            ps.setFloat(3, dto.getPrice());
            ps.setString(4, dto.getDescription());
            ps.setInt(5, dto.getCategory().getId());
            ps.setInt(6, dto.getQuantity());
            ps.setBoolean(7, false);
            ps.setInt(8, dto.getType().getId());
            ps.setString(9, dto.getImage());
            boolean check = ps.executeUpdate() > 0;
            
            if (check) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    id = rs.getInt(1);
                    System.out.println("id: " + id);
                }
            }
        } finally {
            closeConnection();
        }
        return id;
    }
    
    public boolean updateImage(long id, String image) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            
            String sql = " UPDATE Accessory SET image = ? WHERE accessoryID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, image);
            ps.setLong(2, id);
            
            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
