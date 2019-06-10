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
import phuctt.dtos.ServiceStaffDTO;

/**
 *
 * @author Thien Phuc
 */
public class ServiceStaffDAO implements Serializable {

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

    public boolean add(ServiceStaffDTO dto) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();

            String sql = "INSERT INTO Staff_Service_Detail(staffID, serviceID, isDelete) VALUES(?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, dto.getStaffID());
            ps.setInt(2, dto.getServiceID());
            ps.setBoolean(3, false);

            check = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            if (e.getMessage().contains("duplicate")) {
                String sql = "UPDATE Staff_Service_Detail SET isDelete = ? WHERE staffID = ? AND serviceID = ?";

                ps = conn.prepareStatement(sql);
                ps.setBoolean(1, false);
                ps.setInt(2, dto.getStaffID());
                ps.setInt(3, dto.getServiceID());
                
                check = ps.executeUpdate() > 0;
            } else {
                throw e;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean deleteService(int serviceID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();

            String sql = "UPDATE Staff_Service_Detail SET isDelete = ? WHERE serviceID = ?";

            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setInt(2, serviceID);

            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean deleteStaff(int staffID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();

            String sql = "UPDATE Staff_Service_Detail SET isDelete = ? WHERE staffID = ?";

            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setInt(2, staffID);

            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public List<Integer> findByService(int id) throws SQLException, ClassNotFoundException {
        List<Integer> result = null;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "SELECT staffID FROM Staff_Service_Detail WHERE serviceID = ? AND isDelete = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setBoolean(2, false);
            
            rs = ps.executeQuery();
            
            result = new ArrayList<>();
            
            while (rs.next()) {
                result.add(rs.getInt("staffID"));
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
