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
import phuctt.dtos.PetDTO;
import phuctt.dtos.TypeDTO;

/**
 *
 * @author Thien Phuc
 */
public class PetDAO implements Serializable {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    
    public boolean insert(PetDTO dto) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "INSERT INTO Pet(name, birthyear, ownID, typeID, gender, isDelete) VALUES(?,?,?,?,?,?)";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getName());
            ps.setInt(2, dto.getBirthYear());
            ps.setString(3, dto.getOwner().getUsername());
            ps.setInt(4, dto.getType().getId());
            ps.setBoolean(5, dto.isGender());
            ps.setBoolean(6, false);
            
            check = ps.executeUpdate() > 0;
            
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public int searchName(String search, String username) throws SQLException, ClassNotFoundException {
        int num = 0;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT count(petID) as num FROM Pet WHERE name LIKE ? AND isDelete = ? AND ownID = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setBoolean(2, false);
            ps.setString(3, username);

            rs = ps.executeQuery();

            if (rs.next()) {
                num = rs.getInt("num");
            }
        } finally {
            closeConnection();
        }
        return num;
    }
    
    public List<PetDTO> searchName(String search, String username, int page) throws SQLException, ClassNotFoundException {
        List<PetDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT petID, name, birthyear, typeID, gender FROM Pet "
                    + "WHERE name LIKE ? AND isDelete = ? AND ownID = ? "
                    + "ORDER BY petID OFFSET " + ((page - 1) * 5) + " ROWS FETCH NEXT 5 ROWS ONLY";

            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setBoolean(2, false);
            ps.setString(3, username);

            rs = ps.executeQuery();

            long id;
            String name;
            boolean gender;
            int birthyear, typeID;
            TypeDTO type;
            PetDTO dto;
            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getLong("petID");
                
                name = rs.getString("name");
                birthyear = rs.getInt("birthyear");
                
                typeID = rs.getInt("typeID");
                type = (new TypeDAO()).findByID(typeID);
                
                gender = rs.getBoolean("gender");

                dto = new PetDTO(name, null, birthyear, type, gender);
                dto.setId(id);
                
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean belongTo(String username, long id) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT name FROM Pet WHERE petID = ? AND ownID = ?";
            ps = conn.prepareStatement(sql);
            ps.setLong(1, id);
            ps.setString(2, username);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                check = true;
            }
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean delete(long id) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "UPDATE Pet SET isDelete = ? WHERE petID = ?";
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setLong(2, id);
            
            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean update(PetDTO dto) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "UPDATE Pet SET name = ?, birthyear = ?, gender = ?, typeID = ? WHERE petID = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getName());
            ps.setInt(2, dto.getBirthYear());
            ps.setBoolean(3, dto.isGender());
            ps.setInt(4, dto.getType().getId());
            ps.setLong(5, dto.getId());
            
            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public PetDTO findByID(long id) throws SQLException, ClassNotFoundException {
        PetDTO dto = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT name, birthyear, typeID, gender FROM Pet WHERE petID = ?";
            ps = conn.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                String name = rs.getString("name");
                int birthYear = rs.getInt("birthyear");
                TypeDTO type = (new TypeDAO()).findByID(rs.getInt("typeID"));
                boolean gender = rs.getBoolean("gender");
                
                dto = new PetDTO(name, null, birthYear, type, gender);
                dto.setId(id);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
}
