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
import phuctt.dtos.StaffDTO;

/**
 *
 * @author Thien Phuc
 */
public class StaffDAO implements Serializable {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    private void closeConnection() throws SQLException {
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

    public int add(StaffDTO dto) throws SQLException, ClassNotFoundException {
        int id = -1;
        try {
            conn = DBConnection.getConnection();

            String sql = "INSERT INTO Staff(staffName, isAvailable, gender, isDelete) VALUES(?,?,?,?)";
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, dto.getName());
            ps.setBoolean(2, dto.isAvailable());
            ps.setBoolean(3, dto.isGender());
            ps.setBoolean(4, false);
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

            String sql = "UPDATE Staff SET image = ? WHERE staffID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, image);
            ps.setInt(2, id);

            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<StaffDTO> searchByLikeName(String search) throws SQLException, ClassNotFoundException {
        List<StaffDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT staffID, staffName, image, isAvailable, gender FROM Staff WHERE staffName LIKE ? AND isDelete = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setBoolean(2, false);

            rs = ps.executeQuery();

            int id;
            String name, image;
            boolean available, gender;
            StaffDTO dto;
            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getInt("staffID");
                name = rs.getString("staffName");
                image = rs.getString("image");
                available = rs.getBoolean("isAvailable");
                gender = rs.getBoolean("gender");

                dto = new StaffDTO(name, available, gender);
                dto.setImage(image);
                dto.setId(id);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int searchName(String search) throws SQLException, ClassNotFoundException {
        int num = 0;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT count(staffID) as num FROM Staff WHERE staffName LIKE ? AND isDelete = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
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

    public List<StaffDTO> searchName(String search, int page) throws SQLException, ClassNotFoundException {
        List<StaffDTO> result = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT staffID, staffName, image, isAvailable, gender FROM Staff "
                    + "WHERE staffName LIKE ? AND isDelete = ? "
                    + "ORDER BY staffID OFFSET " + ((page - 1) * 5) + " ROWS FETCH NEXT 5 ROWS ONLY";

            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setBoolean(2, false);

            rs = ps.executeQuery();

            int id;
            String name, image;
            boolean available, gender;
            StaffDTO dto;
            result = new ArrayList<>();

            while (rs.next()) {
                id = rs.getInt("staffID");
                name = rs.getString("staffName");
                image = rs.getString("image");
                available = rs.getBoolean("isAvailable");
                gender = rs.getBoolean("gender");

                dto = new StaffDTO(name, available, gender);
                dto.setImage(image);
                dto.setId(id);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean setAvailableStaff(int id, boolean status) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();

            String sql = "UPDATE Staff SET isAvailable = ? WHERE staffID = ?";

            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, status);
            ps.setInt(2, id);

            check = ps.executeUpdate() > 0;

        } finally {
            closeConnection();
        }
        return check;
    }

    public StaffDTO findByID(int id) throws SQLException, ClassNotFoundException {
        StaffDTO dto = null;
        try {
            conn = DBConnection.getConnection();

            String sql = "SELECT staffName, image, isAvailable, gender FROM Staff WHERE staffID = ? AND isDelete = ?";

            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setBoolean(2, false);

            rs = ps.executeQuery();

            if (rs.next()) {
                String staffName = rs.getString("staffName");
                String image = rs.getString("image");
                boolean available = rs.getBoolean("isAvailable");
                boolean gender = rs.getBoolean("gender");

                dto = new StaffDTO(staffName, available, gender);
                dto.setImage(image);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean update(StaffDTO dto) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();

            String sql = "UPDATE Staff SET staffName = ?, isAvailable = ?, gender = ? WHERE staffID = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getName());
            ps.setBoolean(2, dto.isAvailable());
            ps.setBoolean(3, dto.isGender());
            ps.setInt(4, dto.getId());

            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean delete(int id) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);

            String sql = "UPDATE Staff SET isDelete = ? WHERE staffID = ?";
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setInt(2, id);

            check = ps.executeUpdate() > 0;

            if (check) {
                sql = "UPDATE Staff_Service_Detail SET isDelete = ? WHERE staffID = ?";

                ps = conn.prepareStatement(sql);
                ps.setBoolean(1, true);
                ps.setInt(2, id);

                check = ps.executeUpdate() > 0;
                
                if (check) {
                    conn.commit();
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }
}
