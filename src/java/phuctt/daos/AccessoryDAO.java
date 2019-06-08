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
import java.util.ArrayList;
import java.util.List;
import phuctt.dbs.DBConnection;
import phuctt.dtos.AccessoryDTO;
import phuctt.dtos.CategoryDTO;
import phuctt.dtos.TypeDTO;

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
                    id = rs.getLong(1);
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
    
    public int search(String name, int categoryID, int typeID) throws SQLException, ClassNotFoundException {
        int num = 0;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT count(accessoryID) as num FROM Accessory "
                    + "WHERE name LIKE ? AND categoryID = ? AND forType = ? AND isDelete = ? "
                    + "GROUP BY (accessoryID)";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +name+ "%");
            ps.setInt(2, categoryID);
            ps.setInt(3, typeID);
            ps.setBoolean(4, false);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                num = rs.getInt("num");
            }
        } finally {
            closeConnection();
        }
        return num;
    }
    
    public List<AccessoryDTO> search(String searchName, int categoryID, int typeID, int page) throws SQLException, ClassNotFoundException {
        List<AccessoryDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT accessoryID, name, image, quantity, price FROM Accessory "
                    + "WHERE name LIKE ? AND categoryID = ? AND forType = ? AND isDelete = ? "
                    + "ORDER BY accessoryID OFFSET " +((page-1)*5)+ " ROWS FETCH NEXT 5 ROWS ONLY";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +searchName+ "%");
            ps.setInt(2, categoryID);
            ps.setInt(3, typeID);
            ps.setBoolean(4, false);
            
            rs = ps.executeQuery();
            long id;
            String name, image;
            int quantity;
            float price;
            CategoryDTO category;
            TypeDTO type;
            AccessoryDTO dto;
            
            result = new ArrayList<>();
            
            while (rs.next()) {
                id = rs.getLong("accessoryID");
                name = rs.getString("name");
                image = rs.getString("image");
                quantity = rs.getInt("quantity");
                price = rs.getFloat("price");
                category = (new CategoryDAO()).findByID(categoryID);
                type = (new TypeDAO()).findByID(typeID);
                
                dto = new AccessoryDTO(id, name, image, price, category, quantity, type);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int searchNameCate(String name, int categoryID) throws SQLException, ClassNotFoundException {
        int num = 0;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT count(accessoryID) as num FROM Accessory "
                    + "WHERE name LIKE ? AND categoryID = ? AND isDelete = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +name+ "%");
            ps.setInt(2, categoryID);
            ps.setBoolean(3, false);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                num = rs.getInt("num");
            }
        } finally {
            closeConnection();
        }
        return num;
    }
    
    public List<AccessoryDTO> searchNameCate(String searchName, int categoryID, int page) throws SQLException, ClassNotFoundException {
        List<AccessoryDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT accessoryID, name, image, forType, quantity, price FROM Accessory "
                    + "WHERE name LIKE ? AND categoryID = ? AND isDelete = ? "
                    + "ORDER BY accessoryID OFFSET " +((page-1)*5)+ " ROWS FETCH NEXT 5 ROWS ONLY";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +searchName+ "%");
            ps.setInt(2, categoryID);
            ps.setBoolean(3, false);
            
            rs = ps.executeQuery();
            long id;
            String name, image;
            int quantity;
            float price;
            CategoryDTO category;
            TypeDTO type;
            AccessoryDTO dto;
            
            result = new ArrayList<>();
            
            while (rs.next()) {
                id = rs.getLong("accessoryID");
                name = rs.getString("name");
                image = rs.getString("image");
                quantity = rs.getInt("quantity");
                price = rs.getFloat("price");
                category = (new CategoryDAO()).findByID(categoryID);
                type = (new TypeDAO()).findByID(rs.getInt("forType"));
                
                dto = new AccessoryDTO(id, name, image, price, category, quantity, type);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int searchNameType(String name, int typeID) throws SQLException, ClassNotFoundException {
        int num = 0;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT count(accessoryID) as num FROM Accessory "
                    + "WHERE name LIKE ? AND forType = ? AND isDelete = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +name+ "%");
            ps.setInt(2, typeID);
            ps.setBoolean(3, false);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                num = rs.getInt("num");
            }
        } finally {
            closeConnection();
        }
        return num;
    }
    
    public List<AccessoryDTO> searchNameType(String searchName, int typeID, int page) throws SQLException, ClassNotFoundException {
        List<AccessoryDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT accessoryID, name, image, categoryID, quantity, price FROM Accessory "
                    + "WHERE name LIKE ? AND forType = ? AND isDelete = ? "
                    + "ORDER BY accessoryID OFFSET " +((page-1)*5)+ " ROWS FETCH NEXT 5 ROWS ONLY";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +searchName+ "%");
            ps.setInt(2, typeID);
            ps.setBoolean(3, false);
            
            rs = ps.executeQuery();
            long id;
            String name, image;
            int quantity;
            float price;
            CategoryDTO category;
            TypeDTO type;
            AccessoryDTO dto;
            
            result = new ArrayList<>();
            
            while (rs.next()) {
                id = rs.getLong("accessoryID");
                name = rs.getString("name");
                image = rs.getString("image");
                quantity = rs.getInt("quantity");
                price = rs.getFloat("price");
                category = (new CategoryDAO()).findByID(rs.getInt("categoryID"));
                type = (new TypeDAO()).findByID(typeID);
                
                dto = new AccessoryDTO(id, name, image, price, category, quantity, type);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int searchName(String name) throws SQLException, ClassNotFoundException {
        int num = 0;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT count(accessoryID) as num FROM Accessory "
                    + "WHERE name LIKE ? AND isDelete = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +name+ "%");
            ps.setBoolean(2, false);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                num = rs.getInt("num");
            }
        } finally {
            closeConnection();
        }
        return num;
    }
    
    public List<AccessoryDTO> searchName(String searchName, int page) throws SQLException, ClassNotFoundException {
        List<AccessoryDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT accessoryID, name, image, categoryID, forType, quantity, price FROM Accessory "
                    + "WHERE name LIKE ? AND isDelete = ? "
                    + "ORDER BY accessoryID OFFSET " +((page-1)*5)+ " ROWS FETCH NEXT 5 ROWS ONLY";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" +searchName+ "%");
            ps.setBoolean(2, false);
            
            rs = ps.executeQuery();
            long id;
            String name, image;
            int quantity;
            float price;
            CategoryDTO category;
            TypeDTO type;
            AccessoryDTO dto;
            
            result = new ArrayList<>();
            
            while (rs.next()) {
                id = rs.getLong("accessoryID");
                name = rs.getString("name");
                image = rs.getString("image");
                quantity = rs.getInt("quantity");
                price = rs.getFloat("price");
                category = (new CategoryDAO()).findByID(rs.getInt("categoryID"));
                type = (new TypeDAO()).findByID(rs.getInt("forType"));
                
                dto = new AccessoryDTO(id, name, image, price, category, quantity, type);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}