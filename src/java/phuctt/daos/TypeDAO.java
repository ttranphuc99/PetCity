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
import phuctt.dtos.TypeDTO;

/**
 *
 * @author Thien Phuc
 */
public class TypeDAO implements Serializable {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws SQLException {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public List<TypeDTO> searchByLikeName(String search) throws SQLException {
        List<TypeDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT typeID, name FROM Type WHERE name LIKE ? AND isDelete = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +search+ "%");
            ps.setBoolean(2, false);
            
            rs = ps.executeQuery();
            
            int id;
            String name;
            TypeDTO dto;
            
            result = new ArrayList<>();
            
            while (rs.next()) {
                id = rs.getInt("typeID");
                name = rs.getString("name");
                
                dto = new TypeDTO(id, name);
                result.add(dto);
            }
        } finally {
            closeConnection();
            return result;
        }
    }
    
    public TypeDTO findByID(int id) throws SQLException, ClassNotFoundException {
        TypeDTO dto = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT name FROM Type WHERE typeID = ? AND isDelete = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setBoolean(2, false);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                String name = rs.getString("name");
                dto = new TypeDTO(id, name);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
}
