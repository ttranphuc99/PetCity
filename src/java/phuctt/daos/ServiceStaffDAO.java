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
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public boolean add(ServiceStaffDTO dto) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            
            String sql = "INSERT INTO Staff_Service_Detail(staffID, serviceID) VALUES(?,?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, dto.getStaffID());
            ps.setInt(2, dto.getServiceID());
            
            check = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
