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
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import phuctt.dbs.DBConnection;
import phuctt.dtos.AccessoryDTO;

/**
 *
 * @author Thien Phuc
 */
public class InvoiceAccessoryDAO implements Serializable {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    private void closeConnection() throws SQLException {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
    
    public boolean insert(List<AccessoryDTO> list, String buyerUsername) throws SQLException, ClassNotFoundException {
        boolean check = false;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);
            
            String sql = "INSERT INTO Invoice_Accessory(createdTime, buyerUsername, status) VALUES(?,?,?)";
            ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            
            Timestamp createdTime = new Timestamp((new Date()).getTime());
            ps.setTimestamp(1, createdTime);
            ps.setString(2, buyerUsername);
            ps.setInt(3, 0);
            
            check = ps.executeUpdate() > 0;
            
            if (check) {
                rs = ps.getGeneratedKeys();
                
                long invoiceID;
                if (rs.next()) {
                    invoiceID = rs.getLong(1);
                    
                    sql = "INSERT INTO Invoice_Accessory_Detail(accessoryID, invoiceID, quantity, subPrice) VALUES(?,?,?,?)";
                    ps = conn.prepareStatement(sql);
                    
                    for (AccessoryDTO accessoryDTO : list) {
                        ps.setLong(1, accessoryDTO.getId());
                        ps.setLong(2, invoiceID);
                        ps.setInt(3, accessoryDTO.getQuantity());
                        ps.setFloat(4, accessoryDTO.getPrice());
                        
                        check = ps.executeUpdate() > 0;
                        
                        if (!check) {
                            break;
                        }
                    }
                    
                    if (check) {
                        sql = "UPDATE Accessory SET quantity = quantity - ? WHERE accessoryID = ?";
                        ps = conn.prepareStatement(sql);
                        
                        for (AccessoryDTO accessoryDTO : list) {
                            ps.setInt(1, accessoryDTO.getQuantity());
                            ps.setLong(2, accessoryDTO.getId());
                            
                            check = ps.executeUpdate() > 0;
                            
                            if (!check) break;
                        }
                        
                        if (check) {
                            conn.commit();
                        }
                    }
                    
                }
            }
            
        } finally {
            closeConnection();
        }
        return check;
    }
}
