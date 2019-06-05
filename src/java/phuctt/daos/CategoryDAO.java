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
import java.util.ArrayList;
import java.util.List;
import phuctt.dbs.DBConnection;
import phuctt.dtos.CategoryDTO;

/**
 *
 * @author Thien Phuc
 */
public class CategoryDAO implements Serializable {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws SQLException {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public List<CategoryDTO> searchByLikeName(String search) throws SQLException, ClassNotFoundException {
        List<CategoryDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT categoryID, name FROM Category WHERE name LIKE ? AND isDelete = ?";
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, "%" +search+ "%");
            ps.setBoolean(2, false);
            
            rs = ps.executeQuery();
            
            int id;
            String name;
            CategoryDTO dto;
            result = new ArrayList<>();
            
            while (rs.next()) {
                id = rs.getInt("categoryID");
                name = rs.getString("name");
                
                dto = new CategoryDTO(id, name);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
