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
